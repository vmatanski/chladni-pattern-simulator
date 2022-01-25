float pointX, pointY;
int n, m, L;
float result;
float detail = 0.00001;
float tinkle = 0;

void setupEquation() {
  n = 7;
  m = 11;
  L = w;
}

void drawEquation() {

  coordinates = new int[700][409601];
  
  int xCounter = 0;
  int yCounter = 0;
  for (int x = 0; x < w; x++) {
    //stroke(x, -x, x);
    // 0 for 1/4 , -w/2 for full
    for (int y = 0; y < d; y++) {

      result = detail * ( cos(n*PI*x / L) * cos (m*PI*y/L) + cos(m*PI*x / L) * cos (n*PI*y/L) );

      if (result > tinkle - 0.000002 && result < tinkle + 0.000002 ) {
        coordinates[x][y] = 1;
      }
      if (result > tinkle - 0.000001 && result < tinkle + 0.000001 ) {
        coordinates[x][y] = 1;
      }
      if (result > tinkle - 0.0000005 && result < tinkle + 0.0000005 ) {
        coordinates[x][y] = 1;
      }
      if (result > tinkle - 0.0000001 && result < tinkle + 0.0000001 ) {
        coordinates[x][y] = 1;
      }
    }
  }
}
