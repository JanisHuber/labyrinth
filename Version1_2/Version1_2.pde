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
boolean inputErklärungOn = true;

boolean gameEndTriggered = false;

String name = "";
String[] names;
int[] scores;
int maxHighscores = 10;
int insertIndex = 0;
String inputText = "";
boolean inputActive = false;

boolean reset = false;
Button restartButton;
boolean stopPlayerHighscore = false;
int runTime = 0;

void setup() {
  size(1800, 900);
  w = width / cols;
  frameRate(120);
  noFill();                                    
  noStroke();
  rect(rectX, rectY, rectWidth, rectHeight); // CheatRechteck
  names = new String[maxHighscores];         //Highscores
  scores = new int[maxHighscores];
  loadHighscores();
  restartButton = new Button("Restart", width/2 - 50, height - 100, 150, 50);
}

void draw() {
  if (reset) {
    resetSketch();  // Setze alles zurück
    reset = false;  // Schleife unterbrechen
  }
  
  if (TimerStart == true && TimerStartInterrupter == false) {
    startTimer();
    TimerStartInterrupter = true;
  }
  zeichneArray();
  textFeld();
  spielerPosition();
  spielerKollision();
  spielEnde();
  if (timerRunning) {
    elapsedTime = (millis() - startTime) / 1000;
    fill(255, 255, 255);
    textSize(50);
    text(elapsedTime, width - 1500, height - 40);
  }
}
