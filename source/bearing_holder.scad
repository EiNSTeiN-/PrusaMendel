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

module idlermount(support=false){
	difference() {
	union() {
    difference(){
        union(){
            //translate([8,8,0]) cylinder(h = 19, r=8);
            //translate([8,33,0]) cylinder(h = 19, r=8);
            translate([0,0,0]) cube_fillet([16,31,10+idler_width], vertical = [0,0,0,0], top = [3,0,3,0], bottom = [3,0,3,0]);
        }
        //translate([8,33,-1]) cylinder(h = 25, r=4.5);

        translate([8,8,4]) {
            *%translate([0,0,1]) cylinder(h = idler_width, r=(idler_size/2)+2*single_wall_width);
            cylinder(h = idler_width+2, r=(idler_size/2)+8);
        }
    }

	translate([8,8,4]) cylinder(r1=15/2, r2=12/2,h=1);
	translate([8,8,idler_width+6]) rotate([0,180,0]) cylinder(r1=15/2, r2=12/2,h=1);
	}
    translate([8,8,-1]) cylinder(h = 120, r=idler_size_inner_r);
	}
    if (support) {
        translate([0,-2,15]) cube([16,16,0.4]);
        translate([0,-2,0]) cube([16,1.3,15]);
    }

}

rotate([0,-90,0]) idlermount();

