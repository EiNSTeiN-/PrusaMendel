// PRUSA Mendel  
// Frame vertex
// GNU GPL v2
// Greg Frost
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

// Based on http://www.thingiverse.com/thing:2003 aka Viks footed 
// frame vertex, which is based on http://www.thingiverse.com/thing:1780 
// aka Tonokps parametric frame vertex
// Thank you guys for your great work

include <configuration.scad>

basefoot=true;

vfvertex_height=m8_diameter+5;

vertex(with_foot=basefoot);

module teardrop (r=8, h=20) {
	rotate([-270, 0, 90]) {
		cylinder(r=r, h=h, $fn=64);
		translate([-(r * sqrt(2)) / 2, 0, 0]) cube([r * sqrt(2), r * sqrt(2) / 2, h]);
		difference() {
			rotate([0, 0, 45]) cube([r, r, h]);
			translate([-r, r, -1]) cube([2 * r, r, h + 2]);
		}
	}
}

/**
 * @id frame-vertex
 * @name Frame vertex
 * @category Printed
 * @id frame-vertex
 * @using 8 m8nut
 * @using 8 m8washer
 */
/**
 * @id frame-vertex-foot
 * @name Frame vertex with foot
 * @category Printed
 * @id frame-vertex-foot
 * @using 8 m8nut
 * @using 8 m8washer
 */

hole_separation=58.5;
vertex_end_major_d=30.15;
vertex_end_minor_d=18.5;
vertex_horizontal_hole_offset=11.75;
hole_flat_radius=8.5; // flat surface around holes.
foot_depth=26.25;
end_round_translation=vertex_horizontal_hole_offset-hole_flat_radius;

border_size = (vfvertex_height - m8_diameter) / 2;
membrane_thickness = 2;

curve_start_height = vertex_horizontal_hole_offset + m8_diameter/2 + border_size;

