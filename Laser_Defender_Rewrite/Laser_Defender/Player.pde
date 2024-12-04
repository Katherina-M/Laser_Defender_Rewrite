class Player {
  PVector pos;  //Position of the player
  float speed = 5;  //Player moving speed
  
  Player(PVector startPos){
    pos = startPos.copy();  //Copy the starting position
  }
  
  //Updated the player position (Control the player)
  void update(){
    //Check if the key pressed
    if (keyPressed){
      if(keyCode == UP) pos.y -= speed;  //Move up
      if(keyCode == DOWN) pos.y += speed;  //Move down
      if(keyCode == LEFT) pos.x -= speed;  //Move left
      if(keyCode == RIGHT) pos.x += speed;  //Move right
    }
    
    //Lock player inside the game window
    pos.x = constrain(pos.x, 0, width);
    pos.y = constrain(pos.y, 0, height);
  }
  
  void display(){
    fill(0, 255, 0);  //Fill with green
    ellipse(pos.x, pos.y, 20, 20);  //Draw the player as a circle
  }
  
  void reset(){
    pos.set(width / 2, height - 50);  //Reset the position to the middlew of the game window
  }
}
