
use <z-motor-mount-barclamp.scad>;
use <ybrac-t.scad>;
use <x-end-idler.scad>;
use <x-end-motor.scad>;
use <Wades_Gears_helix.scad>;
use <jme-z-rod-stab.scad>;
use <arduino-brackets.scad>;
use <power-supply-mount.scad>;

%cube([200,200,1],center=true);

scale(1) {
translate([72,-60,0]) rotate([0,0,180]) translate(v=[0,0,8]) rotate ([0,0,0]) zmotormount();
translate([-72,-57,0]) rotate([0,0,0]) translate(v=[0,0,8]) rotate ([0,0,0]) zmotormount();

translate([0,-35,0]) rotate([0,0,-90]) mirror() ybract();

translate([-17,60,0]) {
	translate([-4,6,0]) rotate([0,0,180]) xendidler(linear=true);
	translate([-4,-40,0]) rotate([0,0,180]) xendmotor(linear=true);
}

translate([55,18,0]) Wades(small=false);

translate([-20,-82,0]) rotate([0,0,180]) z_rod_stab();
translate([-84,30,0]) rotate([0,0,90]) z_rod_stab();

translate([20,-55,0]) mirror([1,0,0]) endstop();
translate([-75,60,0]) rotate([0,0,-90]) endstop();
translate([-57,74,0]) rotate([0,0,90]) endstop();
translate([-77,74,0]) rotate([0,0,90]) endstop();

translate([62,60,0]) {
powersupply_mount();
translate([-17,23,0]) rotate([0,0,180]) powersupply_mount();
}
}

/*
translate([20,-55,0]) mirror([1,0,0]) import("../metric-prusa-lm8uu/arduino-mount.stl");
translate([-72,55,0]) rotate([0,0,-90]) import("../metric-prusa-lm8uu/arduino-mount.stl");
translate([-55,68,0]) rotate([0,0,90]) import("../metric-prusa-lm8uu/arduino-mount.stl");
translate([-75,68,0]) rotate([0,0,90]) import("../metric-prusa-lm8uu/arduino-mount.stl");
*/
