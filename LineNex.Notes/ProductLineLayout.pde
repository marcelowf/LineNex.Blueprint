Grid grid;
Layout layout;
CameraController camCtrl;
Pyramid DistributionPoint_Pyramid;

void setup() {
  size(1200, 1200, P3D);
  grid = new Grid(50, color(50), color(0));
  //grid    = new Grid(50, color(255), color(0, 0, 128)); blue print
  layout  = new Layout();
  camCtrl = new CameraController();
  DistributionPoint_Pyramid = new Pyramid(50, color(0, 255, 0), color(0, 255, 0));
}

void draw() {
  background(0);
  camCtrl.updateCamera();
  pushMatrix();
    translate(width/2, height/2, 0);
    camCtrl.applyTransforms();
    pushMatrix();
      translate(-width/2, -height/2, 0);
      grid.display();
    popMatrix();
    pushMatrix();
      translate(325, 325, 0);
      rotateX(-HALF_PI);
      DistributionPoint_Pyramid.display();
    popMatrix();
    pushMatrix();
      translate(0, -DistributionPoint_Pyramid.h - 560, 85);
      rotateX(PI / -3);
      fill(255);
      textAlign(CENTER);
      textSize(62);
      text("LineNex - SmartOps", 0, 0);
    popMatrix();
    pushMatrix();
      translate(0, -DistributionPoint_Pyramid.h - 540, 40);
      rotateX(PI / -3);
      fill(255);
      textAlign(CENTER);
      textSize(40);
      text("Volvo - Planta Número 11", 0, 0);
    popMatrix();
  popMatrix();
  layout.display();
}

void keyPressed()   { camCtrl.keyPressed(); }
void mouseDragged() { camCtrl.mouseDragged(); }
void mouseWheel(MouseEvent e) { camCtrl.mouseWheel(e); }

class CameraController {
  float angX = 70, angY = -30;
  float camDist = 1800;
  
  void updateCamera() {
    camera(width/2, height/2, camDist,
           width/2, height/2, 0,
           0, 1, 0);
  }
  
  void applyTransforms() {
    rotateY(radians(angY));
    rotateX(radians(angX));
  }
  
  void keyPressed() {
    if (key == CODED) {
      if      (keyCode == UP)    angX -= 1;
      else if (keyCode == DOWN)  angX += 1;
      else if (keyCode == LEFT)  angY -= 1;
      else if (keyCode == RIGHT) angY += 1;
    }
  }
  
  void mouseDragged() {
    angY += (mouseX - pmouseX) * 0.5;
    angX += (mouseY - pmouseY) * 0.5;
  }
  
  void mouseWheel(MouseEvent e) {
    camDist += e.getCount() * 20;
    camDist = max(100, camDist);
  }
}

class Grid {
  int step, strokeCol, bgCol;
  Grid(int step, int strokeCol, int bgCol) {
    this.step = step; this.strokeCol = strokeCol; this.bgCol = bgCol;
  }
  void display() {
    pushStyle();
    stroke(strokeCol);
    background(bgCol);
    for (int i = 0; i <= width; i += step) {
      line(i, 0, i, height);
      line(0, i, width, i);
    }
    pushMatrix();
      fill(255);
      textSize(12);
      translate(0, height, 0);
      box(5);
      text("origem (0,0)", 10, -10);
      translate(width, 0, 0);
      box(5);
      text("X max (" + width + ")", 10, -10);
      translate(-width, -height, 0);
      box(5);
      text("Y max (" + height + ")", 10, -10);
    popMatrix();
    popStyle();
  }
}

class Layout {
  ArrayList<Face> faces;
  Layout() {
    faces = new ArrayList<Face>();
  }
  void display() {
    for (Face f : faces) f.display();
  }
}

class Face {
  PVector[] v;
  int col, mode;
  Face(PVector[] v, int col, int mode) {
    this.v = v; this.col = col; this.mode = mode;
  }
  void display() {
    pushStyle();
    fill(col);
    noStroke();
    beginShape(mode);
    for (PVector p : v) vertex(p.x, p.y, p.z);
    endShape(CLOSE);
    popStyle();
  }
}

class Pyramid {
  float b, h;
  PVector[] baseVerts;
  PVector apex;
  int edgeCol, vertCol;
  Pyramid(float b, int edgeCol, int vertCol) {
    this.b = b; this.h = b / sqrt(2);
    this.edgeCol = edgeCol; this.vertCol = vertCol;
    float half = b / 2;
    baseVerts = new PVector[]{
      new PVector(-half, 0, -half),
      new PVector( half, 0, -half),
      new PVector( half, 0,  half),
      new PVector(-half, 0,  half)
    };
    apex = new PVector(0, -h, 0);
  }
  void display() {
    stroke(edgeCol);
    noFill();
    for (int i = 0; i < 4; i++) {
      drawDashedLine(baseVerts[i], baseVerts[(i+1)%4]);
      drawDashedLine(baseVerts[i], apex);
    }
    drawDashedLine(baseVerts[3], apex);
    stroke(vertCol);
    strokeWeight(5);
    for (PVector p : baseVerts) point(p.x, p.y, p.z);
    point(apex.x, apex.y, apex.z);
    strokeWeight(1);
  }
  void drawDashedLine(PVector p1, PVector p2) {
    float dash = 3, gap = 1;
    PVector dir = PVector.sub(p2, p1);
    float len = dir.mag();
    dir.normalize();
    boolean draw = true;
    float drawn = 0;
    while (drawn < len) {
      float seg = min(dash, len - drawn);
      if (draw) {
        PVector start = PVector.add(p1, PVector.mult(dir, drawn));
        PVector end   = PVector.add(p1, PVector.mult(dir, drawn + seg));
        line(start.x, start.y, start.z, end.x, end.y, end.z);
      }
      drawn += seg;
      draw   = !draw;
      drawn += min(gap, len - drawn);
    }
  }
}
