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
int startTime;
int elapsedTime;   // Verstrichene Zeit in Sekunden
boolean timerRunning = false; // ob der Timer läuft
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

int[][] level;
int quadratPlace = 0;
boolean placeIndex = false;
int skipY = 0;

boolean gameInterrupter = false;

int EndCoordinates = 0;

void setup() {
  size(1800, 910);
  w = width / cols;
  frameRate(120);
  noFill();                                    
  noStroke();
  rect(rectX, rectY, rectWidth, rectHeight); // CheatRechteck
  names = new String[maxHighscores];         //Highscores
  scores = new int[maxHighscores];
  loadHighscores();
  restartButton = new Button("Restart", width/2 - 50, height - 100, 150, 50);
  
  level = new int[cols][rows];
  int x = 0;
  int y = int(random(3, rows)); //Erstes Feld
  level[x][y] = 1;
  
  int[] coordinates = new int[2];
  coordinates[0] = x;
  coordinates[1] = y;

  while (coordinates[0] < cols - 1) {
    zeichneArray();
    coordinates = setNext(coordinates[0], coordinates[1]);
    print(coordinates[0], coordinates[1]);
    if (coordinates[0] == 19) {
      level[19][coordinates[1]] = 2;
      EndCoordinates = coordinates[1];
    }
  }
}

int[] setNext(int prevX, int prevY) {
  int[] result = new int[2];  // result[0] -> neues x, result[1] -> neues y
  
  while (true) {
    int i = int(random(3));
    
    if (i == 0 && prevY > 0 && level[prevX][prevY - 1] == 0 && skipY >= 2) { // oben
      level[prevX][prevY - 1] = 1;
      result[0] = prevX;
      result[1] = prevY - 1;
      skipY = 0;
      return result;
    } 
    else if (i == 1 && prevX + 1 < cols && level[prevX + 1][prevY] == 0) { // rechts
      level[prevX + 1][prevY] = 1;
      result[0] = prevX + 1;
      result[1] = prevY;
      skipY ++;
      return result;
    } 
    else if (i == 2 && prevY + 1 < rows && level[prevX][prevY + 1] == 0 && skipY >= 2) { // unten
      level[prevX][prevY + 1] = 1;
      result[0] = prevX;
      result[1] = prevY + 1;
      skipY = 0;
      return result;
    }
  }
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
  spielEnde(EndCoordinates);
  if (timerRunning) {
    elapsedTime = (millis() - startTime) / 1000;
    fill(255, 255, 255);
    textSize(50);
    text(elapsedTime, width - 1500, height - 40);
  }
}
