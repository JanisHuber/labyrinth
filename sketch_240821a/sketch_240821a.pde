int cols = 20;  // Anzahl der Spalten
int rows = 10;  // Anzahl der Zeilen
int w;          // Breite und Höhe der Quadrate
int lives = 3;  // Anzahl Leben
int playerX, playerY; // Position der Scheibe
int playerRadius = 20; // Radius der Scheibe

void setup() {
  size(1000, 600);
  w = width / cols;
  frameRate(240);
  
  playerX = 500;
  playerY = 300;
  }

void draw() {
  background(255);
  
//Array aufzeichnen
  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      if (y == 4 && x == 0 || y == 4 && x== 1 || y == 3 && x == 1) {
        fill(color(255, 0, 0));
      }
      else {
        fill(color(255, 255, 255));
      }
      stroke(0);
      rect(x * w, y * w, w, w);
    }
  }
  //SpielerPosition updaten
  playerX = mouseX;
  playerY = mouseY;
  
  // Zeichne Spieler
  fill(0, 0, 255);
  noStroke();
  ellipse(playerX, playerY, playerRadius * 2, playerRadius * 2);
}
