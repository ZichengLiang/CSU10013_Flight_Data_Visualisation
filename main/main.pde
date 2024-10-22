// Zicheng, 12th March, 21:00: I modified the sample program on https://processing.org/examples/loadfile2.html to fit our dataset;
import java.util.*;
import java.text.*;
import g4p_controls.*;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

Datapoint[] datapoints;
String[] lines;
String Search;
int datapointCount = 0;
PFont body;
int displayNum = 10; // Display this many entries on each screen;
int startingEntry = 0; // Display from this entry number;
int sideBarButtonsNum = 5;
int horizontalButtonsNum = 3;

boolean mouse = false;
PFont myFont;


Query currentQuery;
SearchBox txt;
// Oliver, 15th March: creation of widgets to switch between screens
Screen Screens;
Widget[] buttons;
Widget[] buttonsHorizontal;
Text showCase;

TheMap map;
//Muireann O'Neill 15/03/24 11:12 declaring Charts here;
PieChart thePieChart;
//Daniel 15/03/24 initialized BarCharts here
TheBarChart theBarChart;
//Daniel 02/04/24 Checkbox initialized
GCheckbox checkbox1, checkbox2;
boolean horizontalButtons = false;
boolean canceledPressed = false; // Checks to see if canceled checkbox pressed


Slider dateSlider;

void settings() {
  size(SCREENX, SCREENY);
}
void setup() {
  fill(BACKGROUND_COLOUR);
  body = loadFont("myFont-12.vlw");
  myFont = createFont("Times New Roman", 16);
  textFont(body);
  textSize(12);
  rectMode(CENTER);

  datapoints = loadDatapoints("flights_full.csv");
  table = loadTable("flights2k.csv", "header");
  Screens = new Screen();
  Query fromWholeDataSet = new Query();
  currentQuery = fromWholeDataSet;
  thePieChart = new PieChart();
  thePieChart.getAbnormalFlights();
  thePieChart.carrierCO(currentQuery);

  // Zicheng  20/03/24 Initialised flight distances to bar chart
  //Daniel 15/03/24 initialized BarCharts here
  BarChart barChart = new BarChart(this); // Create a new BarChart instance
  theBarChart = new TheBarChart(barChart); 

  // Buttons
  Screens = new Screen();
  //the side bar buttons here:
  initializeSidebarButtons();
  initializeHorizontalButtons();

  // Oliver, 22nd March: Working on horix=zontal buttons
  showCase = new Text(SCREENX-100, SCREENY-100, 200, 200, 255, body);
  // Daniel  2nd April: Checkboxes
  createGUI();
  // Oliver 26th March: Map work

  map = new TheMap(SCREENX/6, SCREENY/3, 700, 450, currentQuery.getArrayList());

  // Aryan: 4th April
  // Create an instance of SliderClass

  dateSlider = new Slider(this, 31);
  
  thread("map.renewMap");
}

//displaynum = 10
void draw() {
  noStroke();
  background(BACKGROUND_COLOUR);
 
  textSize(12);
  
  Screens.draw();
  
  for (int i=0; i<buttons.length; i++)
  {
    buttons[i].draw();
  }
  if ( horizontalButtons == true) {   // If BarChart button pressed then draw horizontal buttons
    for (int i=0; i<buttonsHorizontal.length; i++)
    {
      buttonsHorizontal[i].draw();
    }
  }
  showCase.draw(currentQuery.filterQuery().toArray(Datapoint[]::new));
}

