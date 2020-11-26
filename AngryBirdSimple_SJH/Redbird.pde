class Redbird { 
  Body body;
  float r = 16;   // Size
  PImage redbird;
  Vec2 position;
  Vec2 vel;
  
  Redbird() {
    makeBody(new Vec2(60,188),0,new Vec2(0, 0),0);
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
    //PolygonShape ps = new PolygonShape();
    CircleShape cs = new CircleShape();
    //float birdW = box2d.scalarPixelsToWorld(18);
    //float birdH = box2d.scalarPixelsToWorld(18);
     
    cs.m_radius = box2d.scalarPixelsToWorld(13);
    //ps.setAsBox(birdW, birdH);
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(position));
    
   
    
    bd.angle = angle; 
    
    body = box2d.createBody(bd);
    
    FixtureDef fd = new FixtureDef();
    //fd.shape = ps;
    fd.shape = cs;
    fd.density = 10;
    fd.friction = 5;

    body.createFixture(fd);
    body.setLinearVelocity(vel);
    body.setAngularVelocity(omega);
  }
  
  
  void move(Vec2 vel){
      body.setLinearVelocity(vel);
  }
  
  void angular(float angulo){
      body.setAngularVelocity(angulo);
    }
  

  // Draw the ship
  void display() { 
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    Fixture f = body.getFixtureList();
    //PolygonShape ps = (PolygonShape) f.getShape();
 
    pushMatrix();
    position = pos;
    rectMode(CENTER);
    translate(pos.x, pos.y);
    rotate(a);
    noStroke();
    strokeWeight(2);
    noFill();
    //fill(0);
    /*beginShape();
    for (int i = 0; i < ps.getVertexCount(); i++) {
      Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
    
      vertex(v.x, v.y);
    }
    endShape(CLOSE);*/
    ellipse(0,0,26,26);
    redbird = loadImage("redbird.png");
    image(redbird,-18,-19);
    popMatrix();
  }
}