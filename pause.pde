void pause() {
  theme.pause();
  stroke(0);
  fill(0);
  textSize(100);

  text( "PAUSE", 250, height/2);
  if (spacekey == true) { 
    mode = PAUSE;
  } else if (spacekey == false) {
    mode = GAME;
  }
}



void pauseClicks() {
}
