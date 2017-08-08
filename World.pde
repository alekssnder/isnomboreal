// ISNOMBoreal
// Jefté Montenegro
// http://isnomlabs.com
// repos by nature of the code (org)

// El mundo en que vivimos
// Tiene criaturas y comida

class World {

  ArrayList<Bloop> bloops;    // Un arraylist para todas las creaturas
  Food food;

  // "dios"
  World(int num) {
    // Empezara con un pequeño cumulo de comida y bloops
    food = new Food(num);
    bloops = new ArrayList<Bloop>();              // Inicializa the arraylist
    for (int i = 0; i < num; i++) {
      PVector l = new PVector(random(width),random(height));
      DNA dna = new DNA();
      bloops.add(new Bloop(l,dna));
    }
  }

  // Crea una nueva creatura
  void born(float x, float y) {
    PVector l = new PVector(x,y);
    DNA dna = new DNA();
    bloops.add(new Bloop(l,dna));
  }

  // Inicia el mundo
  void run() {
    // Le da comida
    food.run();
    
    // Cycle through the ArrayList backwards b/c we are deleting
    for (int i = bloops.size()-1; i >= 0; i--) {
      // Todos los bloops corren y comen
      Bloop b = bloops.get(i);
      b.run();
      b.eat(food);
      //Si está muerto, mátalo y haz comida.
      if (b.dead()) {
        bloops.remove(i);
        food.add(b.location);
      }
      // ¿tal vez este bloop quisiera hacer un bebé?
      Bloop child = b.reproduce();
      if (child != null) bloops.add(child);
    }
  }
}