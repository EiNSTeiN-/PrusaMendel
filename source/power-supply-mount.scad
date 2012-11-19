// PRUSA Mendel  
// Endstop holder
// Used to attach endstops to 8mm rods
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
include <inc/functions.scad>

/**
 * @id endstop-holder
 * @name Endstop holder
 * @category Printed
 * @using 1 m3x20xhex
 * @using 1 m3nut
 * @using 2 m3washer
 */
module powersupply_mount() {
	outer_diameter = m8_diameter/2+3.3;
	screw_hole_spacing = 38;
	opening_size = m8_diameter-1.5; //openingsize
	lower_offset=0;

	difference() {
		union() {

			translate([outer_diameter, outer_diameter, 0]) cylinder(h =10, r = outer_diameter, $fn = 20);
			translate([outer_diameter, 0, 0]) cube([15.5,outer_diameter*2,10]);
			translate([-40, -lower_offset, 0]) cube([48, 4, 10]);
			*translate([-7, -lower_offset, 0]) rotate([0,0,50]) cube([23, 4, 10]);
			translate([17, 17.5, 5]) rotate([90, 0, 0]) cylinder(h =5, r = 5.77, $fn = 6);
		}

		translate([9, outer_diameter-opening_size/2, 0]) cube([18,opening_size,20]);
		translate([outer_diameter, outer_diameter, 0]) cylinder(h =20, r = m8_diameter/2, $fn = 18);

		//Securing hole
		translate([17, 17, 5]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = 10);
		translate([17, 19.5, 5]) rotate([90, 0, 0]) 
			nut(h =5, d = m3_nut_diameter_horizontal);

		translate([17, 17, 5]) rotate([90, 0, 0]) 
			polyhole(h = 20, d = m3_diameter);
		translate([-10+7, 17-lower_offset, 5]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = 10);
		translate([-42+7, 5-lower_offset, 5-(m3_diameter/2)]) rotate([90, 0, 0]) cube([screw_hole_spacing-m3_diameter*1.5,m3_diameter,6]) ;
		translate([-(4+screw_hole_spacing)+7, 17-lower_offset, 5]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = 10);
	}
}

powersupply_mount();

