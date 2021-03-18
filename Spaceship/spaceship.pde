//Implement something like this in your Asteroids code so we can upgrade it later
PImage spaceship; // picture for spaceship
float spacex, spacey; //coordinates for spaceship
int numAst = 15; //# of asteroid
float[] x, y; // coordinates for asteroid
float laserX,laserY, laserSX, laserSY; //coordinates for laser beam
boolean isGood; // life
float guessX, guessY; //random locations for asteroid
int screen; // game vs end screen
float[] a, b, sx, sy; 
boolean[] isAlive; //life
float playerX, playerY, playerSX; //player coordinates
int forever21; //21 savage
//all rest for background
int arraySize = 300; 
int[] ax, ay, jm;
int e, f;

void setup(){
size(640,480);

forever21 = 21;

e = 640;
f = floor(random(height));

//background
ax = new int[arraySize];
ay = new int[arraySize];
jm = new int[arraySize];
for (int i=0; i < ax.length; i = i+1) {
ax[i] = 640 + floor(random(100));
ay[i] = floor(random(height));

jm[i] = 1 + floor(random(9));
}

//asteroid movement
x = new float[numAst];
y = new float[numAst];
sx = new float[numAst];
sy = new float[numAst];
isAlive = new boolean[numAst];

for (int i=0; i < numAst; i++) {
x[i] = random(width);
y[i] = random(height);

sx[i] = random(2) - 1;
sy[i] = random(2) - 1;

 isAlive[i] = true;
}

playerX = 100;
playerY = 100;
playerSX = 1;

x = new float[numAst];
y = new float[numAst];

screen = 1;


for (int i=0; i < numAst; i=i+1) {
guessX = random(width);
guessY = random(height);
isGood = false;

while (isGood == false) {
guessX = random(width);
guessY = random(height);
isGood = true;
for (int j=0; j < i; j++) {
if (dist(x[j], y[j], guessX, guessY) < 50) {
isGood = false;
}
}
}

x[i] = guessX;
y[i] = guessY;

//loads spaceship image
spaceship = loadImage("spaceship.png");

spacex = 200;
spacey = 200;

laserX = -100;
laserY = -100;
laserSX = 0;
laserSY = 0;

}
}

void draw(){
  
//game menu
if(screen == 1){
  
background(0);
fill(255);
f = f - 10;

if (f < 10) f = 640;

rect(e, f, 10, 10);

fill(200, 0, 0);

for (int i=0; i < ax.length; i = i + 1) {
ax[i] = ax[i] - jm[i];

if (ax[i] < 0) ax[i] = 640 + floor(random(width));;

rect(ax[i], ay[i], jm[i], jm[i]);
}


for (int i=0; i < numAst; i=i+1) {
if (isAlive[i] == true)
fill(135);
ellipse(x[i], y[i], 40, 40);
x[i] = x[i] + sx[i];
y[i] = y[i] + sy[i];

if (x[i] < 0) x[i] = width;
else if (x[i] > width) x[i] = 0;

 if (y[i] < 0) y[i] = height;
else if (y[i] > height) y[i] = 0;

 playerX = playerX + playerSX;
 
 
if(dist(spacex + 10, spacey + 10, x[i] + 13, y[i] + 13) < 20){
  screen = 2;
}
}
}

 
//Draw the laser
fill(255);
ellipse(laserX,laserY, 10,10);

if (spacex > width) {
  spacex = 0;
} else if (spacex < 0) {
  spacex = width;
}
if (spacey > height) {
  spacey = 0;
} else if (spacey < 0) {
  spacey = height;
}

laserX = laserX + laserSX;
laserY = laserY + laserSY;
image(spaceship, spacex - 13, spacey - 10, 20, 20);


//exit screen
if(screen == 2){
  background(255);
  textSize(20);
  fill(0);
  text("You Lose!", 100, 100);
  fill(0);
  rect(250, 300, 150, 50);
  fill(255);
  textSize(16);
  text("EXIT", 305, 330);

}
}

//mousePressed code for laser
void mousePressed(){
//Start values are x,y
//Destination is mouseX, mouseY

float laserSpeed = 12;

if(mouseX > 250 && mouseX < 400 && mouseY > 300 && mouseY < 350){
  exit();
}

laserSX = mouseX - spacex;
laserSY = mouseY - spacey;

laserSX = laserSpeed * laserSX / dist(spacex,spacey,mouseX,mouseY);
laserSY = laserSpeed * laserSY / dist(spacex,spacey,mouseX,mouseY);

laserX = spacex;
laserY = spacey;
}

//key pressed movement
void keyPressed(){

  if(key == 'w'){
   spacey = spacey - 10;
  }

    if(key == 'a'){
   spacex = spacex - 10;
  }
 
  if(key == 's'){
   spacey = spacey + 10;
  }

 if(key == 'd'){
   spacex = spacex + 10;
  }

}

//#BLM
