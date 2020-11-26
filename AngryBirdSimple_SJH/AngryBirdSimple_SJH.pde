import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
Redbird redbird;
Floor floor1;
Floor2 floor2;
//Resortera resortera;
Bar1 bar1;
Bar2 bar2;
Bar3 bar3;
Bar4 bar4;
Bar5 bar5;
Bar6 bar6;
Bar7 bar7;
Bar8 bar8;
Pig pig;
Pig pig2;
PImage sky;
PImage slingshot;
boolean shot = false;
PImage start;

int level = 2;
int stage = 0;
int points = 0;
PImage sceen1;
 int i=0;
 int t=0;
ArrayList<Vec2> plist = new ArrayList<Vec2>();
boolean redcollide = false;

void setup() {
  size(1000, 335);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0.0,-5.0);
  box2d.listenForCollisions();
  
  sky = loadImage("sky.png");
  slingshot = loadImage("slingshot.png");
  start = loadImage("gshslogo.png");
  sceen1 = loadImage("gshslogo.png");
  
  
}

void draw() {
  
  box2d.step();
  if(stage == 0){
    background(sky);
    image(start,900,235,100,100);
    strokeWeight(2);
    if(dist(mouseX,mouseY,469,177)<=75)
    {
      textSize(50);
      fill(175,175,0);
      text("START!", 390, 260);
      fill(#E4FF0B);
      stroke(#B4CF00);
    }
    else
    {
      textSize(50);
      fill(200,200,0);
      text("START!", 390, 260);
      fill(#EEFF65);
      stroke(#BECF35);
    }
    ellipse(469,177,75,75);
    triangle(450,150,450,205,500,177);
  }
  
  
  else if(stage == 1){
    if(t==0){
    redbird = new Redbird();
    floor1 = new Floor();
    floor2 = new Floor2();
    //resortera = new Resortera();
    bar1 = new Bar1(new Vec2(540,237));
    bar2 = new Bar2(new Vec2(620,237));
    bar3 = new Bar3(new Vec2(580,179));
    bar4 = new Bar4(new Vec2(550,131));
    bar5 = new Bar5(new Vec2(610,131));
    bar6 = new Bar6(new Vec2(580,161));
    bar7 = new Bar7(new Vec2(578,85));
    bar8 = new Bar8(new Vec2(580,59));
    pig = new Pig(new Vec2(579,137));
    /*bar1 = new Bar1(new Vec2(540,240));
    bar2 = new Bar2(new Vec2(620,240));
    bar3 = new Bar3(new Vec2(580,178));
    bar4 = new Bar4(new Vec2(550,130));
    bar5 = new Bar5(new Vec2(610,130));
    bar6 = new Bar6(new Vec2(580,160));
    bar7 = new Bar7(new Vec2(578,105));
    bar8 = new Bar8(new Vec2(580,80));
    pig = new Pig(new Vec2(580,150));*/
    points = 0;
    }
    
    background(sky);
  
    
    
    if(!shot) {
    ArrayList<Vec2> tra = new ArrayList();
    Vec2 mouse = new Vec2(mouseX,mouseY);
    Vec2 red = new Vec2(60,188);
    mouse.subLocal(red);
    Vec2 go = new Vec2(0,0);
    go.x = box2d.scalarWorldToPixels(mouse.x*0.007);
    go.y = box2d.scalarWorldToPixels(mouse.y*0.007);
    //println(go.x+" "+go.y);
    Vec2 position = red;
    Vec2 gravity = new Vec2(0,0);
    gravity.y = box2d.scalarWorldToPixels(0.0500);
    for(int j=0;j<600;j+=1)
    {
      tra.add(position);
      for(Vec2 t: tra)
      {
        strokeWeight(3);
        stroke(0, 255-j*30);
        point(t.x,t.y);
      }
      go.addLocal(gravity);
      position.addLocal(go);
    }
    }
    
    redbird.display();
    
    for(Vec2 p: plist)
    {
      strokeWeight(3);
      stroke(0);
      point(p.x,p.y);
    }
  
  
  
  if(!redcollide) {
  if(i%5==0){
  plist.add(redbird.position);
  }
  }
  
  
  
  floor1.display();
  floor2.display();
  //resortera.display();
 
  
  bar1.display();
  bar2.display();
  bar3.display();
  bar4.display();
  bar5.display();
  bar6.display();
  bar7.display();
  bar8.display();
  
    pig.display();
  
  image(slingshot,20,165); 
  fill(255);
  textSize(20);
  text("Score:", 800, 20); 
  text(points, 900, 20);   
    i+=1;
    
    textSize(30);
    fill(127,127,0);
    text("STAGE 1", 20, 40);
    
  textSize(15);
  fill(255);
  text("Click 'Mouse Left Button' To Go To Next Stage.", 20, 310);
  text("Click 'Mouse Right Button' To Shoot Redbird.", 20, 330);
  
  if(abs(pig.getLinearAcceleration())>2) {
    pig.killBody();
  }
  } 
  
  
  else if(stage == 2){  
  
    if(t==0){
    redbird = new Redbird();
    floor1 = new Floor();
    floor2 = new Floor2();
    //resortera = new Resortera();
    bar1 = new Bar1(new Vec2(-1000,-1000));
    bar2 = new Bar2(new Vec2(-1000,-1000));
    bar3 = new Bar3(new Vec2(-1000,-1000));
    bar4 = new Bar4(new Vec2(570,247));
    bar5 = new Bar5(new Vec2(590,247));
    bar6 = new Bar6(new Vec2(580,197));
    bar7 = new Bar7(new Vec2(580,153));
    bar8 = new Bar8(new Vec2(-1000,-1000));
    pig = new Pig(new Vec2(580,173));
    pig2 = new Pig(new Vec2(580,133));
    }
    
  background(sky);
  
  if(!shot) {
    ArrayList<Vec2> tra = new ArrayList();
    Vec2 mouse = new Vec2(mouseX,mouseY);
    Vec2 red = new Vec2(60,188);
    mouse.subLocal(red);
    Vec2 go = new Vec2(0,0);
    go.x = box2d.scalarWorldToPixels(mouse.x*0.007);
    go.y = box2d.scalarWorldToPixels(mouse.y*0.007);
    //println(go.x+" "+go.y);
    Vec2 position = red;
    Vec2 gravity = new Vec2(0,0);
    gravity.y = box2d.scalarWorldToPixels(0.0500);
    for(int j=0;j<10;j+=1)
    {
      tra.add(position);
      for(Vec2 t: tra)
      {
        strokeWeight(3);
        stroke(0, 255-j*30);
        point(t.x,t.y);
      }
      go.addLocal(gravity);
      position.addLocal(go);
    }
    }
  
  for(Vec2 p: plist)
  {
    strokeWeight(3);
    stroke(0);
    point(p.x,p.y);
  }
  
  
  redbird.display();
  
  if(!redcollide) {
  if(i%5==0){
  plist.add(redbird.position);
  }
  }
  
  floor1.display();
  floor2.display();
  //resortera.display();
 
  
  //bar1.display();
  //bar2.display();
  //bar3.display();
  bar4.display();
  bar5.display();
  bar6.display();
  bar7.display();
  //bar8.display();
  pig.display();
  pig2.display();
  
  
  image(slingshot,20,165); 
  fill(255);
  textSize(20);
  text("Score:", 800, 20); 
  text(points, 900, 20);   
    i+=1;
  textSize(30);
    fill(127,127,0);
    text("STAGE 2", 20, 40);
    
  textSize(15);
  fill(255);
  text("Click 'Mouse Left Button' To End Stage.", 20, 310);
  text("Click 'Mouse Right Button' To Shoot Redbird.", 20, 330);
    if(abs(pig.getLinearAcceleration())>2) {
    pig.killBody();
  }
  if(abs(pig2.getLinearAcceleration())>2) {
    pig2.killBody();
  }
  }
  t+=1;
}

void mouseClicked(){
  if (mouseButton == RIGHT) {
    
   //resortera.move(new Vec2(20,20));
   //redbird.angular(0.5);
    Vec2 mouse = new Vec2(mouseX, mouseY);
    Vec2 reso = new Vec2(60, 188);
    mouse.subLocal(reso);
    mouse.y=-mouse.y;
    redbird.move(mouse.mulLocal(0.07));
    //resortera.killBody();
    redbird.angular(mouse.length()/60);
    shot = true;
  }
  
  if(mouseButton == LEFT){
    if(stage==0){
      if(dist(mouseX,mouseY,469,177)<=75){
        stage=1;
        println("Stage Started");
        points=0;
        i=0;
        t=0;
        plist = new ArrayList<Vec2>();
      }     
    }
    else{
      stage+=1;
      if(stage>level){
        println("Stage Ended");
        exit();
      }
      else {
      println("Stage Changed");
      box2d = new Box2DProcessing(this);
      box2d.createWorld();
      box2d.setGravity(0.0,-5.0);
      box2d.listenForCollisions();
      points=0;
      i=0;
      t=0;
      plist = new ArrayList<Vec2>();
      redcollide = false;
      shot = false;
      }
    }
    
    
  }
  

}

void beginContact(Contact cp) {
  // Get both fixtures
  //println("Collision");
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  // Get both bodies
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();
  // Get our objects that reference these bodies
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
  //print(o1.getClass());
  //print(" : ");
  //println(o2.getClass());
  if (o1.getClass() == Redbird.class) {
    //println("collision Redbird");
     if((o2.getClass() != Floor.class)) {
     //points = points + 1000 ;
     redcollide=true;
     }
  } 
  if (o1.getClass() == Pig.class) {
    //println("collision Pig");
     if((stage==1)&&(o2.getClass() != Bar6.class)) {
     //points = points + 1000 ;
     }
     if((stage==2)&&((o2.getClass() != Bar6.class)&&(o2.getClass() != Bar7.class))) {
     //points = points + 1000 ;
     }
  } 
  else if (o2.getClass() == Redbird.class) {
    if((o1.getClass() != Floor.class)) {
    points = points + 1000 ;
    redcollide=true;
    //println("collision Redbird");
    }
  }
  if (o2.getClass() == Pig.class) {
    //println("collision Pig");
     if((stage==1)&&(o1.getClass() != Bar6.class)) {
     points = points + 1000 ;
     }
     if((stage==2)&&((o1.getClass() != Bar6.class)&&(o1.getClass() != Bar7.class))) {
     points = points + 1000 ;
     }
  } 
}


// Objects stop touching each other
void endContact(Contact cp) {
}