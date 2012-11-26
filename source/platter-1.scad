
use <frame-vertex-neo.scad>;
use <bar-clamp.scad>;
use <makerbot-endstop-mount.scad>;
use <parametric_lower_z_mount.scad>;
use <coupling.scad>;
use <y-bushing.scad>;
use <Wades_Gears_helix.scad>;

module left() {
	translate([-42,-8,0]) vertex(with_foot=false);
	translate([-10,11,0]) vertex(with_foot=true);
	translate([22,30,0]) vertex(with_foot=true);

	translate([62,-12,0]) barclamp();

	translate([18,78,0]) endstop();

	translate([76,-60,0]) rotate([0,0,180]) mount();
}

scale(1) {
    %cube([200,200,1],center=true);

    left();
    rotate([0,0,180]) left();

    translate([-58,16,0]) rotate([0,0,0]) barclamp();
    translate([-30,31,0]) rotate([0,0,90]) barclamp();

    translate([-45,80,0]) rotate([0,0,180]) endstop();

    translate([27,-84,0]) rotate([0,0,90])  {
        translate([8, 14, 4]) coupling(c=0);
        translate([0, -16, 4]) rotate([0,0,90]) coupling(c=1);
    }
    translate([43,-42,0]) rotate([0,0,0]) {
        translate([0, 14, 4]) coupling(c=0);
        translate([0, -14, 4]) coupling(c=1);
    }

    translate([-57, 41, 0]) Wades(small=true);

    translate([-3,91,0]) rotate([0,0,180]) ybushing(true);
    translate([-34,96,0]) rotate([0,0,180]) ybushing(true);
    translate([-24,65,0]) rotate([0,0,0]) ybushing(true);
}