import java.io.File;

String filePath = "C:\\Users\\janis\\labyrinth\\Version1_2\\highscores.txt";

int cols = 20;  // Anzahl der Spalten
int rows = 10;  // Anzahl der Zeilen
int w;          // Breite und Höhe der Quadrate
int playerX, playerY; // Position der Scheibe
int playerRadius = 40;
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
int rectHeight = 1000; 
int startTime;     // Zeitstempel wann der Timer gestartet wurde
int elapsedTime;   // Verstrichene Zeit in Sekunden
boolean timerRunning = false; // Flag, ob der Timer läuft
boolean TimerStart = false;
boolean TimerStartInterrupter = false;
boolean gameOver = false;

boolean gameEndTriggered = false;

String name = "";
String[] names;
int[] scores;
int maxHighscores = 10;
int insertIndex = 0;
String inputText = "";
boolean inputActive = false;

void setup() {
  size(1800, 900);
  w = width / cols;
  frameRate(120);
  noFill();
  noStroke();
  rect(rectX, rectY, rectWidth, rectHeight);
  
  names = new String[maxHighscores];
  scores = new int[maxHighscores];
  
  loadHighscores();
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
  fill(200); // Textfeld-Hintergrundfarbe
  rect(50, 50, 700, 50); // Textfeld Rechteck

  // Zeichne den eingegebenen Text
  fill(0); // Textfarbe
  textSize(32); // Textgröße anpassen
  text(inputText, 55, 85); // Zeige den eingegebenen Text an

  // Zeichne den Cursor, wenn das Textfeld aktiv ist
  if (inputActive) {
    float cursorX = textWidth(inputText) + 55; // Cursor-Position basierend auf dem Text
    stroke(0); // Cursor-Farbe
    line(cursorX, 55, cursorX, 85); // Zeichne den Cursor als Linie
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
    fill(255, 255, 255);
    textSize(50);
    text(elapsedTime, width - 1500, height - 40);
  }
}
