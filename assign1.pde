PImage bgImg;
PImage hugImg;
PImage lifeImg;
PImage robotImg;
PImage soliImg;
PImage soldierImg;
int x,y;//center
//soldier
float sx;
int sy;
float xSpeed;
int sWeight;
//robot
float rx,ry;
int rWeight;
//lazer
float lx,lxSpeed,gunx;
void setup() { 
  size(640,480);
  bgImg = loadImage("img/bg.jpg");
  hugImg = loadImage("img/groundhog.png");
  lifeImg = loadImage("img/life.png");
  robotImg = loadImage("img/robot.png");
  soliImg = loadImage("img/soil.png");
  soldierImg = loadImage("img/soldier.png");
  x = 320;
  y = 240;
  //soldier
  sx = 0;
  sy = floor(random(160,480));
  sWeight = 80;
  xSpeed = 5;
  //robot
  rWeight = 40;
  rx = random(160,640-rWeight);
  ry = floor(random(160,480));
  //lazer
  gunx = rx;
  lx = rx+20;
  lxSpeed =2;
  
  
}
 void draw(){
 //background
 image(bgImg,0,0);
 //grass
 rectMode(CENTER);
 fill(124,204,25);
 noStroke();
  rect(x,y/1.57,width,y/16);
 //hug
 imageMode(CENTER);
 image(hugImg,x,y-y/2);
 //solid
 imageMode(CORNER);
 image(soliImg,0,y-y/3);
 //life
 imageMode(CORNER);
 image(lifeImg,x/32,y/24,50,50);
 image(lifeImg,x/32+70,y/24,50,50);
 image(lifeImg,x/32+140,y/24,50,50);
 
 //sun
 fill(253,184,19);
 stroke(255,255,0);
 strokeWeight(5);
 ellipse(width-50,50,120,120);
 
 //soldier
 sx = sx + xSpeed;
if(sx>width){sx = 0;
             sy =floor(random(160,480));}
  

  if(sy<240){sy = 160;}
  else if (sy<320){sy = 240;}
  else if (sy<400){sy = 320;}
  else if (sy<480){sy = 400;}

  image(soldierImg,sx,sy);

  //lazer
  lx = lx-lxSpeed;
  if(gunx-lx>145){lx = gunx+20;}
  stroke(255,0,0);
  strokeWeight(10);
  line(lx,ry+37,lx-40,ry+37);
  
  //robot
  if(ry<240){ry = 160;}
  else if (ry<320){ry = 240;}
  else if (ry<400){ry = 320;}
  else if (ry<480){ry = 400;}
  image(robotImg,rx,ry);
  

}
