// ISNOMBoreal
// Jefté Montenegro
// http://isnomlabs.com
// repos by nature of the code (org)

// Aurora Borealis

// Describe los Bloop

class Bloop {
  PVector location; // Locacion
  DNA dna;          // ADN
  float health;     // Contador de vida
  float xoff;       // Para perlin noise
  float yoff;
  // ADN determina tamaño y maxima velocidad
  float r;
  float maxspeed;

  // Crear una particula
  Bloop(PVector l, DNA dna_) {
    location = l.get();
    health = 200;
    xoff = random(1000);
    yoff = random(1000);
    dna = dna_;
    // Gen. 0 detarmina 'maxspeed' y r
    // Lo grande que es y lo rapido también
    maxspeed = map(dna.genes[0], 0, 1, 15, 0);
    r = map(dna.genes[0], 0, 1, 0, 50);
  }

  void run() {
    update();
    borders();
    display();
  }

  //Una particula puede encontrar comida y alimentarse
  void eat(Food f) {
    ArrayList<PVector> food = f.getFood();
    // ¿estamos tocando algún objeto alimenticio?
    for (int i = food.size()-1; i >= 0; i--) {
      PVector foodLocation = food.get(i);
      float d = PVector.dist(location, foodLocation);
      // Sí lo estamos, el jugo aumenta nuestra fuerza!!
      if (d < r/2) {
        health += 100; 
        food.remove(i);
      }
    }
  }

  //En cualquier momento hay una pequeña probabilidad de que un bloop se reproduzca
  Bloop reproduce() {
    // Reproduccion asexual
    if (random(1) < 0.0005) {
//ADN hijo es copia exacta del padre soltero
      DNA childDNA = dna.copy();
      // El ADN hijo puede mutar
      childDNA.mutate(0.01);
      return new Bloop(location, childDNA);
    } 
    else {
      return null;
    }
  }

  // Método para actualizar la ubicación
  void update() {
    // Movimientos basados en perlin noise
    float vx = map(noise(xoff),0,1,-maxspeed,maxspeed);
    float vy = map(noise(yoff),0,1,-maxspeed,maxspeed);
    PVector velocity = new PVector(vx,vy);
    xoff += 0.01;
    yoff += 0.01;

    location.add(velocity);
    // La muerte siempre se avecina
    health -= 0.2;
  }

  // Wraparound
  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }

  // Metodo a visualizar
  void display() {
    ellipseMode(CENTER);
    stroke(0,health);
    fill(0, health);
    ellipse(location.x, location.y, r, r);
  }

  // Death
  boolean dead() {
    if (health < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}
