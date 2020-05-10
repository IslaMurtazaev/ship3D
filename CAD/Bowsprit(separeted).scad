th = 0.6;
shipscale=60;
fn=64;

ship();

module ship(size=shipscale)
	{
	sails(size);
	hull(size);
	rudder(size);
	bowsprit(size);
	% translate([0,0,size/4]) cube(size, center=true);
	}
module bowsprit(bs)
	{
	translate([0,0,10]) rotate([0,0,0]) intersection() 
		{
		scale([0.5,1,1]) cylinder(r1=bs*8/64,r2=th,h=bs/3,$fn=fn/4,center=true);	
		translate([0,bs/2,0]) cube(bs,center=true);
		}
	}
