int redScreen = 0;

void spielerKollision() {
  if (controlCheating == true) {
    if (playerX - playerRadius < rectX || playerX + playerRadius > rectX + rectWidth || playerY - playerRadius < rectY ||  playerY + playerRadius > rectY + rectHeight) {
      gameOver = true;
      spielEnde();
    }
  }
  boolean collisionDetected = false;
  int test = 0 - playerRadius;

  for (int dx = +playerRadius; dx >= test; dx--) {
    for (int dy = +playerRadius; dy >= test; dy--) {
      int x = playerX + dx;
      int y = playerY + dy;

      if (dist(playerX, playerY, x, y) <= playerRadius + 1) { // Prüfen, ob der aktuelle Punkt innerhalb des Kreises liegt
        if (get(x, y) == color(18, 18, 18)) {
          collisionDetected = true;
          break;
        }
      }
    }
    if (collisionDetected == true) break;
  }


  if (collisionDetected) {
    playerRadius = max(playerRadius - 2, 10); // Spielergrösse verkleinern
    redScreen = 80;

    if (playerRadius <= 10) {
      gameOver = true;
      spielEnde();
    }
  }

  if (redScreen > 0) {
    fill(255, 0, 0, redScreen);
    rect(0, 0, width, height);
    redScreen = max(0, redScreen - 4);
    if (gameEnde == true) {
      redScreen = 0;
    }
  }
}
