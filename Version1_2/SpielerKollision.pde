void spielerKollision() {
  if (get(playerX, playerY) == color(255, 0, 0)) {
    playerRadius = playerRadius -2;
    gameEnde = true;
    spielEnde();
  }
}
