String gameState = "playing";  //Check the game state (playing or gameover)
Player player;  //Instance of the player class
GameArea startArea;  //Start area at the bottom
GameArea endArea;  //End area at the top
Timer gameTimer;  //Timer for the game
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
   
  // Initialize the game timer (15 seconds)
  gameTimer = new Timer(15);
  
}

void draw(){
  background(0);
  
  // Draw start and end areas
  startArea.display();
  endArea.display();
  
  //Check player state
  if (gameState.equals("playing")) {
    //update and display the player
    player.update();
    player.display();
    
    //Check if the player hit end area
    if (player.pos.y <= endArea.h) {
      gameState = "win";
    }
  
    //Display laser lines
    for (int i = 0; i < laserLines.size(); i++) {
      LaserLine laser = laserLines.get(i);
      laser.update();
      laser.display();
      
      //Check Collision with the player
      if (laser.checkCollision(player)) {
        gameState = "gameOver";  //Set to game over once collison detected
      }
    }
    
  //Display laser machine
  for (int i = 0; i < laserMachines.size(); i++){
    laserMachines.get(i).display();
  }
  
  //Check if timer is expired
  if (gameTimer.isExpired()) {
    gameState = "gameOver";
  }
  
 } else if (gameState.equals("gameOver")){
   //Display "Game Over" message
   textAlign(CENTER, CENTER);  // Center-align the text
   textSize(32);  // Font size
   fill(255, 0, 0);  // Fill text with red
   text("Game Over! Press R to restart", width / 2, height / 2);  // Message display in the center of the screen
 } else if (gameState.equals("win")) {
   textAlign(CENTER, CENTER);  // Center-align the text
   textSize(32);  // Font size
   fill(255, 0, 0);  // Fill text with red
   text("You win! Press R to restart", width / 2, height / 2);  // Message display in the center of the screen
 }
      
   // Activate a random laser every 3 seconds 
   if (frameCount % 10 == 0) { // Every 2 seconds
     int randomIndex = int(random(laserLines.size()));
     laserLines.get(randomIndex).activate(120); // Activate laser for 2 seconds
    }
    
   //Display the timer
   gameTimer.display();
}

void keyPressed(){
  //Check of the game is in the "gameOver" state and the 'R' key is pressed
  if (gameState.equals("gameOver") || gameState.equals("win") && key == 'r'){
    gameState = "playing";  //Switch back to "playing" state
    player.reset();  //Reset player position
    gameTimer.reset();
  }
}

  
