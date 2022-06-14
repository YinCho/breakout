void gameover() {

  if (score > 27) {
    background(#1E1E24);
    textSize(80);
    fill(#6CBEED);
    text("YOU WIN", 220, 320);
  } else {     
    background(#1E1E24);
    textSize(80);
    fill(211, 2, 2);
    text("YOU LOSE", 200, 320);
  }

  //return to game
  if (mouseX > 300 && mouseX < 500 && mouseY > 400 && mouseY < 500) {
    fill(200);
  } else {
    fill(146, 240, 140);
  }
  rect(300, 400, 200, 100);
  fill(0);
  textSize(30);
  text("RETURN", 340, 460);
}

void gameoverClicks() {
  if (mouseX > 300 && mouseX < 500 && mouseY > 400 && mouseY < 500) {
    setup();
  }
}
