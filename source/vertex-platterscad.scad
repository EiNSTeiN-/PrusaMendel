use <frame-vertex-neo.scad>;

%cube([200,200,1],center=true);


module left() {
	translate([-42,-8,-0.5]) vertex(with_foot=false);
	translate([-10,11,-0.5]) vertex(with_foot=true);
	//translate([13,27,-0.5]) rotate([0,0,115]) vertex(with_foot=true);
	translate([21,30,-0.5]) vertex(with_foot=true);
	translate([6,23,-0.5]) rotate([0,0,111]) vertex(with_foot=true);
}

module complete() {
	left();
	rotate([0,0,180]) left();
}

module stacked(num=1) {
	for(i=[0:num-1])  {
		translate([0,0,14.6*i]) complete();
	}
	if (num>1) {
		for(i=[1:num-1]) {
			translate([0,0,(14.6*i)-1.4]) support(height=1.5);
		}
	}
}

stacked(num=1);
//complete();
//left();

spacing=4;
thickness=0.3*2.2*2;
module support(height=2) {
	intersection() {
		scale([1,1,100*height]) {
			intersection() {
				cube([200,200,0.01],center=true);
				complete();
			}
		}
		rotate([0,0,-45]) for(i=[0:300/spacing]) {
			translate([-150+spacing*i,-150,0]) cube([thickness,300,height]);
		}
	}
}
