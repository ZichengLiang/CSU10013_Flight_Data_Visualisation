boolean button1Clicked = false;
boolean button2Clicked = false;
boolean button3Clicked = false;

void mouseClicked() {
  if (mouseX > 280 && mouseX < 400 && mouseY > 510 && mouseY < 550) { // Adjusted mouse coordinates
    println("Button 1 clicked!");
    // Add any actions you want to execute when Button 1 is clicked
  }
  
  if (mouseX > 430 && mouseX < 550 && mouseY > 510 && mouseY < 550) { // Adjusted mouse coordinates
    println("Button 2 clicked!");
    // Add any actions you want to execute when Button 2 is clicked
  }
  
  if (mouseX > 580 && mouseX < 700 && mouseY > 510 && mouseY < 550) { // Adjusted mouse coordinates
    println("Button 3 clicked!");
    // Add any actions you want to execute when Button 3 is clicked
  }
}
