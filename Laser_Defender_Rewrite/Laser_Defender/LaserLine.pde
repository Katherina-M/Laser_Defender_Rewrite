class LaserLine {
  float startX, y; // Start position and y-coordinate of the laser line
  int lineColor; // Color of the laser line
  boolean isActive; // Whether the laser is active or not
  int activeDuration; // Duration for which the laser is active
  int activeStartFrame; // Frame count when the laser was activated
  
  LaserLine(float startX, float y, int lineColor) {
    this.startX = startX; // Start position matches the LaserMachine's x
    this.y = y; // y-coordinate aligns with LaserMachine's y
    this.lineColor = lineColor;
    this.isActive = false; // Lasers start inactive
    this.activeDuration = 120; // Default duration (2 seconds at 60 fps)
  }
  
  // Activate the laser with a specified duration
  void activate(int duration) {
    isActive = true;
    activeStartFrame = frameCount; // Record the frame when activated
    activeDuration = duration;
  }
  
  // Update laser state to deactivate after the duration
  void update() {
    if (isActive && frameCount > activeStartFrame + activeDuration) {
      isActive = false; // Deactivate laser after the duration
    }
  }
  
  // Check if player touches the laser
    boolean checkCollision(Player player) {
      if (isActive) {
        if (player.pos.y > y - 5 && player.pos.y < y + 5) { // Player y-coordinate overlaps with laser line
          return true;
        }
      }
      return false;
    }
    
  
  void display() {
    if (isActive) {
      fill(lineColor);
      noStroke();
    if (startX == 0) {
      rect(startX, y - 5, width, 5); // Laser extends from left side to the right
    } else {
      rect(0, y - 5, width, 5); // Laser extends from right side to the left
      }
    }
  }
}
