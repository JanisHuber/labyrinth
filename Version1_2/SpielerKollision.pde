void spielerKollision() {
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
    
    if (playerRadius <= 10) {
      gameEnde = true;
      spielEnde();
    }
  }
}
