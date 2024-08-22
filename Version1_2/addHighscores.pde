void addHighscore(String newName, int newScore) {
  int insertIndex = -1;
  
  // Finde die Position, an der der neue Highscore eingefügt werden soll
  for (int i = 0; i < maxHighscores; i++) {
    if (names[i] == null || scores[i] < newScore) {
      insertIndex = i;
      break;
    }
  }
  
  // Falls ein gültiger Index gefunden wurde
  if (insertIndex != -1) {
    // Verschiebe die niedrigeren Scores nach unten, wenn die Liste voll ist
    if (names[maxHighscores - 1] != null) {
      // Verschiebe alle Elemente nach unten, um Platz für den neuen Highscore zu schaffen
      for (int i = maxHighscores - 1; i > insertIndex; i--) {
        names[i] = names[i - 1];
        scores[i] = scores[i - 1];
      }
    }
    
    // Füge den neuen Highscore ein
    names[insertIndex] = name;
    scores[insertIndex] = punkte;
  }
}
