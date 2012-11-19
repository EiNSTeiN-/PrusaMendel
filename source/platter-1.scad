
use <frame-vertex-neo.scad>;
use <bar-clamp.scad>;
use <makerbot-endstop-mount.scad>;
use <parametric_lower_z_mount.scad>;
use <coupling.scad>;
use <y-bushing.scad>;
use <Wades_Gears_helix.scad>;

%cube([200,200,1],center=true);

left();
rotate([0,0,180]) left();

module left() {
	translate([-42,-8,0]) vertex(with_foot=false);
	translate([-10,11,0]) vertex(with_foot=true);
	translate([22,30,0]) vertex(with_foot=true);

	translate([62,-12,0]) barclamp();

	//translate([82,78,0]) endstop();
	translate([18,78,0]) endstop();

	translate([76,-60,0]) rotate([0,0,180]) mount();
}

translate([-58,16,0]) rotate([0,0,0]) barclamp();
translate([-58,31,0]) rotate([0,0,0]) barclamp();

translate([27,-84,0]) rotate([0,0,90])  {
	translate([8, 14, 4]) coupling(c=0);
	translate([0, -16, 4]) rotate([0,0,90]) coupling(c=1);
}
translate([43,-42,0]) rotate([0,0,0])  {
	translate([0, 14, 4]) coupling(c=0);
	translate([0, -14, 4]) coupling(c=1);
}

translate([-39,56,0]) Wades_double_helix(small=true);

translate([-2,92,0]) rotate([0,0,0]) ybushing(true);
translate([-40,96,0]) rotate([0,0,0]) ybushing(true);
translate([-30,68,0]) rotate([0,0,180]) ybushing(true);
