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
Resortera resortera;
Bar1 bar1;
Bar2 bar2;
Bar3 bar3;
Bar4 bar4;
Bar5 bar5;
Bar6 bar6;
Bar7 bar7;
Bar8 bar8;
Pig pig;
PImage sky;
PImage slingshot;
boolean shot = false;
PImage start;
int stage = 1;
int points = 0;
PImage sceen1;

void setup() {
  size(1000, 335);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0.0,-5.0);
  box2d.listenForCollisions();
  
  redbird = new Redbird();
  floor1 = new Floor();
  floor2 = new Floor2();
  resortera = new Resortera();
  bar1 = new Bar1();
  bar2 = new Bar2();
  bar3 = new Bar3();
  bar4 = new Bar4();
  bar5 = new Bar5();
  bar6 = new Bar6();
  bar7 = new Bar7();
  bar8 = new Bar8();
  pig = new Pig();
  sky = loadImage("sky.png");
  slingshot = loadImage("slingshot.png");
  start = loadImage("gshslogo.png");
  sceen1 = loadImage("gshslogo.png");
 
}

void draw() {
  
  box2d.step();
  if(stage == 0){
    image(start,width/2,height/4);
  }else if(stage == 1){
    
  background(sky);
  redbird.display();
  
  
  floor1.display();
  floor2.display();
  resortera.display();
 
  
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
    
  } 
  
}

void mousePressed(){
  if (mouseButton == RIGHT) {
    resortera.move(new Vec2(20,20));
    redbird.angular(0.5);
  }
  
  if(mouseButton == LEFT){
    stage=1;
    println("Stage Changed");
  }
  

}

void beginContact(Contact cp) {
  // Get both fixtures
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
     points = points + 1 ;
    
    
  } 
  else if (o2.getClass() == Redbird.class) {
    //points = points + 1 ;
    println("collision");
  }
}


// Objects stop touching each other
void endContact(Contact cp) {
}