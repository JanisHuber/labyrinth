void spielEnde() {
  // Position und Grösse vom Ziel
  int greenFieldX = 19 * w;
  int greenFieldY = 1 * w;
  int greenFieldSize = w;

  // Überprüfen ob der Kreis komplett im Ziel ist
  if (playerX - playerRadius >= greenFieldX &&
    playerX + playerRadius <= greenFieldX + greenFieldSize &&
    playerY - playerRadius >= greenFieldY &&
    playerY + playerRadius <= greenFieldY + greenFieldSize) {
    gameEnde = true;
  }

  //Game Over
  if (gameEnde) {
    fill(255, 255, 255);
    textSize(130);
    textAlign(CENTER, CENTER);
    text("Game Over!", width / 2, height / 2);
    noLoop();
  }
}
