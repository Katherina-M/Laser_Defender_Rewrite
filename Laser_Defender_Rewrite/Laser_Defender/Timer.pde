class Timer {
  int startTime;
  int duration;

  Timer(int durationInSeconds) {
    duration = durationInSeconds * 1000; // Convert seconds to milliseconds
    reset();
  }

  void reset() {
    startTime = millis();
  }

  boolean isExpired() {
    return millis() - startTime >= duration;
  }

  void display() {
    int remainingTime = max(0, (duration - (millis() - startTime)) / 1000);
    textAlign(LEFT, TOP);
    textSize(20);
    fill(255);
    text("Time Left: " + remainingTime + "s", 10, 10);
  }
}
