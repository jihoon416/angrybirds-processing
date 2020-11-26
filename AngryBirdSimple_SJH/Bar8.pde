class Bar8 { 
  Body body;
  float r = 16;   // Size
  PImage fort5;
  Vec2 vel;

  Bar8(Vec2 p) {
    makeBody(p,0,new Vec2(0, 0),0);
    body.setUserData(this);
  } 
  
  void makeBody(Vec2 position, float angle, Vec2 vel,float omega) {
    // Define a polygon 
    PolygonShape ps = new PolygonShape();
    float w = box2d.scalarPixelsToWorld(10);
    float h = box2d.scalarPixelsToWorld(20);
     
    ps.setAsBox(w, h);
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(position));
   
    // next line would be: |> for angle=0
    bd.angle = angle; 
    // If we draw ship pointing UP at the beggining: ^
    // There is an angular difference of PI/2 (see below)
    
    body = box2d.createBody(bd);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 8;
    fd.friction = 3;

    body.createFixture(fd);
    
    body.setLinearVelocity(vel);
    body.setAngularVelocity(omega);
  }
  
  void killBody() {
    box2d.destroyBody(body);
  }

  // Draw the ship
  void display() { 
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();
    
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    stroke(0);
    strokeWeight(0.5);
    fill(222,142,47);
    /*beginShape();
    for (int i = 0; i < ps.getVertexCount(); i++) {
      Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(v.x, v.y);
    }
    endShape(CLOSE);*/
    fort5 = loadImage("fort5.png");
    image(fort5, -10, -20, 20, 40);
    popMatrix();
  }
}