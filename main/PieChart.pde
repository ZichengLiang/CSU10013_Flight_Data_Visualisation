class PieChart{
  
  int[] angles = { 30, 10, 45, 35, 60, 38, 75, 67 };

void setup() {
  size(640, 360);
  noStroke();
  noLoop();  // Run once and stop
}

void  draw() {
  background(0);
  pieChart(300, angles);
}

void pieChart(float diameter, int[] data) {
  float lastAngle = 0;
  for (int i = 0; i < data.length; i++) {
    float blue = map(i, 0, data.length, 0, 255);
    fill(blue);
    arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(data[i]));
    lastAngle += radians(data[i]);
  }
}

  
  
}
