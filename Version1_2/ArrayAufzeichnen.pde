void zeichneArray() {
    background(255);
  
  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      if (level[x][y] == 1)  {
        fill(color(255, 0, 0)); // Rot 
        if (startFound == false) {
          playerStartX = x * w + w / 2; // Mitte des Quadrats
          playerStartY = y * w + w / 2; // Mitte des Quadrats
          playerX = playerStartX;
          playerY = playerStartY;
          startFound = true;
        }
      }
      else if (level[x][y] == 2) {
        fill(color(0, 255, 0));
      }
      else {
        fill(color(18, 18, 18)); // Schwarz
      }
      noStroke();
      rect(x * w, y * w, w, w); // Immer das Quadrat zeichnen
    }
  }
}
