
use <belt-clamp_GT2.scad>;
use <llluis-gregs-new-x-carriage-double.scad>;
use <jonaskuehling_gregs-wade-v3.scad>;

%cube([200,200,1],center=true);

dual=true;

for(angle=(dual ? [0,180] : 0))
	rotate([0,0,angle]) translate([-14,0,0]) {
	translate([54,-5,0]) rotate([0,0,90]) beltclamp();
	translate([42,-5,0]) rotate([0,0,90]) beltclamp();
	translate([30,-5,0]) rotate([0,0,90]) beltclamp();
	translate([95,15,0]) rotate([0,0,90]) wade_all();
	translate([45,-58,0]) rotate([0,0,90]) x_carriage();
}
