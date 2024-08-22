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
    text("Congratulations!", width / 2, height / 2);
    noLoop();
    stopTimer();
    punkte = 1000 - elapsedTime * 50 + playerRadius * 5;
    fill(0, 0, 0);
    textSize(32);
    String text = "Punkte: " + punkte;
    text(text, width / 2 - 100, height - 50);
  }
  if (gameOver == true){
    fill(255, 255, 255);
    textSize(130);
    textAlign(CENTER, CENTER);
    text("Game Over!", width / 2, height / 2);
    noLoop();
    stopTimer();
  }
}
