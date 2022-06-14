void game() {
  theme.play();
  theme.rewind();
  background(darkblue);

  //scores
  textSize(30);
  fill(#6B818C);
  text("Score: " + score, 600, 50);
  timer = timer -1;

  //lives
  text("Lives: " + lives, 50, 50);

  //paddle-----------------------------------------------

  fill(white);             //draw paddle
  circle(px, py, pd);
  if (akey || leftkey) px = px - 5;   //key movement
  if (dkey || rightkey) px = px + 5;

  //ball--------------------------------------------------

  fill(white);             //draw ball
  circle(bx, by, bd);
  bx = bx + vx;            //movement
  by = by + vy;

  //bouncing
  if (dist(bx, by, px, py) < bd/2 + pd/2) { //paddle bounce
    vx = (bx - px)/10;
    vy = (by - py)/10;
    bump.play();
    bump.rewind();
  }

  if (by < bd/2) { //bounce off top
    vy = vy * -1;
    bump.play();
    bump.rewind();
  }
  if (bx < bd/2 || bx > width-bd/2) { //bounce off side
    vx = vx * -1;
    bump.play();
    bump.rewind();
  }

  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
      manageBrick(i);
    }
    i++;
  }
  //scoring
  if (by > 800) {
    lives = lives - 1;
    bx = width/2;
    by = height/2+100;
    timer = 100;
  } else {
    if (lives == 0) mode = GAMEOVER;
  }
  if (spacekey == true) {
    mode = PAUSE;
  }
}

void gameClicks() {
}

void manageBrick (int i) {
  if (y[i] == 100) fill(purple);
  if (y[i] == 200) fill(mango);
  if (y[i] == 300) fill(orange);
  if (y[i] == 400) fill(green);
  circle(x[i], y[i], brickd);
  if (dist(bx, by, x[i], y[i]) < bd/2 + brickd/2) { //brick bounce
    vx = (bx - x[i])/8;
    vy = (by - y[i])/8;
    alive[i] = false;
    score = score + 1;
    if (score == 28) mode = GAMEOVER;
    coin.play();
    coin.rewind();
  }
}
