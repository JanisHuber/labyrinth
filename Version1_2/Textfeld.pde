void textFeld() {  
  if (runTime == 0) {
      fill(200); // Textfeld-Hintergrundfarbe
      rect(50, 50, 700, 50); // Textfeld Rechteck
    
      // Zeichne den eingegebenen Text
      fill(0); // Textfarbe
      textSize(32); // Textgröße anpassen
      text(inputText, 55, 85); // Zeige den eingegebenen Text an
      String InputErklärung = "Tippe deinen Namen ein...";
      if (inputErklärungOn == true){
        text(InputErklärung, 55, 85);
      }
      if (inputActive) { //Cursor
        float cursorX = textWidth(inputText) + 55;
        stroke(0); // Cursor-Farbe
        line(cursorX, 55, cursorX, 85);
      }
    }
}
