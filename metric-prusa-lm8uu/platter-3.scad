
%cube([200,200,1],center=true);

dual=true;

for(angle=(dual ? [0,180] : 0))
	rotate([0,0,angle]) translate([-14,0,0]) {
	translate([54,-5,0]) rotate([0,0,90]) import("belt-clamp_GT2.stl");
	translate([42,-5,0]) rotate([0,0,90]) import("belt-clamp_GT2.stl");
	translate([30,-5,0]) rotate([0,0,90]) import("belt-clamp_GT2.stl");
	translate([95,15,0]) rotate([0,0,90]) import("gregs-jhead_mount.stl");
	translate([45,-58,0]) rotate([0,0,90]) import("x-carriage-doublefan.stl");
}
