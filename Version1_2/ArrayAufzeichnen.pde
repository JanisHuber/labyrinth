void zeichneArray() {
  background(255);
  
  // Setzt startFound auf false, um sicherzustellen, dass der Startpunkt korrekt gefunden wird
  
  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      if (y == 1 && (x == 18 || x == 17 || x == 16 || x == 15 || x == 14 || x == 13) ||
          (y >= 2 && y <= 7 && x == 13) ||
          (y == 7 && x == 12) ||
          (y == 3 && (x >= 0 && x <= 8)) ||
          (y >= 4 && y <= 7 && x == 8) ||
          (y == 7 && (x >= 9 && x <= 11))) {
        fill(color(255, 0, 0)); // Rot
        // Setze den Startpunkt nur einmal
        if (startFound == false) {
          playerStartX = x * w + w / 2; // Mitte des Quadrats
          playerStartY = y * w + w / 2; // Mitte des Quadrats
          playerX = playerStartX;
          playerY = playerStartY;
          startFound = true;
        }
    } else if (y == 1 && x == 19) {
        fill(color(0, 255, 0)); // Grün
    } else {
        fill(color(18, 18, 18)); // Weiß
      }
      noStroke();
      rect(x * w, y * w, w, w); // Immer das Quadrat zeichnen
    }
  }
}
