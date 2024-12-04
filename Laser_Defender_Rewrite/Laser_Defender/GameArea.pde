class GameArea {
  float x, y, w, h;
  int areaColor; // Color of the area, modify in the laser defender tab
  
  GameArea(float x, float y, float w, float h, int areaColor) {
    this.x = x;  // Assign the x-coordinate of the top-left corner
    this.y = y;  // Assign the y-coordinate of the top-left corner
    this.w = w;  // Assign the width of the rectangle
    this.h = h;  // Assign the height of the rectangle
    this.areaColor = areaColor;  // Assign the color of the rectangle
  }
  
  void display() {
    fill(areaColor);  // Set the areacolor, change in the laser defender tab
    noStroke();
    rect(x, y, w, h);
  }
}
