int cols = 20;  // Anzahl der Spalten
int rows = 10;  // Anzahl der Zeilen
int w;          // Breite und Höhe der Quadrate

void setup() {
  size(1000, 600);
  w = width / cols;
  }

void draw() {
  background(255);

//Array aufzeichnen
  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      if (y == 4 && x == 0  y == 4 && x== 1  y == 3 && x == 1) {
        fill(color(255, 0, 0));
      }
      else {
        fill(color(255, 255, 255));
      }
      stroke(0);
      rect(x * w, y * w, w, w);
    }
  }
}
