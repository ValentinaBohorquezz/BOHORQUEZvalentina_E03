// Angie Valentina Bohorquez Rodriguez
// 202213422

// Quise representar un ecosistema de círculos que están en constante movimiento, como si cada uno tuviera su propia energía y personalidad. Decidí usar solo 
// una forma (círculo) para mostrar cómo, a pesar de ser iguales en esencia, todos se comportan diferente según su posición y entorno.
 
// lo que se hara es que 100 ellipses se muevan en el cuadrado, que revoten en los lados, y que vayan cambindo de tamano y de color en degrade
// ahora primero se gurdara la posicion, la velocidad y la direccion de cada ellipse
int numCircles = 100;
float[] xPositions, yPositions;
float[] xSpeeds, ySpeeds;
int[] xDirections, yDirections;

// se define el tamano del background, quitarle el borde a los circulos y la tonalidad, el brillo y la saturacion 
void setup() {
  size(500, 500);
  noStroke();
  colorMode(HSB, 360, 100, 100);

//se inicializa los arrays con el tamano que quiero
  xPositions = new float[numCircles];
  yPositions = new float[numCircles];
  xSpeeds = new float[numCircles];
  ySpeeds = new float[numCircles];
  xDirections = new int[numCircles];
  yDirections = new int[numCircles];

// se aigna los valores aleatorios a cada ellipse 
  for (int i = 0; i < numCircles; i++) {
    xPositions[i] = random(width);
    yPositions[i] = random(height);
    xSpeeds[i] = random(1, 3);
    ySpeeds[i] = random(1, 3);
    xDirections[i] = random(1) > 0.5 ? 1 : -1;
    yDirections[i] = random(1) > 0.5 ? 1 : -1;
  }
}

// se define el color del fondo 
void draw() {
  background(150);

  for (int i = 0; i < numCircles; i++) {
// se define el movimiento
    xPositions[i] += xSpeeds[i] * xDirections[i];
    yPositions[i] += ySpeeds[i] * yDirections[i];

// se crea para que rebote en los bordes
    if (xPositions[i] >= width || xPositions[i] <= 0) {
      xDirections[i] *= -1;
    }
    if (yPositions[i] >= height || yPositions[i] <= 0) {
      yDirections[i] *= -1;
    }

// se crea el tamano con map, es decir, cambia el tamano del circulo segun su posición Y, entre mas abajo, mas grande)
    float size = map(yPositions[i], 0, height, 10, 60);

// ahora se crea el color con map, es decir, se cambia el color del circulo segun su posición X, de izquierda a derecha cambia el tono
    float hue = map(xPositions[i], 0, width, 0, 360);
    fill(hue, 80, 100);

// y ahora se dibujqa el círculo
    ellipse(xPositions[i], yPositions[i], size, size);
  }
}
