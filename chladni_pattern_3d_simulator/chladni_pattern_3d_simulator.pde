/*
 * Chladni Pattern 3D Simulator - 21.11.2017 - matanski@uni-plovdiv.bg
 * 
 * Requires Processing 4 with allowed RAM more than 2048.
 *  
 * This sketch creates a 3D virtual environment which is ruled by physical laws (gravity, friction)
 * It contains a square plate and a number of particles (2000). 
 * 
 * The particles fall down towards the plate, while the plate vibrates and repels the particles
 * until they make to the zone of the standing waves and find peace.
 *
 * The parameters of the sketch can be modified - M and N for the nodes and camera for the view.
 * 
 * https://www.researchgate.net/publication/328478521_Formation_of_Chladni_patterns_in_virtual_environment
 */

import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

int numBalls;
float spring = 0.001;
float gravity = 0.5;
float friction = -0.3;
int depth = 300;

int w = 641;
int d = 641;

ParticleSystem newPS;
Plate plate;

PeasyCam cam;

int[][] coordinates;

void setup() {
  size(800, 800, P3D);
  noStroke();
  frameRate(10);
  smooth(8);

  setupEquation();
  drawEquation();

  plate = new Plate(w, d, 3);
  numBalls = 2000;
  newPS = new ParticleSystem(plate, numBalls, 1);

  cam = new PeasyCam(this, width/4 + 120, height, depth + 200, 650);
  cam.rotateX(45);
  cam.setMinimumDistance(100);
}

void draw() {
  background(0);

  fill(220, 220, 50);
  noStroke();
  newPS.run();

  plate.displayInitial();
}


void keyPressed() {
  if (key == 'm') {
    m--;
    drawEquation();
  } 
  if ( key == 'k' ) {
    m++;
    drawEquation();
  } 

  if (key == 'n') {
    n--;
    drawEquation();
  } 
  if ( key == 'j' ) {
    n++;
    drawEquation();
  }

  if ( key == 's') {
      saveFrame("screenshots/m"+m+"-n"+n+"---screen-######.png");
  }

  println("m ="+m+"  n="+n);
}
