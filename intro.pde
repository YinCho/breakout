void intro() {
  theme.play();
  image(gif[f], 0, 0, width, height);
  f++;
  if (f == numberOfFrames) f = 0;
  fill(#FE4A49);
  textSize(70);
  text("BREAKOUT",220,100);
  
}
 

void introClicks() {
  if (mouseX > 0 && mouseX < 800 && mouseY > 0 && mouseY < 800) {
    mode = GAME;
  }
}