void mousePressed() {

  float distToPlus = dist(mouseX, mouseY, 1877, 197);
  if (distToPlus < 30) {
    fontSize += 1;
  }
  
  float distToMinus = dist(mouseX, mouseY, 1878, 267);
  if (distToMinus < 30) {
     fontSize -= 1;
  }

  if (mouseX > arrowX && mouseX < arrowX + buttonWidth && mouseY > arrowMargin && mouseY < arrowMargin + buttonHeight) {
    scrollY1 += 20; // Move text down
  }
  
  // Check if click is within the down arrow area
  if (mouseX > arrowX && mouseX < arrowX + buttonWidth && mouseY > downArrowY && mouseY < downArrowY + buttonHeight) {
    scrollY1  -= 20; // Move text up
  }
  if (mouseX > leftArrowX && mouseX < leftArrowX + buttonWidth && mouseY > horizontalArrowsY && mouseY < horizontalArrowsY + buttonHeight) {
    tableX += 20; // Move text left
  }

  // Right Arrow
  if (mouseX > rightArrowX && mouseX < rightArrowX + buttonWidth && mouseY > horizontalArrowsY && mouseY < horizontalArrowsY + buttonHeight) {
    tableX -= 20; // Move text right
  }

  int event = -1;

  //scrollY -= 20;
  event = showCase.pressed(mouseX, mouseY);
 
  if (event>-1)
  {
    startingEntry += displayNum;
    if (startingEntry > datapoints.length) {
      startingEntry = 0; // go back to the beginning;
    }
  }

  for (int i =0; i<buttonsHorizontal.length; i++)
  {
    event=buttonsHorizontal[i].getEvent(mouseX, mouseY);
    if (event >= 0) {
    }
  }

  for (int i =0; i<buttons.length; i++)
  {
    event=buttons[i].getEvent(mouseX, mouseY);
    if (event>=0)
    {
      Screens.screenType=event;
    }
  }

  redraw();
}
//Zicheng 7th April: upgrade loadDatapoints method with BufferedReader;
Datapoint[] loadDatapoints(String fileName) {
  ArrayList<Datapoint> tempList = new ArrayList<>();
  try (BufferedReader br = new BufferedReader(new FileReader(sketchPath(fileName)))) {
    String line;
    br.readLine(); // Skip header
    while ((line = br.readLine()) != null) {
      String[] pieces = line.split(",");
      // Process pieces to create a Datapoint and add to tempList
      if (pieces.length == DATAPOINTVARIABLECOUNT) { // checks if all the variables are there, if so, load it
        tempList.add(new Datapoint(pieces));
      } else {
        String[] adjustedPieces = new String[DATAPOINTVARIABLECOUNT];
        if (pieces.length == DATAPOINTVARIABLECOUNT - 1 ) { //in the given dataset, cancelled flights have no dep_time and arr_time
          arrayCopy(pieces, 0, adjustedPieces, 0, 16); //copy from first element to CRSArrTime
          adjustedPieces[16] = "9999"; // the actual arrive time is set to " ";
          arrayCopy(pieces, 16, adjustedPieces, 17, 3); //copy the last three elements
        } else if (pieces.length == DATAPOINTVARIABLECOUNT - 2 ) { //in the given dataset, cancelled flights have no dep_time and arr_time
          arrayCopy(pieces, 0, adjustedPieces, 0, 14); //copy from first element to CRSDeptTime
          adjustedPieces[14] = "9999"; // the actual dept time is set to " ";
          adjustedPieces[15] = pieces[14];
          adjustedPieces[16] = "9999"; // the actual arr time is set to " ";
          arrayCopy(pieces, 15, adjustedPieces, 17, 3); //copy the last three elements
        }
        tempList.add(new Datapoint(adjustedPieces));
      }
    }
    br.close();
  }
  catch (IOException e) {
    e.printStackTrace();
  }
  println(tempList.size() + " entries loaded");
  return tempList.toArray(Datapoint[]::new);
}

void initializeSidebarButtons() {
  buttons = new Widget[sideBarButtonsNum];
  for (int j = 0; j < buttons.length; j++) {
    if (j == 1) {
      buttons[j] = new Widget(60, (SCREENY / buttons.length) * j + 60, 100, 60, 20, "Pie Chart", 255, body, j);
    } else if (j==2) {
      buttons[j] = new Widget(60, (SCREENY / buttons.length) * j + 60, 100, 60, 20, "Map", 255, body, j);
    } else if (j == 4) {
      buttons[j] = new Widget(60, (SCREENY / buttons.length) * j + 60, 100, 60, 20, "Bar Chart", 255, body, j);
    }
    else if(j==0)
    {
      buttons[j] = new Widget(60, (SCREENY / buttons.length) * j + 60, 100, 60, 20, "Main Screen", 255, body, j);
    }
    else if(j==3)
    {
      buttons[j] = new Widget(60, (SCREENY / buttons.length) * j + 60, 100, 60, 20, "Table", 255, body, j);
    }
      else {
      buttons[j] = new Widget(60, (SCREENY / buttons.length) * j + 60, 100, 60, 20, "button " + j, 255, body, j);
    }
  }
}

