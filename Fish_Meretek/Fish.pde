class Fish {
  float centerX, centerY;  
  float radiusX, radiusY;  
  float angle;
  float speed;
  boolean flipped = false; 
  PImage fishImage;
  float size;             

  Fish(float x, float y, float radiusX, float radiusY, PImage fishImage, float size) {
    this.centerX = x;
    this.centerY = y;
    this.radiusX = radiusX;
    this.radiusY = radiusY;
    this.speed = random(0.5, 2.0);  
    this.angle = random(TWO_PI);   
    this.fishImage = fishImage;
    this.size = size;              
  }

  void update() {
    angle += radians(speed);  
    float x = centerX + radiusX * cos(angle);  

   
    if (x <= centerX - radiusX || x >= centerX + radiusX) {
      flipped = !flipped;  
    }
  }

  void display() {
    float x = centerX + radiusX * cos(angle); 
    float y = centerY + radiusY * sin(angle);  

    pushMatrix();
    translate(x, y);  // Move to current position
    if (flipped) {
      scale(-1, 1);  // Flip horizontally if needed
    }
    imageMode(CENTER);  // Draw image centered
    image(fishImage, 0, 0, size, size / 2);  // Fish size scaled randomly
    popMatrix();
  }
}
