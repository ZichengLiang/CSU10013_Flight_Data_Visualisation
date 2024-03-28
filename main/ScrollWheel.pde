void drawScroll(float x, float y, float w, float h, color col) {
  fill(col);
  noStroke(); // Optionally, customize or remove as needed
  
  // Calculate the positions and dimensions correctly
  float capsuleStartX = x - w / 2; // Starting x-coordinate of the capsule
  float capsuleEndX = x + w / 2;   // Ending x-coordinate of the capsule
  float rectWidth = w - h;         // Width of the rectangle part of the capsule
  
  // Ensure the rectangle is drawn in the correct position
  rect(capsuleStartX + h / 2, y - h / 2, rectWidth, h);
  
  // Draw the left semicircle (cap)
  ellipse(capsuleStartX + h / 2, y, h, h);
  // Draw the right semicircle (cap)
  ellipse((capsuleEndX - h / 2)-rectWidth, y - h, h, h);
}
