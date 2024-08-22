int buttonX = 350;
int buttonY = 400;
int buttonWidth = 100; 
int buttonHeight = 50; 
int y = 0;
int x = 0;


void drawButton() {
  fill(0, 255, 0);  // Farbe des Knopfes
  rect(buttonX, buttonY, buttonWidth, buttonHeight);  // Zeichne den Knopf
  fill(255,0, 0);
  textSize(24);
  textAlign(CENTER, CENTER);
  text("Restart", buttonX + buttonWidth / 2, buttonY + buttonHeight / 2);  // Text im Knopf
 }

void mousepressed() {
  // Prüfe, ob der Knopf angeklickt wurde
  if (mouseX > buttonX && mouseX < buttonX + buttonWidth && mouseY > buttonY && mouseY < buttonY + buttonHeight) {
    resetGame();// Funktion, die das Spiel zurücksetzt und zum Start führt
    //loop();
  }
}
void resetGame() {
  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      // Bedingung für die Startposition
      if (y == 3 && x == 0) { // Beispiel: Startposition ist (0, 1)
        playerStartX = x * w + w / 2; // Mitte des Quadrats
        playerStartY = y * w + w / 2; // Mitte des Quadrats
        playerX = playerStartX;
        playerY = playerStartY;
        playerRadius = 40;
        return;

      }
    }
  }
}
