class Pig { 
  Body body;
  float r = 5;   // Size
  PImage pig;
  boolean dead = false;
  float vel[] = new float[2];

  Pig(Vec2 p) {
    makeBody(p,0,new Vec2(0, 0),0);
    body.setUserData(this);
  } 
  
  void makeBody(Vec2 position, float angle, Vec2 vel,float omega) {
    // Define a polygon 
    //PolygonShape ps = new PolygonShape();
    CircleShape cs = new CircleShape();
    //float w = box2d.scalarPixelsToWorld(10);
    //float h = box2d.scalarPixelsToWorld(30);
    cs.m_radius=box2d.scalarPixelsToWorld(14);
    //ps.setAsBox(w, h);
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(position));
    
   
    // next line would be: |> for angle=0
    bd.angle = angle; 
    // If we draw ship pointing UP at the beggining: ^
    // There is an angular difference of PI/2 (see below)
    
    body = box2d.createBody(bd);
    
    FixtureDef fd = new FixtureDef();
    //fd.shape = ps;
    fd.shape = cs;
    fd.density = 4;
    fd.friction = 5;

    body.createFixture(fd);
    body.setLinearVelocity(vel);
    body.setAngularVelocity(omega);
  }
  
  void angular(float angulo){
      body.setAngularVelocity(angulo);
    }
    
  float getLinearAcceleration()
  {
    float a;
    a=vel[1]-vel[0];
    return a;
  }
  
  void killBody() {
    box2d.destroyBody(body);
    dead = true;
  }
  
  // Draw the ship
  void display() { 
    Vec2 pos = box2d.getBodyPixelCoord(body);
    vel[0]=vel[1];
    vel[1]=(body.getLinearVelocity().length());
    float a = body.getAngle();
    Fixture f = body.getFixtureList();
    //PolygonShape ps = (PolygonShape) f.getShape();
    
    if(!dead) {
    pushMatrix();
    rectMode(CENTER);
    translate(pos.x, pos.y);
    rotate(-a);
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
    ellipse(0,0,28,28);
    pig = loadImage("pig.png");
    image(pig,-18,-20);
    popMatrix();
    }
  }
}