class Redbird { 
  Body body;
  float r = 16;   // Size
  PImage redbird;
  
  Redbird() {
    makeBody(new Vec2(60,190),0,new Vec2(0, 0),0);
    body.setUserData(this);
  } 
  
   boolean contains(float x, float y) {
    Vec2 worldPoint = box2d.coordPixelsToWorld(x, y);
    Fixture f = body.getFixtureList();
    boolean inside = f.testPoint(worldPoint);
    return inside;
  }
  
  void makeBody(Vec2 position, float angle, Vec2 vel,float omega) {
    // Define a polygon 
    PolygonShape ps = new PolygonShape();
    float birdW = box2d.scalarPixelsToWorld(20);
    float birdH = box2d.scalarPixelsToWorld(30);
     
    ps.setAsBox(birdW, birdH);
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(position));
    
   
    
    bd.angle = angle; 
    
    body = box2d.createBody(bd);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 2;
    fd.friction = 2;

    body.createFixture(fd);
    body.setLinearVelocity(vel);
    body.setAngularVelocity(omega);
  }
  
  void angular(float angulo){
      body.setAngularVelocity(angulo);
    }
  

  // Draw the ship
  void display() { 
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();
 
    pushMatrix();
    redbird = loadImage("redbird.png");
    image(redbird,pos.x,pos.y);
    popMatrix();
  }
}