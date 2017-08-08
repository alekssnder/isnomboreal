// ISNOMBoreal
// Jefté Montenegro
// http://isnomlabs.com
// repos by nature of the code (org)

// Describe el microverso


World world;

void setup() {
  size(640, 360);
  // El mundo empieza con 20 creaturas
  // y 20 pedazos de comida
  world = new World(20);
  smooth();
}

void draw() {
  background(255);
  world.run();
}

// Podemos añadir más creaturas, sí se desea.
void mousePressed() {
  world.born(mouseX,mouseY); 
}

void mouseDragged() {
  world.born(mouseX,mouseY); 
}
