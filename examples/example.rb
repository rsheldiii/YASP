#example
require_relative '../lib/yasp'

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
