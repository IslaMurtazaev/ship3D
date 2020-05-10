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
module hull(hl)
	{
	difference()
		{
		translate([0,hl*-1/32,-hl*3/32]) union()
			{
			scale([0.7,2.1,1]) translate([0,0,-hl/12]) 
				cylinder(r1=hl/6, r2=hl/4, h=hl/6, $fn=fn,center=true);
	
			difference()
				{
				scale([0.7,2.1,1]) translate([0,0,hl/12]) 
					cylinder(r=hl/4, h=hl/6, $fn=fn,center=true);
				difference()
					{
					scale([0.7,2.1,1]) translate([0,0,hl/12+th/4]) 
						cylinder(r=(hl/4) -th, h=hl/6, $fn=fn,center=true);
					translate([0,-hl*13/32,hl/32]) cube([hl,hl/4,hl/4],center=true);
					translate([0,-hl*12/32,-hl*2/32]) cube([hl,hl/4,hl/4],center=true);
					translate([0,hl*14/32,-hl*2/32]) cube([hl,hl/4,hl/4],center=true);
					translate([0,-hl*15/32,hl/32]) cube([hl,hl/8,hl/2],center=true);
					}
				translate([0,hl/4.5,hl/1.7]) cube(hl, center=true);
				translate([0,hl*1/32,hl*9/32]) cube(hl/2, center=true);
				}
			}
		translate([0,-hl*17/32,hl/32]) cube([hl,hl/8,hl/2],center=true);
		}
	}
	
