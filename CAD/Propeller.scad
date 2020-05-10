// диаметр пропелера
d=32;

//размах
dir=1;

//ширина разьема
notchw=2;

//глубина разьема
notchd=1;

//угол ращьема(градусы)
notcha=0;

// диаметр центральной части
c=6;

// количество лопастей
n=2;

// «шаг» лопастей (выше = более крутой клинок, не точный по численности))
z=2;

// ширина (толщина) лопастей
w=2;

// высота пропелера
h=10;

// центральное отверстие для оси
b=3.2;

// высота стопорной гайки
m=0;

// (Длинный) диаметр нажимной гайки
s=0;

//отверстие();
schraube(d,dir,notchw,notchd,notcha,c,n,z,w,h,b,m,s);

module schraube(d=40,dir=1,notchw=0,notchd=0,notcha=0,c=10,n=3,z=1,w=2,h=10,b=4.4,m=3.2,s=7) {
difference() {
    union() {
        cylinder(d=c,h=h);
        intersection() {
            bound(d,h);
            shape(d,c,n,w,h);
                        }
            }

    union() {
        hole(b,m,s,h);
        notch(notchw,notchd,notcha,c,h);
            }
        }
}


module hole(b=4.4,m=3.2,s=7,h=10) {
    cylinder(d=b,h=h,$fn=50);
    linear_extrude(height=m)
    circle(s/2,$fn=6);
    
}

module notch(notchw=0,notchd=0,notcha=0,c=10,h=10) {
    rotate([0,0,notcha])
        translate([0,0,h-(notchd/2)])
            cube(size = [notchw,c,notchd], center = true); 
}
    //circle(d=10);

module shape(d=40,c=10,n=3,w=2,h=10) {

linear_extrude(height=h,twist=dir*360/(n*z),slices=50)
    for(i=[0:360/n:360])
    rotate([0,0,i])
    polygon([[0-w/2,0],[0+w/2,0]
            ,[0+w/2,d/2],[0-w/2,d/2]]);
}

module bound(d=40,h=10) {
translate([0,0,h/2])
rotate_extrude()
//rotate([90,0,0])
    union() {
intersection(){
scale([1,h/d])
circle(d=d,$fn=50);
translate([0,0])square([d,d]);
}
intersection(){
scale([1.5,h/d])
circle(d=d,$fn=50);
translate([0,-d])square([d,d]);
}

}
}