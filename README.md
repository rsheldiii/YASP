# YASP, Yet Another SCAD Program

YASP is a dead simple OpenSCAD DSL in Ruby

## install

`gem install yasp`

## Why

There are other DSLs, but they try to do too much, and their code is kind of confusing. Those aren't the greatest justifications for making a new one (hence the name) but YASP focuses on being as simple, predictable, and explicit as possible. In addition, YASP has the ability to save partial trees to variables, if that's your kind of thing.

## Design

YASP has four classes:
* Yasp, in charge of the various output methods (string, stdout, file)
* YaspClass, the core of yasp, is an AST builder and evaluator that can be extended
* YaspBlock, a YaspClass that processes a block
* Command, a class that represents an SCAD directive (primitive or operation) and its variables and children

OpenSCAD abstracts very cleanly into a tree of Commands, so almost everything in YASP boils down to that.

## Caveats

* children must always be scoped within a block. YASP can't understand `translate([1,2,3]) cube(4)`, it needs to be in the form `translate([1,2,3]) { cube(4) }` (or of course `translate([1,2,3]) do cube(4) end`). supporting `translate([1,2,3]).cube(4)` could be possible in the future!
* Yasp does absolutely no validation for you, and will dutifully print your `trnaslate` block or add children to a `cube` primitive
* OpenSCAD module and function definitions, as well as special variables and for loops, are currently not supported. Modules and functions are meant to be superseded by Ruby modules and functions; special variables could definitely be implemented for later, but for now they can be used in primitive arguments by passing a string key: `sphere(r: 12, '$fn': 24)`. For loops are again meant to be superseded by Ruby list comprehension.
* if you want to save a block of code for later, you need to wrap it in a `Yasp.parse` block and later reference it's value by using the `add` function (see the example for an example). This is a design decision; in order to support not having to use the `add` function around every command, method_missing immediately adds a command to the AST. using `parse` initializes an entirely new, separate tree from that block, and then returns the resulting AST. That's great, but referencing it will never hit method_missing, so you need to manually add it to the AST by calling `add`

## Example

```
require 'yasp'

class RoundedCube < YaspClass

  MINKOWSKI_RADIUS = 2

  def initialize(size)
    super()
    minkowski do
      cube(size - MINKOWSKI_RADIUS)
      sphere(r: MINKOWSKI_RADIUS)
    end
  end
end

Yasp.file('scad.scad') do

  # you can load Commands into variables!
  sphere = Yasp.parse do
    sphere(3)
  end

  # and functions!
  def square_at(position)
    translate(position) do
      cube(6, center = true)
    end
  end

  # and use them wherever you'd like!
  5.times do |y|
    translate([y*10, 0,0]) do
      rotate([-y * 15, 0, 0]) do
        cylinder(r: 3, h: 10, '$fn' => 10 * y)
        # anything that returns Commands must directly use the
        # add() function, since method_missing can't catch them.
        add(sphere);
        square_at([0,0,y])
        translate([0,0,10]) { add(RoundedCube.new(5)) }
      end
    end
  end
end
```

That should be it, hit me up with any questions!
