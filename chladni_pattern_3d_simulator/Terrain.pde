class Plate {
  int w, h, d;

  public Plate(int pW, int pD, int pH) {
    w = pW; // width
    d = pD; // height
    h = pH;
  }

  void displayInitial() {
    pushMatrix();
      fill(120, 0, 255);
      translate(w/2, height + 2, d/2);
      box(w, h, d);
    popMatrix();
  }

}
