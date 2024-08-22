int cols = 20;  // Anzahl der Spalten
int rows = 10;  // Anzahl der Zeilen
int w;          // Breite und Höhe der Quadrate
int playerX, playerY; // Position der Scheibe
int playerRadius = 40; // Radius der Scheibe
boolean isMouseOver = false;
boolean isDragging = false;
int playerStartX = 0;
int playerStartY = 0;
boolean startFound = false;
boolean gameEnde = false;
int endTime = 0;
boolean controlCheating = false;
int punkte = 0;
int rectX = -50;
int rectY = -50; 
int rectWidth = 1900;
int rectHeight = 1100; 
int startTime;     // Zeitstempel wann der Timer gestartet wurde
int elapsedTime;   // Verstrichene Zeit in Sekunden
boolean timerRunning = false; // Flag, ob der Timer läuft
boolean TimerStart = false;
boolean TimerStartInterrupter = false;
boolean gameOver = false;

void setup() {
  size(1800, 1000);
  w = width / cols;
  frameRate(120);
  noFill();
  noStroke();
  rect(rectX, rectY, rectWidth, rectHeight);
  
}

void draw() {
  if (TimerStart == true && TimerStartInterrupter == false) {
    startTimer();
    TimerStartInterrupter = true;
  }
  zeichneArray();
  fill(18, 18, 18); 
    rect(850, 100, 200, 500);
    
  if (playerX > 850 && playerX < 1050 && playerY > 100 && playerY < 600) {
      gameOver = true;
      spielEnde();
  }
  spielerPosition();
  spielerKollision();
  spielEnde();
  if (controlCheating == true) {
    if (playerX - playerRadius < rectX || playerX + playerRadius > rectX + rectWidth || playerY - playerRadius < rectY ||  playerY + playerRadius > rectY + rectHeight) {
      gameOver = true;
      spielEnde();
    }
    
  }
  if (timerRunning) {
    elapsedTime = (millis() - startTime) / 1000;
    fill(0, 0, 0);
    textSize(50);
    text(elapsedTime, width - 1500, height - 40);
  }
    
     
}

void Punkte() {
  
}
