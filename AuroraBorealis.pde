// ISNOMBoreal
// Jefté Montenegro
// http://isnomlabs.com
// repos by nature of the code (org)

// Describe el microverso


World world;

void setup() {
  size(640, 360);
  // World starts with 20 creatures
  // and 20 pieces of food
  world = new World(20);
  smooth();
}

void draw() {
  background(255);
  world.run();
}

// We can add a creature manually if we so desire
void mousePressed() {
  world.born(mouseX,mouseY); 
}

void mouseDragged() {
  world.born(mouseX,mouseY); 
}