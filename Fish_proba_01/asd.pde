class Circle {
  float centerX, centerY;  // A kör középpontja
  float radiusX, radiusY;  // Ellipszis sugara
  float angle;             // A kör szöge
  float speed;             // A kör sebessége
  boolean flipped = false; // Tükrözés állapota
  
  Circle(float x, float y, int index, float radiusX, float radiusY) {
    this.centerX = x;
    this.centerY = y;
    this.radiusX = radiusX;  // Tengely X sugara
    this.radiusY = radiusY;  // Tengely Y sugara
    this.speed = round(random(5, 20)) / 5;  // Kör létrehozás
    this.angle = round(random(180));      // Véletlenszerű kezdő szög
    
    
  }
  
  // A kör pozíciójának frissítése
  void update() {
    angle += speed;  // A szög növelése, hogy a kör mozgásban maradjon
    float x = centerX + radiusX * cos(radians(angle));  // Az aktuális X pozíció
    //println(angle);
    if (angle> 360) angle = angle -360;
    
    // Ha eléri a szélső pontokat, tükrözzük
  // if (abs(x - (centerX - radiusX)) < 0.5 || abs(x - (centerX + radiusX)) < 0.5) {
    if (angle == 180 || angle == 360){
     //speed = -speed;        // Megfordítjuk a sebesség irányát
      flipped = !flipped;    // Tükrözési állapot váltása
    }
  }
  
  // A kör kirajzolása
  void display() {
    
    float x = centerX + radiusX * cos(radians(angle));  // Az X koordináta
    float y = centerY + radiusY * sin(radians(angle)); 
    //noFill();
    //stroke(255);
    //ellipse(centerX, centerY, radiusX * 2, radiusY * 2);// Az Y koordináta
    
    // Ellenőrzés, hogy a kör ne menjen ki a képből
   // x = constrain(x, 30, width - 30);
   // y = constrain(y, 30, height - 30);
    
   
    pushMatrix();
    translate(x, y); 
    if (flipped) {
      scale(-1, 1);          // Tükrözés balra
    }
    imageMode(CENTER);       // Kép középpontja igazítva
    image(photo, 0, 0, 60, 60); // A kép megrajzolása (méret: 30x30 pixel)
    popMatrix();

  }
}
