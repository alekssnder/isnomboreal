// ISNOMBoreal
// Jefté Montenegro
// http://isnomlabs.com
// repos by nature of the code (org)

// Aurora Borealis

// La comida dentro del mundo

class Food {
  ArrayList<PVector> food;
 
  Food(int num) {
    // Empieza con algo de comida
    food = new ArrayList();
    for (int i = 0; i < num; i++) {
       food.add(new PVector(random(width),random(height))); 
    }
  } 
  
  // Añadir comida en determinada locación
  void add(PVector l) {
     food.add(l.get()); 
  }
  
  // Muestra la comida
  void run() {
    for (PVector f : food) {
       rectMode(CENTER);
       stroke(0);
       fill(175);
       rect(f.x,f.y,8,8);
    } 
    
    // Pequeña probabilidad de encontrar comida
    if (random(1) < 0.001) {
       food.add(new PVector(random(width),random(height))); 
    }
  }
  
  // Regresa a la lista de comida
  ArrayList getFood() {
    return food; 
  }
}
