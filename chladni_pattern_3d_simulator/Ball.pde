class Ball {

  float x, y, z;
  float diameter;
  float vx = 0;
  float vy = 0;
  float vz = 0;
  float alpha = 255;
  int id;
  ArrayList<Ball> others;
  boolean colored;
  Plate holder;

  Ball(float xin, float yin, float zin, float din, int idin, Plate hold) { // ArrayList<Ball> oin,
    holder = hold;
    x = xin;
    y = yin;
    z = zin;
    diameter = din;
    id = idin;
    // others = oin;
  }

  void collide() {
    for (int i = others.size() - 1; i > 0; i--) {
      float dx = others.get(i).x - x;
      float dy = others.get(i).y - y;
      float dz = others.get(i).z - z;

      float distance = sqrt(dx*dx + dy*dy + dz*dz);
      float minDist = others.get(i).diameter/2 + diameter/2;

      if (distance < minDist) {
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others.get(i).x) * spring;
        float ay = (targetY - others.get(i).y) * spring;
        vx -= ax;
        vy -= ay;
        others.get(i).vx += ax;
        others.get(i).vy += ay;
      }

      if (distance < minDist) {
        float angle = atan2(dy, dz);
        float targetZ = z + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float az = (targetZ - others.get(i).z) * spring;
        float ay = (targetY - others.get(i).y) * spring;
        vz -= az;
        vy -= ay;
        others.get(i).vz += az;
        others.get(i).vy += ay;
      }


      /*if (distance < minDist) {
       float angle = atan2(dx, dz);
       float targetZ = z + cos(angle) * minDist;
       float targetX = x + sin(angle) * minDist;
       float az = (targetZ - others.get(i).z) * spring;
       float ax = (targetX - others.get(i).x) * spring;
       vz -= az;
       vx -= ax;
       others.get(i).vz += az;
       others.get(i).vx += ax;
       }*/
    }

    // collide with earth
    if (x > 0 && z > 0 && x < w && z < d) {
      if (coordinates[(int)x][(int)z] == 1 && y > height - 5) {
        colored = false;
        vy = 0;
        vx = 0;
        vz = 0;
      } else if (coordinates[(int)x][(int)z] != 1 && y > height - 5) {
        colored = true;
        vy += random(-5, 0);
        vx += random(-2, 2);
        vz += random(-2, 2);
      }

      /*
      if (coordinates[(int)x][(int)z] == 1 && y > height - 5) {
       colored = true;
       
       //  ////println("X : "+(int)x+" Z : "+(int)z+"   VALUE : "+coordinates[(int)x][(int)z]);
       if (coordinates[(int)x][(int)z] == 1 && y > height - 5) {
       colored = true;
       vy = 0;
       vx = 0;
       vz = 0;
       }
       } else {
       colored = false;
       }
       */
    }
  }
  void move() {
    vy += gravity;
    x += vx;
    y += vy;
    z += vz;

    if (x + diameter/2 > holder.w) {
      x =  holder.w - diameter/2;
      vx *= friction;
    } else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
    }

    if (z + diameter/2 > holder.d) {
      z =  holder.d - diameter/2;
      vz *= friction;
    } else if (z - diameter/2 < 0) {
      z = diameter/2;
      vz *= friction;
    }

    /*
     if (x + diameter/2 > holder.w) {
     alpha -= 1;
     } else if (x - diameter/2 < 0) {
     alpha -= 1;
     }
     if (z + diameter/2 > holder.d) {
     alpha -= 1;
     } else if (z - diameter/2 < 0) {
     alpha -= 1;
     }
     */

    if (y + diameter/2 >  height) {
      y =  height - diameter/2;
      vy *= friction;
    } else if (y - diameter/2 < 0) {
      //if ( ( x > 100 && x < 200 ) && ( z > 100 && z < 200) ) {
      //  y = diameter/2;
      //  vy *= friction;
      //} else {
      y = diameter/2;
      vy *= friction;
      //}
    }
  }

  void display() {

    pushMatrix();

    sphereDetail(3);
    translate(x, y, z);
    if (colored == true) {
      fill(255, 0, 0, alpha);
    } else {
      fill(0, 255, 0, alpha);
    }

    sphere(diameter*3);

    popMatrix();
  }
}
