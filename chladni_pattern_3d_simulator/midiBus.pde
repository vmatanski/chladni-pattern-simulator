import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus


void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
  println();
  println("Note On:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
}

void noteOff(int channel, int pitch, int velocity) {
  // Receive a noteOff
  println();
  println("Note Off:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  //println();
  //println("Controller Change:");
  //println("--------");
  //println("Channel:"+channel);
  //println("Number:"+number);
  //println("Value:"+value);

  if (number == 14) {
    m = value;
  }
  if (number == 23) {
    m++;
  } else if (number == 33) {
    if (m <= 0) {
      m = 0;
    } else {
      m--;
    }
  }


  if (number == 15) {
    n = value;
  }
  if (number == 24) {
    n++;
  } else if (number == 34) {
    if (n <= 0) {
      n = 0;
    } else {
      n--;
    }
  }

  if (number == 16) {
    tinkle = value;
  }
  if (number == 25) {
    tinkle += 0.000001;
  } else if (number == 35) {
    tinkle -= 0.000001;
  }

  if (number == 17) {
    L = value;
  }
  if (number == 26) {
    L += 20;
  } else if (number == 36) {
    if (L <= 0) {
      L = 0;
    } else {
      L -= 20;
    }
  }
  drawEquation();
  println("m = "+m+" n = "+n+" tinkle="+tinkle+" detail = "+detail+" L="+L );
}

void delay(int time) {
  int current = millis();
  while (millis () < current+time) Thread.yield();
}