module vertex(with_foot=basefoot)
{
	difference ()
	{
		union ()
		{
			intersection() {
				translate([10, -50, (vfvertex_height - membrane_thickness) / 2]) cube([hole_separation + vertex_end_major_d / 2, 130, membrane_thickness]);
				union() {
					translate([curve_start_height / tan(30), vertex_horizontal_hole_offset + m8_diameter/2 + border_size, 0])
						difference() {
							cylinder(r=hole_separation + (vertex_end_major_d / 2) - (curve_start_height / tan(30)), h=vfvertex_height, $fn=100);
							translate([0, 0, -1]) cylinder(r=hole_separation - (vertex_end_major_d / 2) - (curve_start_height / tan(30)) + 0.5, h=vfvertex_height + 2, $fn=100);
							rotate([0, 0, 60]) translate([-50, 1, -1]) cube([100, 100, 100]);
							rotate([0, 0, 0]) translate([-50, -100 - 1, -1]) cube([100, 100, 100]);
						}
					for (r=[0:1]) {
						rotate(r * 60)
							translate([hole_separation, 0, 0])
								cylinder(h=vfvertex_height, r=vertex_end_major_d/2 - 1, $fn=100);
						rotate(r * 60)
							translate([hole_separation - vertex_end_major_d/2, (vertex_horizontal_hole_offset + border_size + (m8_diameter / 2)) * -r, vfvertex_height / 2])
								cube([vertex_end_major_d, vertex_horizontal_hole_offset + border_size + (m8_diameter / 2), vfvertex_height]);
					}
					if (with_foot) {
						translate([hole_separation - 10, -15 - (vertex_end_major_d / 2) + 5, 0])
							cube([20, 15, vfvertex_height]);
					}
				}
			}

			for (hole=[0:1])
				rotate(hole*60) {
					translate([hole_separation,0,0])
						cylinder(h=vfvertex_height,r=(m8_diameter/2) + border_size, $fn=64);

					translate([hole_separation - m8_diameter / 2 - border_size, -vertex_horizontal_hole_offset * hole, 0])
						cube([m8_diameter + border_size * 2, vertex_horizontal_hole_offset, vfvertex_height]);
					translate([hole_separation - vertex_end_major_d/2, vertex_horizontal_hole_offset - 2 * hole * vertex_horizontal_hole_offset, vfvertex_height / 2])
						rotate([180, 0, 0]) teardrop(r=m8_diameter/2 + border_size,h=vertex_end_major_d);
				}
			translate([hole_separation, 0, 0])
				difference() {
					union() {
						cylinder(h=vfvertex_height, r=vertex_end_major_d/2, $fn=100);
						if (with_foot) {
							translate([-10, -15 - (vertex_end_major_d / 2) + 5, 0])
								difference() {
									cube([20, 15, vfvertex_height]);
									translate([border_size, border_size, -1]) cube([20 - border_size * 2, 15 - border_size, vfvertex_height + 2]);
								}
						}
					}
					translate([0, 0, -1]) cylinder(h=vfvertex_height + 2, r=vertex_end_major_d/2 - border_size, $fn=100);
					translate([-25, 0, -1]) cube([50, vertex_end_major_d / 2 + 1, vfvertex_height + 2]);
				}
			rotate(60)
			translate([hole_separation, 0, 0])
				difference() {
					cylinder(h=vfvertex_height, r=vertex_end_major_d/2, $fn=100);
					translate([0, 0, -1]) cylinder(h=vfvertex_height + 2, r=vertex_end_major_d/2 - border_size, $fn=100);
					translate([-25, -(vertex_end_major_d / 2 + 1), -1]) cube([50, vertex_end_major_d / 2 + 1, vfvertex_height + 2]);
				}
			translate([hole_separation, 0, 0]) {
				translate([-vertex_end_major_d / 2, 0, 0])
					cube([border_size, curve_start_height + 0.1, vfvertex_height]);
				translate([vertex_end_major_d / 2 - border_size, 0, 0])
					cube([border_size, curve_start_height + 0.1, vfvertex_height]);
			}
			rotate([0, 0, 60])
				translate([hole_separation, 0, 0])
					rotate([0, 0, 180]) {
						translate([-vertex_end_major_d / 2, 0, 0])
							cube([border_size, curve_start_height + 0.1, vfvertex_height]);
						translate([vertex_end_major_d / 2 - border_size, 0, 0])
							cube([border_size, curve_start_height + 0.1, vfvertex_height]);
					}
			translate([curve_start_height / tan(30), vertex_horizontal_hole_offset + m8_diameter/2 + border_size, 0]) {
				difference() {
					cylinder(r=hole_separation + (vertex_end_major_d / 2) - (curve_start_height / tan(30)), h=vfvertex_height, $fn=256);
					translate([-50, -100.1, -40]) cube([100, 100, 100]);
					rotate(60) translate([-50, 0.1, -40]) cube([100, 100, 100]);
					translate([0, 0, -1]) cylinder(r=hole_separation + (vertex_end_major_d / 2) - (curve_start_height / tan(30)) - border_size, h=vfvertex_height + 2, $fn=256);
				}
				difference() {
					cylinder(r=hole_separation - (vertex_end_major_d / 2) + border_size - (curve_start_height / tan(30)), h=vfvertex_height, $fn=128);
					translate([-50, -100.1, -40]) cube([100, 100, 100]);
					rotate(60) translate([-50, 0.1, -40]) cube([100, 100, 100]);
					translate([0, 0, -1]) cylinder(r=hole_separation - (vertex_end_major_d / 2) - (curve_start_height / tan(30)), h=vfvertex_height + 2, $fn=128);
				}
			}
		}

		for (hole=[0:1])
			rotate(hole*60)
				translate([hole_separation,0,-1])
					cylinder(h=vfvertex_height+2,r=(m8_diameter/2), $fn=64); 

		for (block=[0:1])
			rotate(block*60)
				translate([hole_separation-vertex_end_major_d/2-1, vertex_horizontal_hole_offset-2*block*vertex_horizontal_hole_offset, vfvertex_height/2])
					teardrop(r=m8_diameter/2,h=vertex_end_major_d+2);
	}
}

