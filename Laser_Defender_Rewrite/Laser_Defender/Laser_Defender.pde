Player player;  // Instance of the player class
GameArea startArea;  // Start area at the bottom
GameArea endArea;  // End area at the top
ArrayList<LaserMachine> laserMachines;  //List to manage laser machine
ArrayList<LaserLine> laserLines;  // List to manage active laser lines

void setup(){
  size(800, 800);  //Set screen size
  
  //Initialize player starting position (bottom-center, in the start area)
  player = new Player(new PVector(width / 2, height - 50));  
  
  // Define start and end areas
  startArea = new GameArea(0, height - 100, width, 100, color(50, 150, 50));  // Green at the bottom
  endArea = new GameArea(0, 0, width, 100, color(150, 50, 50));  // Red at the top  
  
  //Initialize laser machine && laser lines
  laserMachines = new ArrayList<LaserMachine>();
  laserLines = new ArrayList<LaserLine>();
  
  //Add laser machines
  for (int y = 100; y<= 700; y+=50) {
    laserMachines.add(new LaserMachine(15, y));
  }
  //Laser line with laser machine
  for (int i = 0; i < laserMachines.size(); i++) {
    LaserMachine machine = laserMachines.get(i);
    laserLines.add(new LaserLine(machine.x, machine.y, color(255, 0, 0)));
   }
  
}

void draw(){
  background(0);
  
  // Draw start and end areas
  startArea.display();
  endArea.display();
  
  player.update();
  player.display();
  

  
  //Display laser lines
   for (int i = 0; i < laserLines.size(); i++) {
      LaserLine laser = laserLines.get(i);
      laser.update();
      laser.display();
    }
    
   // Activate a random laser every 3 seconds
    if (frameCount % 10 == 0) { // Every 2 seconds
      int randomIndex = int(random(laserLines.size()));
      laserLines.get(randomIndex).activate(120); // Activate laser for 2 seconds
    }

  //Display laser machine
  for (int i = 0; i < laserMachines.size(); i++){
    laserMachines.get(i).display();
  }
  
}
