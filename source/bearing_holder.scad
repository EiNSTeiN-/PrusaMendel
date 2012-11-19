// PRUSA iteration3
// Y drivetrain (idler and stepper holders)
// GNU GPL v3
// Josef Průša <josefprusa@me.com>
// Václav 'ax' Hůla <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

//include <configuration.scad>
include <inc/functions.scad>

idler_width = 8;
idler_size_inner_r = 4.5;
single_wall_width = 0.3*2.2;
idler_size = 22;

module idlermount() {
	difference() {
		union() {
			difference() {
				// The body
				translate([0,0,0]) cube_fillet([16,31,10+idler_width], vertical = [0,0,0,0], top = [3,0,3,0], bottom = [3,0,3,0]);

				translate([8,8,4]) {
					// the fake bearing
					%translate([0,0,1]) cylinder(h = idler_width, r=(idler_size/2)+2*single_wall_width);
					// The bearing slot
					cylinder(h = idler_width+2, r=(idler_size/2)+8);
				}
			}
			
			// The two bumps around the center of the bearing
			translate([8,8,4]) cylinder(r1=15/2, r2=12/2,h=1);
			translate([8,8,idler_width+6]) rotate([0,180,0]) cylinder(r1=15/2, r2=12/2,h=1);
		}
		
		// the rod hole
		translate([8,8,-1]) polyhole(h = 120, d=idler_size_inner_r*2);
	}
}

rotate([0,-90,0]) idlermount();

