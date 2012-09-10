
%cube([200,200,1],center=true);

translate([80,-100,0]) rotate([0,0,45]) import_stl("bar-clamp.stl");
translate([-8,-99,0]) import_stl("bar-clamp.stl");
translate([-85,72,0]) rotate([0,0,90]) import_stl("bar-clamp.stl");

translate([-10,-3,0]) {
	translate([38,-41,0]) import_stl("bar-clamp.stl");
	translate([34,-57,0]) import_stl("bar-clamp.stl");
	translate([0,0,0]) import_stl("frame-vertex-neo-foot.stl");
	translate([-32,-18,0]) import_stl("frame-vertex-neo-foot.stl");
	translate([28,21,0]) rotate([0,0,60]) import_stl("frame-vertex-neo-foot.stl");
	translate([52,-16,0]) rotate([0,0,180]) import_stl("frame-vertex-neo-foot.stl");
	translate([27,-28,0]) rotate([0,0,-60]) import_stl("frame-vertex-neo-top.stl");
	translate([15,19,0]) rotate([0,0,140]) import_stl("frame-vertex-neo-top.stl");
}

translate([82,15,0]) import_stl("coupling.stl");
translate([-56,85,0]) rotate([0,0,90]) import_stl("coupling.stl");

translate([-85,21.5,0]) rotate([0,0,90]) import_stl("gregs-herringbone-small.stl");

translate([-65,-85,0]) rotate([0,0,90]) import_stl("lower-z-mount.stl");
translate([-65,-55,0]) rotate([0,0,90]) import_stl("lower-z-mount.stl");

translate([-10,-80,0]) rotate([0,0,90]) mirror([180,0,0]) import_stl("makerbot-endstop-mount.stl");
translate([-50,-19.5,0]) rotate([0,0,180]) mirror([180,0,0]) import_stl("makerbot-endstop-mount.stl");
translate([80,65.5,0]) rotate([0,0,180]) mirror([180,0,0]) import_stl("makerbot-endstop-mount.stl");
translate([-80,11,0]) rotate([0,0,180]) import_stl("makerbot-endstop-mount.stl");

translate([80,84,0]) rotate([0,0,180]) mirror([180,0,0]) import_stl("y-bushing.stl");
translate([-78,-25,0]) rotate([0,0,180]) mirror([180,0,0]) import_stl("y-bushing.stl");
translate([-84,52,0]) rotate([0,0,90]) mirror([180,0,0]) import_stl("y-bushing.stl");
