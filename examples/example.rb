#example
require_relative '../lib/yasp'

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
