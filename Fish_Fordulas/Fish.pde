class Fish {
  float centerX, centerY;
  float radiusX, radiusY;
  float angle;
  float speed;
  boolean flipped = false;
  PImage fishImage;
  float size; 

  Fish(float x, float y, int index, float radiusX, float radiusY, PImage fishImage) {
    this.centerX = x;
    this.centerY = y;
    this.radiusX = radiusX;
    this.radiusY = radiusY;
    this.speed = round(random(0.5, 2.0)); // Reset speed to original value
    this.angle = round(random(180));
    this.fishImage = fishImage;
    this.size = size;
  }

  void update() {
    angle += speed;
    float x = centerX + radiusX * cos(radians(angle));
    if (angle > 360) angle = angle - 360;
    if (angle == 180 || angle == 360) {
      flipped = !flipped;
    }
  }

  void display() {
    float x = centerX + radiusX * cos(radians(angle));
    float y = centerY + radiusY * sin(radians(angle));

    pushMatrix();
    translate(x, y);
    if (flipped) {
      scale(-1, 1);
    }
    imageMode(CENTER);
    image(fishImage, 0, 0, 40,20); 
    popMatrix();
  }
}
