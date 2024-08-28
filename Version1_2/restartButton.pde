void resetSketch() {
  loop();
  playerRadius = 40;
  isMouseOver = false;
  isDragging = false;
  playerStartX = 0;
  playerStartY = 0;
  startFound = false;
  gameEnde = false;
  endTime = 0;
  controlCheating = false;
  punkte = 0;
  rectX = -50;
  rectY = -50; 
  rectWidth = 1900;
  rectHeight = 1000; 
  startTime = 0;     // Zeitstempel wann der Timer gestartet wurde
  timerRunning = false; // Flag, ob der Timer läuft
  TimerStart = false;
  TimerStartInterrupter = false;
  gameOver = false;
  inputErklärungOn = true;
  
  gameEndTriggered = false;
  reset = false;
  
  stopPlayerHighscore = false;
  insertIndex = -1;
  runTime ++;
}

class Button {
  String label = "Restart";
  float x, y, w, h;
  
  Button(String label, float x, float y, float w, float h) {
    this.label = label;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void display() {
    textSize(32);
    fill(150);
    rect(x, y, w, h);
    fill(255);
    textAlign(CENTER, CENTER);
    text(label, x + w/2, y + h/2);
  }
  
  boolean isMouseOver() {
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }
}
