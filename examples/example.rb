#example
require_relative '../lib/yasp'

Yasp.file('scad.scad') do

  # you can load Commands into variables!
  sq = assign do
    sphere(3)
  end

  # and functions!
  def square_at(position)
    assign do
      translate(position) do
        cube(6, center = true)
      end
    end
  end

  # and use them wherever you'd like!
  5.times do |y|
    translate([0,y*10,0]) do
      rotate([0, y * 15, 0]) do
        cylinder(r: 3, h: 10, '$fn': 100)
        # variables and functions that return Commands must directly use the
        # add() function, since method_missing can't catch them.
        add(sq);
        add(square_at([0,0,y]))
      end
    end
  end
end
