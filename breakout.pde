



////// SPACE BAR TO PAUSE




import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//Arrays
int [] x;
int [] y;
boolean[] alive;
int brickd;
int n;
int tempx, tempy;
int i, g,f;



//gif
PImage[] gif;
int numberOfFrames;

//sound
Minim minim; 
AudioPlayer theme, coin, bump, gameover;

color darkblue = #272D4D;
color purple   = #B83564;
color mango    = #FF6A5A;
color orange   = #FFB350;    
color green    = #83B8AA;    
color white    = #FFFFFF;
color black    = #000000;

int mode;
final int INTRO     = 1;
final int GAME      = 2;
final int PAUSE     = 3;
final int GAMEOVER  = 4;

float a;

float bx, by, bd, vx, vy, px, py, pd;

boolean akey, dkey, leftkey, rightkey, spacekey;

int score, lives, timer;

void setup() {

  numberOfFrames = 72;
  gif = new PImage[numberOfFrames];

  int g = 0;
  while (g < numberOfFrames) {
    gif[g] = loadImage("frame_"+g+"_delay-0.05s.gif");
    g++;
  }

  size(800, 800);
  mode = INTRO;
  brickd = 50;
  n = 28;
  x = new int[n];
  y = new int[n];
  alive = new boolean[n];
  tempx = 100;
  tempy = 100;
  lives = 3;
  score = 0;
  int i = 0;


  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 100;
    if (tempx == width) {
      tempx = 100;
      tempy = tempy + 100;
    }
    i=i+1;
  }

  //set up paddle and ball
  bx = width/2;
  by = height-200;
  bd = 10;
  px = width/2;
  py = height;
  pd = 100;
  vx = 0;
  vy = 2;

  //initialize keyboard variables
  akey = dkey = leftkey = rightkey = false;

  //minim
  minim = new Minim(this);
  theme = minim.loadFile("theme.wav");
  coin = minim.loadFile("coin.wav");
  bump = minim.loadFile("bump.wav");
  gameover = minim.loadFile("gameover.wav");
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("MODE ERROR in draw " + mode);
  }
}
