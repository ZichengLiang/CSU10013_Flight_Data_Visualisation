//Aryan: 19th March
// added three buttons which when clicked do something (can be linked to displaying charts or anything

boolean button1Clicked = false;
boolean button2Clicked = false;
boolean button3Clicked = false;

// Reserved these for bar chart display
void mouseClicked() {
  if ((mouseX > (SCREENX / 4) - 50 && mouseX < (SCREENX / 4) + 50) && (mouseY > (SCREENY - 65) - 30 && mouseY < (SCREENY - 65) + 30)) {
    println("Button 1 clicked!");
    button1Clicked = true;
    theBarChart.byDistanceFrom("JFK");
  }

  if ((mouseX > (SCREENX / 2) - 50 && mouseX < (SCREENX / 2) + 50) && (mouseY > (SCREENY - 65) - 30 && mouseY < (SCREENY - 65) + 30)) {
    println("Button 2 clicked!");
    button2Clicked = true;
    theBarChart.byFlightFrom("JFK");
  }

  if ((mouseX > (SCREENX - (SCREENX / 4) - 10) - 50 && mouseX < (SCREENX - (SCREENX / 4) - 10) + 50) && (mouseY > (SCREENY - 65) - 30 && mouseY < (SCREENY - 65) + 30)) {
    println("Button 3 clicked!");
    button3Clicked = true;
    theBarChart.byAirlines();
  }
}
