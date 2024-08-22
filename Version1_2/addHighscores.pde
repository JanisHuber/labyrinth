void addHighscore(String newName, int newScore) {
  int insertIndex = -1;
  
  // Finde die Position, an der der neue Highscore eingefügt werden soll
  for (int i = 0; i < maxHighscores; i++) {
    if (scores[i] == 0 || scores[i] < newScore) {
      insertIndex = i;
      break;
    }
  }
  
  // Falls ein gültiger Index gefunden wurde
  if (insertIndex != -1) {
      for (int i = maxHighscores - 1; i > insertIndex; i--) {
        names[i] = names[i - 1];
        scores[i] = scores[i - 1];
      }
    
    // Füge den neuen Highscore ein
    names[insertIndex] = newName;
    scores[insertIndex] = newScore;
  }
}
