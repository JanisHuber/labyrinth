void saveHighscores() {
  String[] lines = new String[maxHighscores];
  for (int i = 0; i < maxHighscores; i++) {
    if (names[i] != null) {
      lines[i] = names[i] + ";" + scores[i];
    } else {
      lines[i] = "";
    }
  }
  saveStrings(filePath, lines);
}
