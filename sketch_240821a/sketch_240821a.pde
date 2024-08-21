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
      if ( y == 1 && x == 19 || y == 1 && x == 18 || y == 1 && x == 17 || y == 1 && x == 16 || y == 1 && x == 15 || y == 1 && x == 14 || y == 1 && x == 13 || y == 2 && x == 13 || y == 3 && x == 13 || y == 4 && x == 13|| y == 5 && x == 13 || y == 6 && x == 13 || y == 7 && x == 13 || y == 7 && x == 12 || y == 3 && x == 0 || y == 3 && x== 1 || y == 3 && x == 2 || y == 3 && x == 3  || y == 3 && x == 4 || y == 3 && x == 5 || y == 3 && x == 6 || y == 3 && x == 7 || y == 3 && x == 8 || y == 4 && x == 8 || y == 5 && x == 8 || y == 6 && x == 8 || y == 7 && x == 8 || y == 7 && x == 9 || y == 7 && x == 10 || y == 7 && x == 11) {
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
