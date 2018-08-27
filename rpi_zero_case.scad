/* 
*  Open SCAD Name.: rpi_zero_mysensor_controller_case.scad
*  Copyright (c)..: 2018 John Oliva
*
*  Creation Date..: 08/20/2018
*  Last Modified..: 08/24/2018
*  Description....: Contact sensor housing
*  Version........: 1.0
*
*  Built On: Open SCAD version 2018.03.17
*
*  Attribution: based on Jumbospot / Zumspot Raspberry Pi Zero Wireless Case 
                https://www.thingiverse.com/thing:2773755, by Plankto
*
*  This program is free software; you can redistribute it and/or modify it under the
*  terms of the GNU General Public License as published by the Free Software
*  Foundation; either version 2 of the License, or (at your option) any later version.
*
*  This program is distributed in the hope that it will be useful, but WITHOUT ANY
*  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
*  PARTICULAR PURPOSE.  See the GNU General Public License for more details.
* 
*/ 

PI_TOL_X = 1.0*1;
PI_TOL_Y = 1.0*1;
EXTWID = 0.5*1;                     // extrusion width
WALL = 3 * EXTWID;

WIDTH = 42;
WIDTH_ADJ = WIDTH + PI_TOL_Y;
LENGTH = 69 + 2*PI_TOL_X;
HEIGHT = 12*1;
TOP_HEIGHT = 19.0;

SCREW_DIAM = 3.0*1;

HOLE_RAD = SCREW_DIAM/2;
HOLE_PASS_RAD = (SCREW_DIAM + EXTWID)/2;

IPOST_RAD = (SCREW_DIAM - EXTWID)/2 ;
OPOST_RAD = HOLE_RAD + 3*EXTWID;
OPOST_PASS_RAD = HOLE_PASS_RAD + 3*EXTWID;

INSERT_POST_HEIGHT = 12.5*1;

RPI_THICK = 1.5*1;
SCREW_HEAD = 3 + .2;

FN_LOW = 32;
FN_HIGH = 50;

// Configuration
CONFIG = "flat";  // ["flat", "assembled", "none"]

// Show Bottom
SHOW_BOT = true;

// Show Top
SHOW_TOP = true;

// Show Insert
SHOW_INSERT = true;

// Add ventilation
VENT = true;

// Display RPI
SHOW_RPI = true;

// Display nRF24L01
SHOW_RADIO = true;

if (CONFIG == "flat") {
   if (SHOW_BOT) {
      bottom();
   }

   if (SHOW_TOP) {
      translate([73,0,0]) top(); 
   }

   if (SHOW_INSERT) {
      translate([0,WIDTH_ADJ,0]) insert();
   }
}

if (CONFIG == "assembled") { 
   if (SHOW_BOT) {
      bottom();
   }

   if (SHOW_TOP) {
      translate([0,WIDTH_ADJ,HEIGHT+TOP_HEIGHT+SCREW_HEAD])
         rotate([180,0,0]) 
            top();
   }

   if (SHOW_INSERT) {
      translate([PI_TOL_X,WIDTH_ADJ+PI_TOL_Y,11+4+RPI_THICK+SCREW_HEAD])
         rotate([180,0,0]) 
            insert();
   }

   if (SHOW_RPI == true) {
      translate([PI_TOL_X,PI_TOL_Y,SCREW_HEAD])
         color("indianred", alpha=1) RPI();
   }

   if (SHOW_RADIO == true) {
      translate([PI_TOL_X,PI_TOL_Y,SCREW_HEAD])
         color("turquoise", alpha=1) Radio();
   }
}

