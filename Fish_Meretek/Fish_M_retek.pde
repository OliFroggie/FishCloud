int numFish = 500;  // Number of fishes
Fish[] circles = new Fish[numFish];

float topAxisY = 100;    // Top axis
float bottomAxisY = 900; // Bottom axis
PImage[] fishImages;     // Array of fish images
PImage bg;               // First background image
PImage waveBg;           // Second wave-like background image

float waveOffsetY = 0;   // Vertical offset for wave background
float waveSpeed = 0.5;   // Speed of wave movement
float waveDirection = 1; // Direction of wave movement

void setup() {
  size(1000, 1000);  // Window size
  fishImages = new PImage[4];  // Load multiple fish images
  fishImages[0] = loadImage("Fish01.png");
  fishImages[1] = loadImage("Fish02.png");
  fishImages[2] = loadImage("Fish03.png");
  fishImages[3] = loadImage("Fish04.png");
  bg = loadImage("Hatter01.jpg");      // Load main background
  waveBg = loadImage("Hatter02.png"); 
  
  imageMode(CENTER);

  for (int i = 0; i < numFish; i++) {
    float t = map(i, 0, numFish - 1, 0, 1);  // Map fish position along the vertical axis
    float centerY = lerp(topAxisY, bottomAxisY, t);  // Calculate Y-axis position

    float radiusX = lerp(350, 200, t);  // Horizontal radius decreases as t increases
    float radiusY = lerp(20, 50, t);   // Vertical radius increases as t increases
    
    if (t > 0.5) {
      radiusX = lerp(350, 80, t);  // Adjust for bottom half of the screen
      radiusY = lerp(20, 50, t);
    }

    float offsetX = random(-50, 50);  // Small random horizontal offset
    float offsetY = random(-20, 20); // Small random vertical offset

    PImage randomFishImage = fishImages[int(random(fishImages.length))];  // Random fish image

    float randomSize = random(20, 60);  // Random fish size
    circles[i] = new Fish(width / 2 + offsetX, centerY + offsetY, radiusX, radiusY, randomFishImage, randomSize);
  }
}

void draw() {
  // Draw main background
  
  image(bg, width / 2, height / 2, width, height);
  image(waveBg, width / 2, height / 2 + waveOffsetY, width + 200, height + 200);

  // Update wave background position
  waveOffsetY += waveSpeed * waveDirection;
  if (waveOffsetY > 20 || waveOffsetY < -20) {
    waveDirection *= -1;  // Reverse direction when limit is reached
  }
  // Draw fishes
  for (int i = 0; i < numFish; i++) {
    circles[i].update();
    circles[i].display();
  }
}
