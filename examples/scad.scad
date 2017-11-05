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
