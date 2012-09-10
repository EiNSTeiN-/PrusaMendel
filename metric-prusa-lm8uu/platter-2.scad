
%cube([200,200,1],center=true);


translate([60,58,0]) rotate([0,0,90]) import("z-motor-mount-barclamp.stl");
translate([-60,-72,0]) rotate([0,0,90]) import("z-motor-mount-barclamp.stl");

translate([10,-60,0]) rotate([0,0,-90]) import("ybrac-t.stl");

translate([-15,45,0]) {
	translate([-4,3,0]) rotate([0,0,180]) import("x-end-idler.stl");
	translate([-4,-40,0]) rotate([0,0,180]) import("x-end-motor.stl");
}

translate([60,-8,0]) import("gregs-herringbone-big.stl");