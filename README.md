# YASP, Yet Another SCAD Program

YASP is a dead simple OpenSCAD DSL in Ruby

## install

`gem install yasp`

## Why

There are other DSLs, but they try to do too much, and their code is kind of confusing. Those aren't the greatest justifications for making a new one (hence the name) but YASP focuses on being as simple, predictable, and explicit as possible. In addition, YASP has the ability to save partial trees to variables, if that's your kind of thing.

## Design

YASP has three classes:
* Yasp, in charge of the various output methods (string, stdout, file)
* YaspTree, the core of yasp, is an AST builder and evaluator
* Command represents an SCAD directive (primitive or operation) and its variables and children

As of writing these classes comprise all of the 136 lines of code used to run YASP
## Caveats

* children must always be scoped within a block. YASP can't understand `translate([1,2,3]) cube(4)`, it needs to be in the form `translate([1,2,3]) { cube(4) }` (or of course `translate([1,2,3]) do cube(4) end`)
* Yasp does absolutely no validation for you, and will dutifully print your `trnaslate` block or add children to a `cube` primitive
* OpenSCAD module and function definitions, as well as special variables and for loops, are currently not supported. Modules and functions are meant to be superseded by Ruby modules and functions; special variables could definitely be implemented for later, but for now they can be used in primitive arguments by passing a string key: `sphere(r: 12, '$fn': 24)`. For loops are again meant to be superseded by Ruby list comprehension.
* if you want to save a block of code for later, you need to wrap it in an `assign` block and later reference it's value by using the `add` function (see the example for an example). in order to support not having to use the `add` function around every command, method_missing immediately adds a command to the AST. using `assign` initializes an entirely new, separate YaspTree from that block, and then returns the resulting AST. That's great, but referencing the variable (or function) will never hit method_missing, so you need to manually add it to the AST by calling `add`

## Example

```
require 'yasp'

Yasp.file('scad.scad') do

  # you can load Commands into variables!
  sphere = assign do
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
        cylinder(r: 3, h: 10, '$fn': 10 * y)
        # anything that returns Commands must directly use the
        # add() function, since method_missing can't catch them.
        add(sphere);
        square_at([0,0,y])
      end
    end
  end
end
```

produces:

```
translate([0, 0, 0]){
  rotate([0, 0, 0]){
    cylinder(r=3, h=10, $fn=0);
    sphere(3);
    translate([0, 0, 0]){
      cube(6, true);
    };
  };
};
translate([10, 0, 0]){
  rotate([-15, 0, 0]){
    cylinder(r=3, h=10, $fn=10);
    sphere(3);
    translate([0, 0, 1]){
      cube(6, true);
    };
  };
};
translate([20, 0, 0]){
  rotate([-30, 0, 0]){
    cylinder(r=3, h=10, $fn=20);
    sphere(3);
    translate([0, 0, 2]){
      cube(6, true);
    };
  };
};
translate([30, 0, 0]){
  rotate([-45, 0, 0]){
    cylinder(r=3, h=10, $fn=30);
    sphere(3);
    translate([0, 0, 3]){
      cube(6, true);
    };
  };
};
translate([40, 0, 0]){
  rotate([-60, 0, 0]){
    cylinder(r=3, h=10, $fn=40);
    sphere(3);
    translate([0, 0, 4]){
      cube(6, true);
    };
  };
};
```

That should be it, hit me up with any questions!
