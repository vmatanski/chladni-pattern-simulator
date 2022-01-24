/*
 * Chladni Equation Pattern Generator - matanski@uni-plovdiv.bg
 * 
 * This sketch illustrates a way to map the Chladni figures 
 * and to calculate the amplitude of vibration of different parts of a surface.
 *
 * The equation which is used to find the amplitude of each coordinate 
 * of the surface (x, y) is the following: 
 * result = cos(n*π*x / L)*cos(m*π*y / L) + cos(m*π*x / L)*cos(n*π*y/L)
 *
 * m - number of diametrically positioned nodes of the standing waves, 
 * n - number of the radial nodes, 
 * L - length of the surface
 * 
 * Based on the value of the result we can define the amplitude of vibration 
 * and can find the coordinates of the standing waves, which is close to 0, 
 * and are responsible for the formation of the figures 
 *
 * The full research is available at https://www.researchgate.net/publication/328478521_Formation_of_Chladni_patterns_in_virtual_environment
 *
 * The sketch can be controlled width the keyboard 
 * by pressing the following keys:
 *  
 * n or j to decrease/increase the value of N
 * m or k to decrease/increase the value of M
 * c to color/decolor
 * s to capture a screenshot, saved in /screenshots
 */

float pointX, pointY;
float m, n, L;
float result;
float detail = 0.00001;
float tinkle = 0; // 0.00001;
boolean colored = false;

void setup() {
  size(600, 600, P3D);
  frameRate(30);
  smooth(4);

  n = 7;
  m = 8;
  L = width;
  
  // The controls can be assigned to a MIDI device
  // MidiBus.list();
  // myBus = new MidiBus(this, 0, 3); // Create a new MidiBus using the device index to select the Midi input and output devices respectively.
}


void draw() {
  //m = mouseX / 50;
  //n = mouseY / 50;

  translate(width, height);
  rotate(PI);

  background(255);
  for (int x = 0; x < width; x++) {
    //stroke(x, -x, x);
    // 0 for 1/4 , -w/2 for full
    
    for (int y = 0; y < height; y++) {

      result = detail * ( cos(n*PI*x / L) * cos (m*PI*y/L) + cos(m*PI*x / L) * cos (n*PI*y/L) );
      
      
      if (result > tinkle - 0.000002 && result < tinkle + 0.000002 ) {
        stroke(184, 77, 255, 70);
        point(x, y);
      }
      if (result > tinkle - 0.000001 && result < tinkle + 0.000001 ) {
        stroke(153, 0, 255, 60);
        point(x, y);
      }
      if (result > tinkle - 0.0000005 && result < tinkle + 0.0000005 ) {
        stroke (122, 0, 204, 50);
        point(x, y);
      }
      if (result > tinkle - 0.0000001 && result < tinkle + 0.0000001 ) {
        stroke(107, 0, 179);
        point(x, y);
      }

      if (colored) {
        if (result < -0.000001) {
          stroke(   255, 217, 0); 
          point(x, y);
        }
        if (result < -0.000005) {
          stroke( 255, 196, 0);
          point(x, y);
        }
        if (result < -0.00001) {
          stroke( 255, 153, 0);
          point(x, y);
        }

        if (result < -0.000015) {
          stroke( 255, 89, 0);
          point(x, y);
        }

        if (result > 0.000001) {
          stroke(0, 166, 235);
          point(x, y);
        }
        if (result > 0.000005) {
          stroke(0, 123, 235);
          point(x, y);
        }
        if (result > 0.00001) {
          stroke(0, 81, 235);
          point(x, y);
        }

        if (result > 0.000015) {
          stroke(0, 38, 235);
          point(x, y);
        }
      }
    }
  }

  // delay(10);
  // m += 0.2;
  // n += 0.4;
}
 
void keyPressed() {
  if (key == 'm') {
    m--;
  } 
  if ( key == 'k' ) {
    m++;
  } 

  if (key == 'n') {
    n--; 
  } 
  if ( key == 'j' ) {
    n++;
  }

  if ( key == 's') {
    saveFrame("screenshots/m"+m+"-n"+n+"-color-"+colored+"---screen-######.png");
  }
  if ( key == 'c') {
    if (!colored) { 
      colored = true;
    } else {
      colored = false;
    }
  }

  println("m ="+m+"  n="+n);
}
