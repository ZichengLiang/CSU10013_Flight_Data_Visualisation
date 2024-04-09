// Zicheng, 12th March, 21:00: I modified the sample program on https://processing.org/examples/loadfile2.html to fit our dataset;
import java.util.*;
import java.text.*;
import g4p_controls.*;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

Datapoint[] datapoints;
String[] lines;

int datapointCount = 0;
PFont body;
int displayNum = 10; // Display this many entries on each screen;
int startingEntry = 0; // Display from this entry number;
int sideBarButtonsNum = 5;
int horizontalButtonsNum = 3;
Query currentQuery;

// Oliver, 15th March: creation of widgets to switch between screens
Screen Screens;
Widget[] buttons;
Widget[] buttonsHorizontal;
Text showCase;

Map map;
//Muireann O'Neill 15/03/24 11:12 declaring Charts here;
PieChart thePieChart;
//Daniel 15/03/24 initialized BarCharts here
TheBarChart theBarChart;
//Daniel 02/04/24 Checkbox initialized
GCheckbox checkbox1, checkbox2;
boolean horizontalButtons = false;

Slider dateSlider;

void settings() {
  size(SCREENX, SCREENY);
}
void setup() {
  fill(BACKGROUND_COLOUR);
  body = loadFont("myFont-12.vlw");
  textFont(body);
  textSize(12);
  rectMode(CENTER);

  datapoints = loadDatapoints("flights_full.csv");
  table = loadTable("flights2k.csv", "header");
  Screens = new Screen();
  Query fromWholeDataSet = new Query();
  currentQuery = fromWholeDataSet;
  // Oliver 26th March: Map work
  map = new Map(SCREENX/5, SCREENY/3, 700, 450, datapoints);

  //Muireann O'Neill 14/03/24 17:12 initializing Charts here;
  thePieChart = new PieChart();
  thePieChart.getAbnormalFlights();
  //thePieChart.getAbnormalFlights();
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
  map = new Map(SCREENX/5, SCREENY/3, 700, 450, datapoints);
  // Aryan: 4th April
  // Create an instance of SliderClass

  dateSlider = new Slider(this, 31);
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
  if ( horizontalButtons == true) {
    for (int i=0; i<buttonsHorizontal.length; i++)
    {
      buttonsHorizontal[i].draw();
    }
  }
  showCase.draw(currentQuery.filterQuery().toArray(Datapoint[]::new));
}

void mousePressed() {
  int event;
  scrollY -= 20;
  event = showCase.pressed(mouseX, mouseY);
  //scrollY -= 20;
  System.out.println(event);
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
    } else {
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
      buttonsHorizontal[j] = new Widget( SCREENX / 2, SCREENY - 65, 100, 60, 20, "Flight from", 255, body, j); // 0.5
    } else {
      buttonsHorizontal[j] = new Widget(SCREENX - (SCREENX / 4) - 10, SCREENY - 65, 100, 60, 20, "Flights by \nAirline", 255, body, j); // 0.75
    }
  }
}
//CheckBoxes
public void checkbox1_clicked(GCheckbox checkbox, GEvent event) {
  if (checkbox1.isSelected() == true) {
    currentQuery.setCancelled(true);
    currentQuery = new Query(currentQuery.filterQuery(), "Cancelled");
    renewGraphs();
    redraw();
  } else {
    currentQuery = new Query();
    //currentQuery.setCancelled(false);
    renewGraphs();
    redraw();
  }
}

public void checkbox2_clicked(GCheckbox checkbox, GEvent event) {
  if (checkbox2.isSelected() == true) {
    //theBarChart.byAirlines();
    println("Checkbox 2 clicked");
  } else {
    //theBarChart.byDistanceFrom("JFK");
    println("Checkbox 2 not clicked");
  }
}

/*public void checkbox3_clicked() {
 if (checkbox3.isSelected() == true) {
 println("Checkbox 3 clicked");
 } else {
 println("Checkbox 3 not clicked");
 }
 }*/


public void createGUI() {
  checkbox1 = new GCheckbox(this, SCREENX - 180, 30, 200, 20);
  checkbox1.setText("cancelled");
  checkbox1.setOpaque(false);
  checkbox1.addEventHandler(this, "checkbox1_clicked");

  checkbox2 = new GCheckbox(this, SCREENX - 180, 80, 200, 20);
  checkbox2.setText("Flights from");
  checkbox2.setOpaque(false);
  checkbox2.addEventHandler(this, "checkbox2_clicked");

  /*checkbox3 = new GCheckbox(this, SCREENX - 300, 130, 200, 20);
   checkbox3.setText("Flights to");
   checkbox3.addEventHandler(this, "handleToggleControlEvents");
   checkbox3.setOpaque(false);*/
}

public void renewGraphs() {
  //thePieChart.getAbnormalFlights();
  thePieChart.carrierCO(currentQuery);
  theBarChart.byDistanceFrom("JFK");
}
