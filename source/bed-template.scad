
bed_length_x = 220;
bed_length_y = 220;

corner_hole_spacing_x = 210;
corner_hole_spacing_y = 208;

bearing_holes_spacing = 27;
bearing_positions = [
	[-(bed_length_x/2)+40,(bed_length_y/2)-75],
	[-(bed_length_x/2)+40,-(bed_length_y/2)+75],
	[bed_length_x/2-40,0]];

belt_clamp_spacing = 18;
belt_clamp_positions = [
	[0,(bed_length_y/2)-90],
	[0,-(bed_length_y/2)+90]];

bed_height = 6;
m3_size = 3.5;

difference() {
	cube([bed_length_x,bed_length_y,bed_height], center=true);
	corner_holes();
	bearing_holes();
	belt_clamps();
}

module corner_holes() {
	translate([corner_hole_spacing_x/2,corner_hole_spacing_y/2,0]) m3();
	translate([corner_hole_spacing_x/2,-corner_hole_spacing_y/2,0]) m3();
	translate([-corner_hole_spacing_x/2,corner_hole_spacing_y/2,0]) m3();
	translate([-corner_hole_spacing_x/2,-corner_hole_spacing_y/2,0]) m3();
}

module bearing_holes() {
	for(pos=bearing_positions)
		translate([pos[0],pos[1],0]) single_bearing_hole();
}

module belt_clamps() {
	for(pos=belt_clamp_positions)
		translate([pos[0],pos[1],0]) single_belt_clamp();
}

module single_bearing_hole() {
	for(i=[1,-1])
		translate([i*bearing_holes_spacing/2,0,0]) m3();
}

module single_belt_clamp() {
	for(i=[1,-1])
		translate([i*belt_clamp_spacing/2,0,0]) m3();
}

module m3() cylinder(h=bed_height, r=m3_size/2, center=true);