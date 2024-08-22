void startTimer() {
  startTime = millis(); // Setzt den Startzeitpunkt auf die aktuelle Zeit
  timerRunning = true;
}

void stopTimer() {
  timerRunning = false; // Setzt das Timer-Flag auf false, um den Timer zu stoppen
}
