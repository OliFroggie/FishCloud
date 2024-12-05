int numCircles = 300;  // A körök száma
Circle[] circles = new Circle[numCircles];  // Körök tömbje

// Tengelyek Y koordinátái
float topAxisY = 100;     // Felső tengely
float bottomAxisY = 900;  // Alsó tengely
PImage photo;

void setup() {
  size(1000, 1000);  // A képernyő mérete
  
  photo = loadImage("Anchovy_(Fish)_NH_Icon.png");
  
  // Körök inicializálása a felső és az alsó tengely között
  for (int i = 0; i < numCircles; i++) {
    float t = map(i, 0, numCircles - 1, 0, 1);  // Interpolációs arány (0-tól 1-ig)
    float centerY = lerp(topAxisY, bottomAxisY, t);  // Interpolált Y koordináta
    
    // Felső tengely (nagyobb sugarak)
    float radiusX = lerp(350, 200, t);  // X irányú sugár csökkenése
    float radiusY = lerp(20, 50, t);   // Y irányú sugár csökkenése
    
    // Alsó tengely (kisebb sugarak)
    if (t > 0.5) {
      radiusX = lerp(350, 80, t);  // X irányú sugár csökkenése
      radiusY = lerp(20, 50, t);  // Y irányú sugár csökkenése
    }
    
    // Véletlenszerű kimozdulás beállítása
    float offsetX = random(-100, 50);  // Véletlenszerű X irányú eltolás
    float offsetY = random(-20, 50);  // Véletlenszerű Y irányú eltolás
    
    circles[i] = new Circle(width / 2 + offsetX, centerY + offsetY, i, radiusX, radiusY);  // Kör létrehozása
  }
}

void draw() {
  background(0);  // Háttér törlése
  
  // Körök mozgása és kirajzolása
  for (int i = 0; i < numCircles; i++) {
    circles[i].update();  // A kör pozíciójának frissítése
    circles[i].display(); // A kör kirajzolása
  }
}
