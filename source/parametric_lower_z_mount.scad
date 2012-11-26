// Parametric Prusa Lower Z Axis Mount 
//It is licensed under the Creative Commons - GNU GPL license.
//based on http://www.thingiverse.com/thing:16126
// © 2012 by Mark "Ckaos" Moissette
//http://www.thingiverse.com/thing:9433

include <inc/functions.scad>

///////////////////////////////
// USAGE EXAMPLE
///////////////////////////////
mount();


///////////////////////////////
// USER PARAMETERS
///////////////////////////////
$fs=0.2; // def 1, 0.2 is high res
$fa=3;//def 12, 3 is very nice

tolerance = +0.001;

smooth_rod_dia=8.5;//diameter of the smooth rods
threaded_rod_dia=8.5;//diameter of the threaded rods
threaded_rod_nut_dia=16;
rod_clearance = 2;//"wall" distance around rods

bearing_dia = 22.3;
bearing_height=7;
bearing_clearance = 2;
bearing_indent_dia=15;//diameter of the indent meant to hold the bearing in place

clamp_mount_hole_dia=3;
clamp_mount_hole_length=30;
clamp_mount_nut_dia=6.3;
clamp_mount_nut_height=2.5;

z_tr_sr_distance=30;//distance from z axis threaded rod to smooth rod
y_tr_sr_distance=40;//distance from y axis threaded rod to smooth rod

// //////////////////////////////
// OpenSCAD SCRIPT
// //////////////////////////////
 module mount()
{

	clamp_mount_hole_dist=max(12,smooth_rod_dia+(rod_clearance*2+clamp_mount_hole_dia));

	block_width=max((bearing_dia+bearing_clearance*2), (clamp_mount_hole_dist+clamp_mount_nut_dia+rod_clearance*2));
	block_height=threaded_rod_dia;
	block_length=z_tr_sr_distance+y_tr_sr_distance+threaded_rod_dia/2+rod_clearance;
	end_distance=-y_tr_sr_distance-threaded_rod_dia/2-rod_clearance;
	
	nut_hole_height=block_height/2+clamp_mount_nut_dia/2;
	bearing_indent_height=block_height-bearing_height;

	translate([0,0,block_height/2])
	difference()
	{
		union()
		{
			translate([-block_width/2,end_distance,-block_height/2]) 
			cube([block_width, block_length, bearing_height+bearing_indent_height]);
			translate([0,-y_tr_sr_distance-threaded_rod_dia/2-rod_clearance,block_height/2]) 
				lower_block(mount_width=block_width, mount_length=6); //y_tr_sr_distance-bearing_dia/2-threaded_rod_nut_dia/2);
				translate([-block_width/2,z_tr_sr_distance,-block_height/2])  {
					translate([10,4,0]) cylinder(h=bearing_height+bearing_indent_height,r=4);
					translate([4+6,0,0]) cube([block_width-4-6, 8, bearing_height+bearing_indent_height]);
					cube([4+6, 4, bearing_height+bearing_indent_height]);
				}

				translate([0,0,-block_height/2]) cylinder(r=29/2,h=block_height);
		}
		union()
		{
			translate([0,0,-block_height/2])
			bearing_hole(indent_height=bearing_indent_height);

			//main tr and sr holes
			translate([0,z_tr_sr_distance,0])
			cylinder(h = bearing_height+bearing_indent_height+1, r1 = smooth_rod_dia/2, r2 = smooth_rod_dia/2, center=true);

			translate([0,-y_tr_sr_distance,rod_clearance/2])rotate([90,0,90])
			cylinder(h = block_width+tolerance, r1 = threaded_rod_dia/2, r2 = threaded_rod_dia/2, center=true);

			translate([clamp_mount_hole_dist/2,z_tr_sr_distance+12+0.1,0]) 
				rotate([90,0,0])
				polyhole(h = clamp_mount_hole_length, d = clamp_mount_hole_dia);

			translate([clamp_mount_hole_dist/2-3,z_tr_sr_distance-clamp_mount_hole_length/2+5,-block_height/2-0.1]) 
			cube([clamp_mount_nut_dia, clamp_mount_nut_height, nut_hole_height]);

			assign(opening=7) {
				translate([0,z_tr_sr_distance-(opening/2),-block_height/2]) cube([block_width/2+1,opening,block_height]);
			}

			*#translate([-block_width/2-1,16,1]) {
				cube([block_width+2,60,5]);
				rotate([45,0,0]) cube([block_width+2,10,10]);
			}
		}
		translate([0,-18,11]) rotate([90,0,0]) cylinder(r=16/2,h=14);
		
		for(i=[0,1]) {
			mirror([i,0,0]) difference() {
				hull() {
					translate([-12,i == 0 ? 40 : 13,-7]) cylinder(r=10/2,h=14);
					translate([-16,i == 0 ? 40 : 13,-7]) cylinder(r=10/2,h=14);
					translate([-12,-24,-7]) cylinder(r=10/2,h=14);
					translate([-16,-24,-7]) cylinder(r=10/2,h=14);
				}
				translate([0,0,-7]) cylinder(r=29/2,h=14);
			}
		}
	}
}

 module bearing_hole(indent_height=5)
{
	hole_height=bearing_height+indent_height+tolerance*2;
	union()
	{	
		
		cylinder(h = bearing_height+tolerance, r = bearing_dia/2);
		translate([0,0,bearing_height])
		cylinder(h = indent_height+tolerance, r1 = bearing_dia/2, r2 = bearing_indent_dia/1.5);
	}
}

module lower_block(mount_width=20, mount_length=10)
{
	hole_center=threaded_rod_nut_dia/2-1;
	nut_clearance_h=5;

	translate([0,mount_length/2+threaded_rod_nut_dia/2,0]) 
	difference()
	{
		union()
		{	
			
			translate([0,0,0]) rotate([90,0,0])
			cylinder(h = mount_width,mount_length+threaded_rod_nut_dia, r1 = mount_width/2, r2 = mount_width/2, center=true);
		}
		union()
		{
			//threaded rod hole
			translate([0,0,hole_center])rotate([90,0,0])
			cylinder(h = mount_length+threaded_rod_nut_dia+0.2, r = threaded_rod_dia/2, center=true);

			//nut hole
			translate([0,(mount_length+2),hole_center])rotate([90,0,0])
				cylinder(h = threaded_rod_nut_dia/2, r = (threaded_rod_nut_dia+1)/2, center=true);

			//roundings
			translate([0,mount_length/2+threaded_rod_nut_dia/2,hole_center])rotate([90,0,90])
			cylinder(h = mount_width+1, r1 = threaded_rod_nut_dia/2, r2 = threaded_rod_nut_dia/2, center=true);

			//roundings cut offs
			translate([0,mount_length/2+threaded_rod_nut_dia,hole_center])
			cube([mount_width+1,threaded_rod_nut_dia,threaded_rod_nut_dia], center=true);
			
			translate([0,mount_length/2+threaded_rod_nut_dia/2,hole_center+threaded_rod_nut_dia/2])
			cube([mount_width+1,threaded_rod_nut_dia,threaded_rod_nut_dia], center=true);

			//bottom cut off
			translate([0,0,hole_center-threaded_rod_nut_dia/2-mount_width/2])
			cube([mount_width+1,mount_length+threaded_rod_nut_dia+0.1,mount_width], center=true);
			
			
		}
	}
}


