// PRUSA Mendel  
// Z motor mount with barclamp
// Used for mounting Z motors & barclamp
// GNU GPL v2
//ElMatador
//used Z-motor-mount.scad by Josef Prusa
// Josef Průša
// josefprusa@me.com
// http://www.reprap.org/wiki/Prusa_Mendel

include <configuration.scad>

/**
 * @id z-motor-mount
 * @name Z motor mount
 * @category Printed
 * @using 2 m3x25xhex
 * @using 2 m3nut
 * @using 2 m3washer
 * @using 4 m8nut
 * @using 4 m8washer
 * @using 1 rod-clamp
 */

module teardrop (r=8,h=20){
    rotate([0,0,90])
        linear_extrude(height=h)
        {
            circle(r=r);
            polygon(points=[[0,0],[r*cos(30),r*sin(30)],[0.5*r,r],[-0.5*r,r],[-r*cos(30),r*sin(30)]],
            paths=[[0,1,2,3,4]]);
        }
}
 
module zmotormount() {
    difference() {
        union() {
            translate(v=[30,0,-8]) cube(size = [10,30,16]);
            translate(v=[2.5,0,0]) cube(size = [55,60,16], center = true);
            translate(v=[2.5,0,-4]) cube(size = [55,74.5-16,8], center = true);
            translate(v=[30,0,-8]) cylinder(h = 16, r=10);
            translate(v=[-25,29.25,0]) rotate(a=[0,90,0]) cylinder(h = 65, r=8, $fn=30);
            translate(v=[-25,32.54,-8]) rotate([45,0,0]) cube(size = [65,3.9,5]);			//included to make 45 degree
            translate(v=[-25,28.64,-8]) cube(size = [65,3.9,5]);							//base extension
            translate(v=[-25,-29.25,0]) rotate(a=[0,90,0]) cylinder(h = 55, r=8, $fn=30);
            translate(v=[-25,-35.30,-5.24]) rotate([-45,0,0]) cube(size = [55,3.9,5]);		//included to make 45 degree
            translate(v=[-25,-32.54,-8]) cube(size = [55,3.9,5]);							//base extension
        }
        translate(v=[-2.1,0,2.8]) cube(size = [46,43,13], center = true);

        // reducing the material
        translate(v=[10.5-7.5-13/2,34.5,-4]) cube(size = [15+13,20,30], center = true);
        translate(v=[10.5-7.5-13/2,-34.5,-4]) cube(size = [15+13,20,30], center = true);
        translate(v=[-10,0,0]) translate(v=[5.5,24.5,-10]) rotate(a=[0,0,45]) cube(size = [20,20,30]);
        translate(v=[-10,0,0]) translate(v=[5.5,-24.5,-10]) rotate(a=[0,0,225]) cube(size = [20,20,30]);
        translate(v=[5,0,0]) translate(v=[5.5,24.5,-10]) rotate(a=[0,0,45]) cube(size = [20,20,30]);
        translate(v=[5,0,0]) translate(v=[5.5,-24.5,-10]) rotate(a=[0,0,225]) cube(size = [20,20,30]);

        // Nema 17
        /*rotate ([0,0,45]) translate([20,0,0]) cube(size = [9,3.2,25], center = true);
        rotate ([0,0,-45]) translate([20,0,0]) cube(size = [9,3.2,25], center = true);
        rotate ([0,0,135]) translate([20,0,0]) cube(size = [9,3.2,25], center = true);
        rotate ([0,0,-135]) translate([20,0,0]) cube(size = [9,3.2,25], center = true);
        translate(v=[0,0,-10]) polyhole(26,20);*/
        
        // cutout below the motor
        
        assign(hole_size=34)
            translate([-hole_size/2-20,-hole_size/2,-10]) cube([hole_size+20,hole_size,25]);

        translate(v=[31.7,20,0])cube(size=[3.4,40,20], center = true);
        translate(v=[30,0,-10]) cylinder(h = 20, r=4.2);
        translate(v=[-26,29.25,0]) rotate(a=[0,90,0]) teardrop(h = 70, r=m8_diameter/2);	//previously cylinders
        translate(v=[-26,-29.25,0]) rotate(a=[0,90,0]) teardrop(h = 58, r=m8_diameter/2);	//previously cylinders
    }
}

translate(v=[0,0,8]) rotate ([0,0,0]) zmotormount();
