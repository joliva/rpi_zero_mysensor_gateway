// Components to show
SHOW = "all";  // ["all", "bottom", "top", "insert"]

if (SHOW == "all") {
   top(); 
   translate([73,0,0]) bottom(); 
   translate([0,34,0]) insert();
}

if (SHOW == "bottom") { 
   bottom(); 
}

if (SHOW == "top") { 
   top(); 
}

if (SHOW == "insert") { 
   insert();
}

//snap();

module bottom(){
    union(){
        difference(){
            union(){
                //lower casing
                cube([69,34,12]);
                
            }

            union(){
                //lower casing
                translate([1.5,1.5,1.5])cube([66,31,12]);
        
                //hdmi port 
                translate([7.4,-1,5.3])cube([14,5,4.25]);
            
                //usb port 1
                translate([39.4,-1,5.3])cube([8,5,15]);
        
                //usb port 2
                translate([52,-1,5.3])cube([8,5,15]);
        
                //SD card
                translate([-1,11.15,5.3])cube([5,15.5,3.3]);
        
                //Camera port
                translate([65,8,5.3])cube([5,18,14.6]);
                
                //top
                translate([0,34,21.5])rotate([180,0,0])top();
                
                //fillet
                fillet(2, 30);
                translate([69,0,0])rotate([0,0,90])fillet(2, 30);
                translate([0,34,0])rotate([0,0,-90])fillet(2, 30);
                translate([69,34,0])rotate([0,0,180])fillet(2, 30);
            }
        }

        //mounting posts
        translate([5.5,5.5,0])cylinder(r=4.5/2, h=4, $fn=20);
        translate([63.5,5.5,0])cylinder(r=4.5/2, h=4, $fn=20);
        translate([5.5,28.5,0])cylinder(r=4.5/2, h=4, $fn=20);
        translate([63.5,28.5,0])cylinder(r=4.5/2, h=4, $fn=20);
    
        translate([5.5,5.5,0])cylinder(r=2.6/2, h=8, $fn=20);
        translate([63.5,5.5,0])cylinder(r=2.6/2, h=8, $fn=20);
        translate([5.5,28.5,0])cylinder(r=2.6/2, h=8, $fn=20);
        translate([63.5,28.5,0])cylinder(r=2.6/2, h=8, $fn=20);
        
        
    
    }
}

module top(){
    union(){
        difference(){
            union(){
                //upper casing
                cube([69,34,9.5]);
                
                //Camera port
                translate([67.5,8,0])cube([1.5,18,11.5]);
                
                //usb port 1
                translate([39.4,32.5,0])cube([8,1.5,12.5]);
        
                //usb port 2
                translate([52,32.5,0])cube([8,1.5,12.5]);
            }
        
            union(){
                //upper casing
                translate([1.5,1.5,1.5])cube([66,31,12]);
            
                //aerial hole
                translate([7,18,-1])cylinder(r=9.5/2,h=10,$fn=40);
            
                //led hole
                translate([59.2,7.8,-1])cube([7.5,10,10]);
            
                //heatsink hole
                translate([22.7,16.1,-1])cube([10,10,10]);
                
                //reset hole
                translate([57.5,30,-1])cylinder(r=2/2, h=6.75, $fn=20);
                
                //fillet
                fillet(2, 30);
                translate([69,0,0])rotate([0,0,90])fillet(2, 30);
                translate([0,34,0])rotate([0,0,-90])fillet(2, 30);
                translate([69,34,0])rotate([0,0,180])fillet(2, 30);
            }
        }
    
            //mounting posts
            translate([5.5,5.5,0])cylinder(r=4.5/2, h=3, $fn=20);
            translate([63.5,5.5,0])cylinder(r=4.5/2, h=3, $fn=20);
            translate([5.5,28.5,0])cylinder(r=4.5/2, h=3, $fn=20);
            translate([63.5,28.5,0])cylinder(r=4.5/2, h=3, $fn=20);
    
            translate([5.5,5.5,0])cylinder(r=2.6/2, h=6.75, $fn=20);
            translate([63.5,5.5,0])cylinder(r=2.6/2, h=6.75, $fn=20);
            translate([5.5,28.5,0])cylinder(r=2.6/2, h=6.75, $fn=20);
            translate([63.5,28.5,0])cylinder(r=2.6/2, h=6.75, $fn=20);
        
            //snaps
            translate([51.75,.75,1.5])rotate([0,0,180])snap();
            translate([17.25,.75,1.5])rotate([0,0,180])snap();
            translate([30,33.25,1.5])snap();
            //translate([46.75,33.25,1.5])snap();
    }
}

module snap(){
    difference(){
        union(){
            cube([5,0.75,10]);
            translate([0,0,8.6])rotate([45,0,0])cube([5,1,1]);
            
        }
        
        union(){
            translate([0,-1,8.3])cube([5,1,1]);
        }
    }
}

module insert(){
    difference(){
        
        union(){
            //mounting posts
            translate([5.5,5.5,0])cylinder(r=4.5/2, h=11, $fn=20);
            translate([63.5,5.5,0])cylinder(r=4.5/2, h=11, $fn=20);
            translate([5.5,28.5,0])cylinder(r=4.5/2, h=11, $fn=20);
            translate([63.5,28.5,0])cylinder(r=4.5/2, h=11, $fn=20);
            
            //joining rails
            translate([5,26.23,0])cube([59,4.5,4.5]);
            translate([5,8.3,0])cube([59,4.5,4.5]);
            translate([61.2,5,0])cube([4.5,23,4.5]);
            translate([3.2,5,0])cube([4.5,7.8,4.5]);
            translate([15,8.5,0])cube([4.5,22,4.5]);
        }
        
        union(){
            //holes
            translate([5.5,5.5,-1])cylinder(r=2.8/2, h=13, $fn=50);
            translate([63.5,5.5,-1])cylinder(r=2.8/2, h=13, $fn=50);
            translate([5.5,28.5,-1])cylinder(r=2.8/2, h=13, $fn=50);
            translate([63.5,28.5,-1])cylinder(r=2.8/2, h=13, $fn=50);
        }
    }
}

module fillet(r, h) {
    translate([r / 2, r / 2, 0])

        difference() {
            cube([r + 0.01, r + 0.01, h], center = true);

            translate([r/2, r/2, 0])
                cylinder(r = r, h = h + 1, center = true, $fn=100);

        }
}
