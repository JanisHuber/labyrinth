int cols = 20;  // Anzahl der Spalten
int rows = 10;  // Anzahl der Zeilen
int w;          // Breite und Höhe der Quadrate
int lives = 3;  // Anzahl Leben
int playerX, playerY; // Position der Scheibe
int playerRadius = 20; // Radius der Scheibe
boolean isMouseOver = false; // Flag, ob die Maus über der Scheibe ist
boolean isDragging = false;

void setup() {
  size(1000, 600);
  w = width / cols;
  frameRate(240);  
  playerX = 500;
  playerY = 300;
}

void draw() {
  zeichneArray();
  spielerPosition();
  spielerKollision();
  spielEnde();
}
