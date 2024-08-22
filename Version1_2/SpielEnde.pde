void spielEnde() {
  // Position und Grösse vom Ziel
  int greenFieldX = 19 * w;
  int greenFieldY = 1 * w;
  int greenFieldSize = w;

  // Überprüfen, ob der Kreis komplett im Ziel ist
  if (playerX - playerRadius >= greenFieldX &&
    playerX + playerRadius <= greenFieldX + greenFieldSize &&
    playerY - playerRadius >= greenFieldY &&
    playerY + playerRadius <= greenFieldY + greenFieldSize) {
    gameEnde = true;
  }

  // Game Ende
  if (gameEnde) {
    fill(0, 255, 0, 25);
    rect(0, 0, width, height);
    
    fill(255, 255, 255);
    textSize(130);
    textAlign(CENTER, CENTER);
    text("Congratulations!", width / 2, height / 2);
    
    stopTimer(); // Timer stoppen
    punkte = 1000 - elapsedTime * 50 + playerRadius * 5;
    
    // Highscores
    fill(255, 255, 255);
    textSize(50);
    text("Punkte: " + punkte, width / 2, height - 50);
    
    loadHighscores();
    addHighscore(name, punkte);
    noLoop();
    
    // Zeige die Highscores an
    fill(255, 0, 0);
    textSize(30);
    textAlign(LEFT, TOP); // Justiere die Ausrichtung entsprechend
    
    for (int i = 0; i < maxHighscores; i++) {
      if (names[i] != null) {
        text((i + 1) + ". " + names[i] + ": " + scores[i], 50, 50 + i * 40);
      }
    }
    
    saveHighscores(); // Speichern der Highscores nach dem Update
  }
  
  // Game Over
  if (gameOver) {
    fill(255, 255, 255);
    textSize(130);
    textAlign(CENTER, CENTER);
    text("Game Over!", width / 2, height / 2);
    stopTimer(); // Timer stoppen
    noLoop(); // Zeichenschleife stoppen
  }
}
