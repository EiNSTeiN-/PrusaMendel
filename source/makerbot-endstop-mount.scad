// Makerbot end stop mount for M8 rods by Patrick Sapinski
// V1.0
// with code from printrbot Y axis bar end with end-stop trigger by clayb.rpi@gmail.com

$fn=24;

module tear(r, h) {
  union() {
    cylinder(r=r, h=h);
    rotate([0, 0, 135]) cube([r, r, h]);
  }
}

difference() {
  union() {
		translate([1,.5,0])
		cube([15, 11.2, 7]);

		translate([-12, 17, 0])
		cube([24, 2.5, 7]);

		translate([-11.5, 19.2, 0])
		cylinder(r=.7, h=7);

		translate([10,19.6, 4.5])
		sphere(r=3/2);

		translate([8.4, 11.2, 0])
		cylinder(r=16 / 2, h=7);
  }

	translate([-0.1, 4.9, 3.3])
	rotate([0, 90, 0])
	tear(r=3.1 / 2, h=23);

	translate([8.4, 11.2, -1])
	cylinder(r=4.2, h=10);

	translate([4.7, -1, -1])
	cube([7.2, 11.2, 10]);

		translate([-9, 21, 4.5])
		rotate([90, 0, 0])
		cylinder(r=3/2, h=9);

  translate([3.9, -5, -1])
  cylinder(r=1.5, h=6);
}
