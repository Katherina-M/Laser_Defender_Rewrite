Player player;  // Instance of the player class
ArrayList<LaserMachine> laserMachines;  //List to manage laser machine

void setup(){
  size(800, 800);  //Set screen size
  
  //Initialize player starting position (bottom-center, in the start area)
  player = new Player(new PVector(width / 2, height - 50));  
  
  //Initialize laser machine
  laserMachines = new ArrayList<LaserMachine>();
  
  //Add laser machines
  for (int y = 100; y<= 700; y+=50) {
    laserMachines.add(new LaserMachine(15, y));
  }
}

void draw(){
  background(0);
  player.update();
  player.display();
  
  //Display laser machine
  for (int i = 0; i < laserMachines.size(); i++){
    laserMachines.get(i).display();
  }
}
