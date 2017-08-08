// ISNOMBoreal
// Jefté Montenegro
// http://isnomlabs.com
// repos by nature of the code (org)

// Descripción del ADN
// Tiene más clases para reproducción

class DNA {

  // Secuencia Genetica
  float[] genes;
  
  // 'dios' (hace ADN aleatorio)
  DNA() {
    // ADN fluctua entre 0 y 1 (!!)
    genes = new float[1];
    for (int i = 0; i < genes.length; i++) {
      genes[i] = random(0,1);
    }
  }
  
  DNA(float[] newgenes) {
    genes = newgenes;
  }
  
  DNA copy() {
    float[] newgenes = new float[genes.length];
    //arraycopy(genes,newgenes);
    // JS mode not supporting arraycopy
    for (int i = 0; i < newgenes.length; i++) {
      newgenes[i] = genes[i];
    }
    
    return new DNA(newgenes);
  }
  
  // Probabilidad de mutacion
  void mutate(float m) {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < m) {
         genes[i] = random(0,1);
      }
    }
  }
}