module bottom(){
   difference() {
	   union() {
		   cube([LENGTH,WIDTH_ADJ,SCREW_HEAD]);   // additional base to accomodate screw head
	
		   translate([0,0,SCREW_HEAD]) {
		      difference(){
		         //lower casing
		         cube([LENGTH,WIDTH_ADJ,HEIGHT]);
		  
		         union(){
		            //lower casing
		            translate([WALL,WALL,WALL])cube([LENGTH-2*WALL,WIDTH_ADJ-2*WALL,HEIGHT]);
		          
		            //hdmi port 
		            translate([7.4+PI_TOL_X,-1,4.8])cube([14,5,4.25]);
		              
		            //usb port 1
		            translate([39.4+PI_TOL_X,-1,4.8])cube([8,5,4.25]);
		          
		            //usb port 2
		            translate([52+PI_TOL_X,-1,4.8])cube([8,5,4.25]);
		          
		            //SD card
		            translate([-1,11.15+PI_TOL_Y,4.8])cube([5,15.5,3.3]);
		          
		            //top
		            translate([0,WIDTH_ADJ,HEIGHT+TOP_HEIGHT])
		               rotate([180,0,0]) 
		                  top();
		          }
		      }
		  
		      //mounting posts
		      translate([5.5+PI_TOL_X,5.5+PI_TOL_Y,0]) cylinder(r=OPOST_PASS_RAD, h=4, $fn=FN_LOW);
		      translate([63.5+PI_TOL_X,5.5+PI_TOL_Y,0]) cylinder(r=OPOST_PASS_RAD, h=4, $fn=FN_LOW);
		      translate([5.5+PI_TOL_X,WIDTH_ADJ-6.5+PI_TOL_Y,0]) cylinder(r=OPOST_PASS_RAD, h=4+RPI_THICK, $fn=FN_LOW);
		      translate([63.5+PI_TOL_X,WIDTH_ADJ-6.5+PI_TOL_Y,0]) cylinder(r=OPOST_PASS_RAD, h=4+RPI_THICK, $fn=FN_LOW);
		
		      translate([5.5+PI_TOL_X,28.5+PI_TOL_Y,0]) cylinder(r=OPOST_RAD, h=4, $fn=FN_LOW);
		      translate([63.5+PI_TOL_X,28.5+PI_TOL_Y,0]) cylinder(r=OPOST_RAD, h=4, $fn=FN_LOW);
		      translate([5.5+PI_TOL_X,28.5+PI_TOL_Y,0]) cylinder(r=IPOST_RAD, h=8, $fn=FN_HIGH);
		      translate([63.5+PI_TOL_X,28.5+PI_TOL_Y,0]) cylinder(r=IPOST_RAD, h=8, $fn=FN_HIGH);
		   }
	   }

	   union() {
		   //fillet
		   translate([0,0,-.001]) fillet(2, 30+1);
		   translate([LENGTH,0,-.001])rotate([0,0,90])fillet(2, 30+1);
		   translate([0,WIDTH_ADJ,-.001])rotate([0,0,-90])fillet(2, 30+1);
		   translate([LENGTH,WIDTH_ADJ,-.001])rotate([0,0,180])fillet(2, 30+1);
	
	      // screws
	      translate([5.5+PI_TOL_X,5.5+PI_TOL_Y,-.001]) M3x(length_mm=10, add_tol=true);
	      translate([63.5+PI_TOL_X,5.5+PI_TOL_Y,-.001]) M3x(length_mm=10, add_tol=true);
	      translate([5.5+PI_TOL_X,WIDTH_ADJ-6.5+PI_TOL_Y,-.001]) M3x(length_mm=10, add_tol=true);
	      translate([63.5+PI_TOL_X,WIDTH_ADJ-6.5+PI_TOL_Y,-.001]) M3x(length_mm=10, add_tol=true);
	   }
   }
}

module top(){
    W = WIDTH_ADJ - 5.5;

    H_POST = 13;

    difference() {
        union() {
            // shell
            difference() {
               //upper casing
               cube([LENGTH,WIDTH_ADJ,TOP_HEIGHT]);

               translate([WALL,WALL,WALL])cube([LENGTH-2*WALL,WIDTH_ADJ-2*WALL,TOP_HEIGHT]);
            }

            //mounting posts
            translate([5.5+PI_TOL_X,5.5,0])cylinder(r=OPOST_RAD, h=H_POST, $fn=FN_LOW);
            translate([63.5+PI_TOL_X,5.5,0])cylinder(r=OPOST_RAD, h=H_POST, $fn=FN_LOW);
            translate([5.5+PI_TOL_X,W-PI_TOL_Y,0])cylinder(r=OPOST_RAD, h=H_POST, $fn=FN_LOW);
            translate([63.5+PI_TOL_X,W-PI_TOL_Y,0])cylinder(r=OPOST_RAD, h=H_POST, $fn=FN_LOW);
        }
    
        union() {
            // antenna connector hole
            translate([-.001,W-19,-.001]) cube([4,12,TOP_HEIGHT-8]);
        
            //fillet
            fillet_len = 2*TOP_HEIGHT;
            fillet(2, fillet_len);
            translate([LENGTH,0,0])rotate([0,0,90])fillet(2, fillet_len);
            translate([0,WIDTH_ADJ,0])rotate([0,0,-90])fillet(2, fillet_len);
            translate([LENGTH,WIDTH_ADJ,0])rotate([0,0,180])fillet(2, fillet_len);

            // screw holes
            translate([5.5+PI_TOL_X,5.5,2*WALL]) cylinder(r=HOLE_RAD, h=H_POST, $fn=FN_HIGH);
            translate([63.5+PI_TOL_X,5.5,2*WALL]) cylinder(r=HOLE_RAD, h=H_POST, $fn=FN_HIGH);
            translate([5.5+PI_TOL_X,W-PI_TOL_Y,2*WALL]) cylinder(r=HOLE_RAD, h=H_POST, $fn=FN_HIGH);
            translate([63.5+PI_TOL_X,W-PI_TOL_Y,2*WALL]) cylinder(r=HOLE_RAD, h=H_POST, $fn=FN_HIGH);

            // ventilation
            if (VENT) {
	            OFFSET = 5;
	            NX = 9;
	            NY = 5;
	            DX = (LENGTH - 2*OFFSET)/(NX+1);
	            DY = (WIDTH - 2*OFFSET)/(NY+1);
	            for (x = [1:NX]) {
	               for (y = [1:NY]) {
	                  translate([OFFSET+x*DX,OFFSET+y*DY,0]) cylinder(d=2, h=3*WALL, center=true, $fn=FN_HIGH);
	               }
	            }
            }
        }
    }
}

