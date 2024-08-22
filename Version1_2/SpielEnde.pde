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
    if (!gameEndTriggered) {
            endTime = millis(); // Speichere den Zeitpunkt des Spielendes
            gameEndTriggered = true;
            stopTimer();
        }

       if (millis() - endTime > 2200) { // kurz warten
            background(18); // Grau einfärben
            fill(255);
            rect(1000, 50, width - 1050, height - 100);
            fill(0);
            textSize(80);
            text("Highscores", 1400, 150);
            noLoop(); // Stoppe die draw-Schleife

    
            loadHighscores();
            addHighscore(name, punkte);
            
            // Zeige die Highscores an
            fill(0, 0, 0);
            textSize(50);
            
            for (int i = 0; i < maxHighscores; i++) {
              if (names[i] != null) {
                text((i + 1) + ". " + names[i] + ": " + scores[i], 1150, 250 + i * 40);
              }
            }
            
            saveHighscores(); // Speichern der Highscores nach dem Update
      }
        else {
          fill(0, 255, 0, 30);
          rect(0, 0, width, height);
          fill(255, 255, 255);
          textSize(130);
          textAlign(CENTER, CENTER);
          text("Congratulations!", width / 2, height / 2);
          punkte = 1000 - elapsedTime * 50 + playerRadius * 5;
          fill(255, 255, 255);
          textSize(50);
          String text = "Punkte: " + punkte;
          text(text, width / 2, height - 50);

       }    

   
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
