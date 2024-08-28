import processing.sound.*;
SoundFile file;
boolean rightsoundPlayed = false;
boolean wrongsoundPlayed = false;

void spielEnde(int coordinates) {
  // Position und Grösse vom Ziel
  int greenFieldX = 19 * w;
  int greenFieldY = coordinates * w;
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
            background(18);
            fill(255);
            rect(1000, 50, width - 1050, height - 100);
            fill(0);
            textSize(80);
            text("Highscores", 1375, 140);
            loadHighscores();
            if (stopPlayerHighscore == false) {
              addHighscore(name, punkte);
            }
            fill(255);
            textAlign(CENTER, CENTER);
            textSize(130);
            text("Deine Punkte:", 500, 225);
            fill(255);
            textAlign(CENTER, CENTER);
            textSize(130);
            text(punkte, 500, 350);
            fill(0, 0, 0);
            textAlign(LEFT, CENTER);
            textSize(50);
            fill(0, 0, 0);
            textSize(50);
            for (int i = 0; i < maxHighscores; i++) {
              if (names[i] != null) {
                text((i + 1) + ". " + names[i] + " : " + scores[i], 1080, 280 + i * 50);
              }
            }
            if (stopPlayerHighscore == false) {
              saveHighscores(); // Speichern der Highscores nach dem Update
              stopPlayerHighscore = true;
            }
            restartButton = new Button("Restart", width/2 - 525, height - 400, 250, 100);
            restartButton.display();
            gameInterrupter = true;
      }
        else {
         if (!rightsoundPlayed) {
            file = new SoundFile(this, "goodresult-82807.wav");
            file.amp(0.5);
            file.play();
            rightsoundPlayed = true;
         }
          fill(0, 255, 0, 30);
          rect(0, 0, width, height);
          fill(255, 255, 255);
          textSize(130);
          textAlign(CENTER, CENTER);
          text("Congratulations!", width / 2, height / 2);
          punkte = 1000 - elapsedTime * 50 + playerRadius * 5;
          if (punkte < 0) {
            punkte = 0;
          }
          fill(255, 255, 255);
          textSize(50);
          String text = "Punkte: " + punkte;
          text(text, width / 2, height - 50);
          gameInterrupter = true;

       }    

   
  }
  
  // Game Over
  if (gameOver) {
    if (!wrongsoundPlayed) {
      file = new SoundFile (this, "wah-wah-sad-trombone-6347.wav");
      file.amp(0.5);
      file.play();
      wrongsoundPlayed = true;
    }
    fill(255, 255, 255);
    textSize(160);
    textAlign(CENTER, CENTER);
    text("Game Over!", width / 2, height / 2);
    stopTimer(); // Timer stoppen
    restartButton.display();
    gameInterrupter = true;
    restartButton = new Button("Restart", width/2 - 125, height - 200, 250, 100);
    restartButton.display();
  }
}
