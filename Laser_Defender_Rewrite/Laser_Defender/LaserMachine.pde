class LaserMachine {
  float x, y;
  
  LaserMachine(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void display(){
    //Fill machine with yellow color
    fill(200, 200, 50);
    rect(x - 15, y - 15, 30, 30);
  }
}
