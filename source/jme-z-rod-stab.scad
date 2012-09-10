// PRUSA Mendel  
// GNU GPL v2
// Z threaded rod constraint
// http://www.thingiverse.com/thing:19263
// Derived from: http://www.thingiverse.com/thing:9864

include <configuration.scad> // From PrusaMendel/source/

outer_diameter = m8_diameter/2+3.3;
opening_size = m8_diameter-1.5;
shaft_separation = 30;
bearing_od = 22.6;
bearing_id = m8_diameter;
bearing_rodhole_d = bearing_id + 3;
connector_len = shaft_separation - (m8_diameter/2 + bearing_od/2);

// Nut Trap size calculation based on triffid_hunter's explaination:
// http://triffid-hunter.no-ip.info/nut_trap_size.png
// adj is the nut face, hyp is the nut corner
// adj/hyp = cos(180/6) -> hyp = adj/cos(180/6)
m3_nut_diameter_horizontal = (((5.5/2)/cos(180/6))+.05)*2;

// If a nut trap is added to another part, and sunken into it,
// you'll have to union nut_trap_outside then difference nut_trap_inside()
// otherwise the surface of the object that is receiving the nut trap
// will reduce the depth of the nut trap due to the union. 
module nut_trap() {
  render(convexity = 6) {
    difference() {
      nut_trap_outside();
      nut_trap_inside();
    }
  }
}

// If a nut trap is added to another part, and sunken into it,
// you'll have to union nut_trap_outside then difference nut_trap_inside()
// otherwise the surface of the object that is receiving the nut trap
// will reduce the depth of the nut trap due to the union. 
module nut_trap_outside() {
  intersection() {
      cylinder(
        h = 5, 
        r2 = (m3_nut_diameter_horizontal/2)+2, 
        r1 = (m3_nut_diameter_horizontal/2)+7, $fn = 6);
       cylinder(h = 5, r = (m3_nut_diameter_horizontal/2)+5, $fn = 6);
  }
}


module nut_trap_inside() {
  union () {
    translate([0, 0, 2]) cylinder(h =5, r = m3_nut_diameter_horizontal/2, $fn = 6);
    translate([0, 0, -1]) cylinder(h = 5, r = m3_diameter/2, $fn = 10);
  }
}

module origclamp() {
  render(convexity = 6){
    translate([-outer_diameter,-outer_diameter,0]) {
      difference(){
        union(){
          translate([outer_diameter, outer_diameter, 0]) cylinder(h =outer_diameter*2, r = outer_diameter, $fn = 20);
          translate([outer_diameter, 0, 0]) cube([17.5,outer_diameter*2,outer_diameter*2]);
          translate([17,12.5,7.5]) rotate([-90,0,0]) nut_trap_outside();
        }
        //translate([9, outer_diameter/2+2.5, 0]) cube([18,05,20]);
        translate([17,12.5,7.5]) rotate([-90,0,0]) nut_trap_inside();
        translate([outer_diameter, outer_diameter-(opening_size/2), 0]) cube([18,opening_size,20]);
        translate([outer_diameter, outer_diameter, 0]) cylinder(h =20, r = m8_diameter/2, $fn = 18);
        translate([17, 17, 7.5]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = 10);
      }
    }
  }
}

module bearingSupport() {
  render(convexity = 6){
    difference()
    {
      cylinder(r=(bearing_od/2) + 3.3, h=15);
      translate([0,0,5]) cylinder(r=bearing_od/2, h=15);
      translate([0,0,-1]) cylinder(r=bearing_rodhole_d/2, h=20);
    }
  }
}

union() {
  origclamp();
  translate([-(m8_diameter/2 + connector_len),-2.5,0]) cube([connector_len,5,15]);
  translate([-shaft_separation,0,0]) bearingSupport();
}
