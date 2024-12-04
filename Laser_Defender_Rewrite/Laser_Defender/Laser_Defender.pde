Player player;  // Instance of the player class
GameArea startArea;  // Start area at the bottom
GameArea endArea;  // End area at the top
ArrayList<LaserMachine> laserMachines;  //List to manage laser machine

void setup(){
  size(800, 800);  //Set screen size
  
  //Initialize player starting position (bottom-center, in the start area)
  player = new Player(new PVector(width / 2, height - 50));  
  
  // Define start and end areas
  startArea = new GameArea(0, height - 100, width, 100, color(50, 150, 50));  // Green at the bottom
  endArea = new GameArea(0, 0, width, 100, color(150, 50, 50));  // Red at the top  
  
  //Initialize laser machine
  laserMachines = new ArrayList<LaserMachine>();
  
  //Add laser machines
  for (int y = 100; y<= 700; y+=50) {
    laserMachines.add(new LaserMachine(15, y));
  }
}

void draw(){
  background(0);
  
  // Draw start and end areas
  startArea.display();
  endArea.display();
  
  player.update();
  player.display();
  
  //Display laser machine
  for (int i = 0; i < laserMachines.size(); i++){
    laserMachines.get(i).display();
  }
}
