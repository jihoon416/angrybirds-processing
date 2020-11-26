class Resortera { 
  Body body;
  int r = 16;
  Vec2 vel = new Vec2(10,0);
  boolean thrusting = true;
  Resortera() {
    makeBody(new Vec2(10,190));
    body.setUserData(this);
  } 
  
  void makeBody(Vec2 position) {
    Vec2[] vertices = new Vec2[4];
    vertices[0] = box2d.vectorPixelsToWorld(new Vec2(r,0));
    vertices[1] = box2d.vectorPixelsToWorld(new Vec2(r,r/2));
    vertices[2] = box2d.vectorPixelsToWorld(new Vec2(-r,r/2));
    vertices[3] = box2d.vectorPixelsToWorld(new Vec2(-r,0));

    // Define a polygon 
    PolygonShape ps = new PolygonShape();
    ps.set(vertices, vertices.length);

    BodyDef bd = new BodyDef();
    bd.type = BodyType.KINEMATIC;
    bd.position.set(box2d.coordPixelsToWorld(position));
   
    // next line would be: |> for angle=0
    //bd.angle = angle; 
    // If we draw ship pointing UP at the beggining: ^
    // There is an angular difference of PI/2 (see below)
    
    body = box2d.createBody(bd);
    
    body.createFixture(ps, 1.0);
    
  }
  
  void move(Vec2 vel){
      body.setLinearVelocity(vel);
    }

  void display() { 
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();
    
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    noStroke();
    strokeWeight(2);
    noFill();
    beginShape();
    for (int i = 0; i < ps.getVertexCount(); i++) {
      Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(v.x, v.y);
      
    }
    endShape(CLOSE);
    popMatrix();
  }


}