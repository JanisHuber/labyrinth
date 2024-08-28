void keyPressed() {
  if (inputActive) {
    // Füge die gedrückte Taste zum Eingabetext hinzu
    if (keyCode == BACKSPACE) {
      if (inputText.length() > 0) {
        inputText = inputText.substring(0, inputText.length() - 1);
      }
    } else if (keyCode == ENTER) {
      processInput();
    } else {
      inputText += key;
    }
  }
}

void keyReleased() {
  if (key == ESC) {
    inputActive = false;
  }
}

void mousePressed() {
  
  if (restartButton.isMouseOver()) { //Reset button
    reset = true;
  }
  if (mouseX > 50 && mouseX < 750 && mouseY > 50 && mouseY < 100) { //EingabeFeld
    inputActive = true;
    inputErklärungOn = false;
  } else {
    inputActive = false;
  }
}

void processInput() {
  name = inputText;
}
