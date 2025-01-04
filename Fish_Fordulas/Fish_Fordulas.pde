int numFish = 500;
Fish[] circles = new Fish[numFish];

float topAxisY = 100;
float bottomAxisY = 900;
PImage[] fishImages;
PImage bg;
PImage waveBg; 

float waveOffsetY = 0;
float waveSpeed = 0.5;
float waveDirection = 1;

void setup() {
  size(1000, 1000);
  fishImages = new PImage[4];
  fishImages[0] = loadImage("Fish01.png");
  fishImages[1] = loadImage("Fish02.png");
  fishImages[2] = loadImage("Fish03.png");
  fishImages[3] = loadImage("Fish04.png");
  bg = loadImage("Hatter01.jpg");
  waveBg = loadImage("Hatter02.png");
  
  imageMode(CENTER);

  for (int i = 0; i < numFish; i++){
    float t = map(i, 0, numFish - 1, 0, 1);
    float centerY = lerp(topAxisY, bottomAxisY, t);
    
    float radiusX = lerp(350, 200, t);
    float radiusY = lerp(20, 50, t);
    
    if (t > 0.5){
      radiusX = lerp(350, 80, t);
      radiusY = lerp(20, 50, t);
    }
    float offsetX = random(-50, 50);
    float offsetY = random(-20, 20);

    PImage randomFishImage = fishImages[int(random(fishImages.length))];
    
    float randomSize = random(20, 60);
    circles[i] = new Fish(width / 2 + offsetX, centerY + offsetY, i, radiusX, radiusY, randomFishImage);
  }
}


void draw() {
  image(bg, width / 2, height / 2, width, height);
  image(waveBg, width / 2, height / 2 + waveOffsetY, width + 200, height + 200);
  
  waveOffsetY += waveSpeed * waveDirection;
  if (waveOffsetY > 20 || waveOffsetY < -20) {
     waveDirection *= -1;
  }

  for (int i = 0; i < numFish; i++) {
    circles[i].update();
    circles[i].display();
  }
}