module insert(){
    W = WIDTH_ADJ - 7;

    translate([0,0,-(INSERT_POST_HEIGHT-11)])
    difference(){
        union(){
            //mounting posts
            translate([5.5,6.5,0]) cylinder(r=OPOST_PASS_RAD, h=INSERT_POST_HEIGHT, $fn=FN_LOW);
            translate([63.5,6.5,0]) cylinder(r=OPOST_PASS_RAD, h=INSERT_POST_HEIGHT, $fn=FN_LOW);
            translate([5.5,WIDTH_ADJ-5.5,0]) cylinder(r=OPOST_PASS_RAD, h=INSERT_POST_HEIGHT, $fn=FN_LOW);
            translate([63.5,WIDTH_ADJ-5.5,0]) cylinder(r=OPOST_PASS_RAD, h=INSERT_POST_HEIGHT, $fn=FN_LOW);
            
            translate([3.5,4.5,0]) cube([62,W-1,2.5]);  
        }

        union(){
            translate([3,W-14,-.001]) cube([7,7,4.0]);  // cut-out for radio antenna connector
            translate([37,W-16,-.001]) cube([6,11,3.5]);  // cut-out for radio board connector
            translate([34,W-21,1.5]) cube([55,6,4], center=true);  // cut-out for access to RPI header

            //holes
            translate([5.5,6.5,-1])cylinder(r=HOLE_PASS_RAD, h=INSERT_POST_HEIGHT+2, $fn=FN_HIGH);
            translate([63.5,6.5,-1])cylinder(r=HOLE_PASS_RAD, h=INSERT_POST_HEIGHT+2, $fn=FN_HIGH);
            translate([5.5,WIDTH_ADJ-5.5,-1])cylinder(r=HOLE_PASS_RAD, h=INSERT_POST_HEIGHT+2, $fn=FN_HIGH);
            translate([63.5,WIDTH_ADJ-5.5,-1])cylinder(r=HOLE_PASS_RAD, h=INSERT_POST_HEIGHT+2, $fn=FN_HIGH);
        }
    }
}

module RPI() {
   translate([65/2+2,30/2+2,4]) 
   union() {
      translate([0,11.3,10/2]) cube([53,3,10], center=true);  // header
      translate([-5.5,-2,5.2]) cube([14,14,5],center=true);  // heatsink
      import("rpi_zero_model.stl");
   }
}

module Radio() {
   translate([3,10,18])
   union() {
      cube([40,15,1]);  // board
      translate([35,3,-8.5]) cube([4,9,8.5]);  // board connector

      // antenna connector
      translate([0,5,0])
         union() {
            translate([0,0,-2]) cube([5,5,12.5]);
            translate([-8,5/2,8]) rotate([0,90,0]) cylinder(d=5, h=8, $fn=32);  
         }
   }
}

// M3 machine screw
module M3x(length_mm=10, add_tol=false, invert=false) {
   $fn = 50;

   HEAD_DIAM = add_tol ? ceil_ext(5.42) + EXTWID : ceil_ext(5.42);
   HEAD_HEIGHT = add_tol ? ceil_ext(3.0) + EXTWID : ceil_ext(3.0);
   SCREW_DIAM = add_tol ? ceil_ext(3.0) + EXTWID : ceil_ext(3.0);

   rot_x = invert ? 180 : 0;
   trans_z = invert ? HEAD_HEIGHT + length_mm : 0;

   translate([0,0,trans_z])
      rotate([rot_x,0,0])
         union() {
            cylinder(d=HEAD_DIAM, h=HEAD_HEIGHT);
            translate([0,0,HEAD_HEIGHT]) cylinder(d=SCREW_DIAM, h=length_mm);
         }
}

// ceiling quantized by extrusion width
function ceil_ext(x) = ceil(x/EXTWID)*EXTWID;

// floor quantized by extrusion width
function floor_ext(x) = floor(x/EXTWID)*EXTWID;

module fillet(r, h) {
    translate([r / 2, r / 2, 0])

        difference() {
            cube([r + 0.01, r + 0.01, h], center = true);

            translate([r/2, r/2, 0])
                cylinder(r = r, h = h + 1, center = true, $fn=100);

        }
}
