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
module sails(mh)
	{
rotate([-90, 0, 90])
	translate([0,0,mh*-4/62]) 
		{
		translate([0,0,mh*28/32]) cylinder(r1=mh*2/64,r2=mh*2.5/64,h=mh*3/64,$fn=fn/4,center=true);
		translate([0,0,mh*53/64]) cylinder(r1=th/2,r2=mh*2/64,h=mh*3/64,$fn=fn/4,center=true);
		translate([30,0,0]) rigging(mh*5/6);
		translate([0,0,0]) rigging(mh);
		translate([-30,0,0]) rigging(mh*4/6);		

		}
	}

module rigging(mh=30)
	{
	cylinder(r=th*2/3,h=mh*11/12,$fn=fn/4);
	rotate([0,-90,0]) 
	translate([mh/2,0,0]) union() 
		{
		translate([0,-mh/64,0]) intersection()
		translate([0,mh/16,0]) mast(mh);
		}
	}

module mast(mh=30)
	{
	translate([-mh/4,0,0]) sail(mh/4);
	translate([mh/8,-th*1.5,0]) sail(mh/8);
	translate([mh*5/16,-th*2,0]) sail(mh/16);
	}

module sail(size)
	{
	intersection()
		{
		scale([1.5,1,1]) translate([0,-size,0]) difference()
			{
			cylinder(r=size, h=size*5/2,$fn=fn,center=true);
			cylinder(r=size-th, h=size*5/2+1,$fn=fn,center=true);
			}
		cube(size*2,center=true);
	*	translate([size*2,0,0]) scale([2,1,1]) 
			rotate([0,45,0]) cube(size*3,center=true);
		translate([size/3,0,0]) scale([2,1,1]) rotate([90,0,0]) 
			cylinder(r=size*1,h=size*2,$fn=fn,center=true);
		}
	}
