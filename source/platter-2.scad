
%cube([200,200,1],center=true);


translate([60,58,0]) rotate([0,0,90]) import("../metric-prusa-lm8uu/z-motor-mount-barclamp.stl");
translate([-60,-72,0]) rotate([0,0,90]) import("../metric-prusa-lm8uu/z-motor-mount-barclamp.stl");

translate([10,-60,0]) rotate([0,0,-90]) import("../metric-prusa-lm8uu/ybrac-t.stl");

translate([-15,45,0]) {
	translate([-4,3,0]) rotate([0,0,180]) import("../metric-prusa-lm8uu/x-end-idler.stl");
	translate([-4,-40,0]) rotate([0,0,180]) import("../metric-prusa-lm8uu/x-end-motor.stl");
}

translate([60,-8,0]) import("../metric-prusa-lm8uu/gregs-herringbone-big.stl");

translate([50,-80,0]) import("../metric-prusa-lm8uu/z-rod-stab.stl");
translate([-81,20,0]) rotate([0,0,90]) import("../metric-prusa-lm8uu/z-rod-stab.stl");


*translate([83,-43,0]) rotate([0,0,-90]) mirror([0,1,0]) import("../metric-prusa-lm8uu/power-supply-mount.stl");
*translate([-83,50,0]) rotate([0,0,-90]) import("../metric-prusa-lm8uu/power-supply-mount.stl");
*translate([-73,75,0]) rotate([0,0,90]) mirror([0,0,0]) import("../metric-prusa-lm8uu/power-supply-mount.stl");
*translate([75,-83.5,0]) import("../metric-prusa-lm8uu/power-supply-mount.stl");


*translate([-3,-25,0]) rotate([0,0,-60]) import("../metric-prusa-lm8uu/arduino-mount.stl");
*translate([-28,-12,0]) rotate([0,0,-135]) import("../metric-prusa-lm8uu/arduino-mount.stl");
*translate([-10,95,0]) rotate([0,0,180]) rotate([0,0,-180]) mirror([0,1,0]) import("../metric-prusa-lm8uu/arduino-mount.stl");