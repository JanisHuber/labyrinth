void spielerPosition() {
  
  isMouseOver = dist(mouseX, mouseY, playerX, playerY) < playerRadius;

  if (isMouseOver && mousePressed) {
    isDragging = true;
    controlCheating = true;
    TimerStart = true;
  }

  if (!mousePressed || gameEnde == true) {
    isDragging = false;
  }

  if (isDragging == true && gameInterrupter == false) {
    playerX = mouseX;
    playerY = mouseY;
  }
  
  // Zeichne den Spieler
  fill(0, 0, 255);
  noStroke();
  ellipse(playerX, playerY, playerRadius * 2, playerRadius * 2);
}
