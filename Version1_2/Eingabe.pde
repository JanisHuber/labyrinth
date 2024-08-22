void keyPressed() {
  if (inputActive) {
    // Füge die gedrückte Taste zum Eingabetext hinzu
    if (keyCode == BACKSPACE) {
      if (inputText.length() > 0) {
        inputText = inputText.substring(0, inputText.length() - 1);
      }
    } else if (keyCode == ENTER) {
      // Verarbeite die Eingabe, wenn Enter gedrückt wird
      processInput();
    } else {
      // Füge den eingegebenen Text hinzu
      inputText += key;
    }
  }
}

void keyReleased() {
  // Deaktivieren des Textfeldes bei ESCAPE
  if (key == ESC) {
    inputActive = false;
  }
}

void mousePressed() {
  // Prüfen, ob auf das Textfeld geklickt wurde
  if (mouseX > 50 && mouseX < 750 && mouseY > 50 && mouseY < 100) {
    inputActive = true;
  } else {
    inputActive = false;
  }
}

void processInput() {
  name = inputText;
}
