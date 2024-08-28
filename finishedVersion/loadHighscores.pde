void loadHighscores() {
  String[] lines = loadStrings(filePath);
  if (lines != null) {
    for (int i = 0; i < maxHighscores; i++) {
      if (i < lines.length) {
        String[] parts = lines[i].split(";");
        if (parts.length == 2) {
          names[i] = parts[0];
          scores[i] = int(parts[1]);
        }
      } else {
        names[i] = null;
        scores[i] = 0;
      }
    }
  }
}
