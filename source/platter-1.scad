
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

	translate([72,-12,0]) barclamp();

	translate([82,78,0]) endstop();
	translate([18,78,0]) endstop();

	translate([73,-61,13]) rotate([0,-90,180]) mount();

}

translate([68,-97,0]) rotate([0,0,90]) barclamp();
translate([-68,18,0]) rotate([0,0,0]) barclamp();

translate([22,-84,0]) rotate([0,0,90])  {
	translate([0, 14, 4]) coupling(c=0);
	translate([0, -14, 4]) coupling(c=1);
}
translate([55,-42,0]) rotate([0,0,0])  {
	translate([0, 14, 4]) coupling(c=0);
	translate([0, -14, 4]) coupling(c=1);
}

translate([-28,66,0]) Wades_double_helix(small=true);

translate([-6,84,0]) rotate([0,0,0]) ybushing(true);
translate([-50,84,0]) rotate([0,0,0]) ybushing(true);
translate([-50,50,0]) rotate([0,0,0]) ybushing(true);

//translate([-63,-26,0]) rotate([0,0,90]) import("gregs-herringbone-small_fixed.stl");
