Player player;  // Instance of the player class

void setup(){
  size(800, 800);  //Set screen size
  
  // Initialize player starting position (bottom-center, in the start area)
  player = new Player(new PVector(width / 2, height - 50));  
}

void draw(){
  background(0);
  player.update();
  player.display();
}