void initializeHorizontalButtons() {
  buttonsHorizontal = new Widget[horizontalButtonsNum];
  for (int j = 0; j < buttonsHorizontal.length; j++) {
    if (j == 0) {
      buttonsHorizontal[j] = new Widget(SCREENX / 4, SCREENY - 65, 100, 60, 20, "Flight distance", 255, body, j); // 0.25
    } else if (j == 1) {
      buttonsHorizontal[j] = new Widget( SCREENX / 2, SCREENY - 65, 100, 60, 20, "Flights by \nAirline ", 255, body, j); // 0.5
    } else {
      buttonsHorizontal[j] = new Widget(SCREENX - (SCREENX / 4) - 10, SCREENY - 65, 100, 60, 20, "Flight from", 255, body, j); // 0.75
    }
  }
}
//CheckBoxes
public void checkbox1_clicked(GCheckbox checkbox, GEvent event) { // Checks to see if a checkbox is clicked
  if (checkbox1.isSelected() == true) {
    currentQuery.setCancelled(true);
    // canceledPressed = true;
    currentQuery = new Query(currentQuery.filterQuery(), "Cancelled");

    if (button1Clicked == true) {
      theBarChart.byDistanceFrom("JFK");
    }
    if (button2Clicked == true) {
      theBarChart.byAirlines();
    }
    if (button3Clicked == true) {
      theBarChart.byFlightFrom("JFK");
    }

    // renewGraphs();
    redraw();
  } else {
    currentQuery = new Query();
    // canceledPressed = false;

    if (button1Clicked == true) {
      theBarChart.byDistanceFrom("JFK");
    }
    if (button2Clicked == true) {
      theBarChart.byAirlines();
    }
    if (button3Clicked == true) {
      theBarChart.byFlightFrom("JFK");
    }
    //currentQuery.setCancelled(false);
    // renewGraphs();
    redraw();
  }
}

public void checkbox2_clicked(GCheckbox checkbox, GEvent event) { // Checks to see if a checkbox is clicked
  if (checkbox2.isSelected() == true) {
    currentQuery.setDiverted(true);
    // canceledPressed = true;
    currentQuery = new Query(currentQuery.filterQuery(), "Diverted");

    if (button1Clicked == true) {
      theBarChart.byDistanceFrom("JFK");
    }
    if (button2Clicked == true) {
      theBarChart.byAirlines();
    }
    if (button3Clicked == true) {
      theBarChart.byFlightFrom("JFK");
    }

    // renewGraphs();
    redraw();
  } else {
    currentQuery = new Query();
    // canceledPressed = false;

    if (button1Clicked == true) {
      theBarChart.byDistanceFrom("JFK");
    }
    if (button2Clicked == true) {
      theBarChart.byAirlines();
    }
    if (button3Clicked == true) {
      theBarChart.byFlightFrom("JFK");
    }
    //currentQuery.setCancelled(false);
    // renewGraphs();
    redraw();
  }
}

public void createGUI() {
  checkbox1 = new GCheckbox(this, SCREENX - 180, 30, 200, 20);
  checkbox1.setText("cancelled");
  checkbox1.setOpaque(false);
  checkbox1.addEventHandler(this, "checkbox1_clicked");

  checkbox2 = new GCheckbox(this, SCREENX - 180, 80, 200, 20);
  checkbox2.setText("diverted");
  checkbox2.setOpaque(false);
  checkbox2.addEventHandler(this, "checkbox2_clicked");

}

public void renewGraphs() {
  //thePieChart.getAbnormalFlights();
  thePieChart.carrierCO(currentQuery);
}
