// Zicheng, 12th March, 21:00: I modified the sample program on https://processing.org/examples/loadfile2.html to fit our dataset;
import java.util.*;

//Datapoint[] datapoints;
//String[] lines;
ArrayList<Datapoint> datapoints;
//int datapointCount = 0;
PFont body;
int displayNum = 10; // Display this many entries on each screen;
int startingEntry = 0; // Display from this entry number;
int sideBarButtonsNum = 5;
int horizontalButtonsNum = 3;
boolean drawBarChart = false; // Used to check if bar chart is used

// Oliver, 15th March: creation of widgets to switch between screens

Screen Screens;
Widget[] buttons;
Widget[] buttonsHorizontal;
WidgetType2 showCase;

Query fromWholeDataset;

Map map;
//Muireann O'Neill 15/03/24 11:12 declaring Charts here;
PieChart thePieChart;
//Daniel 15/03/24 initialized BarCharts here
TheBarChart theBarChart;

void settings() {
  size(SCREENX, SCREENY);
}
void setup() {
  //Daniel 15/03/24 initialized BarCharts here
  BarChart barChart = new BarChart(this); // Create a new BarChart instance

  fill(BACKGROUND_COLOUR);
  noLoop();
  body = loadFont("myFont-12.vlw");
  textFont(body);
  textSize(12);
  rectMode(CENTER);
  
  // initialise the ArrayList of datapoints
  datapoints = new ArrayList<>();
  datapoints = loadDatapoints("flights2k.csv");
  table = loadTable("flights2k.csv", "header");
  // Query functions test cases:
  fromWholeDataset = new Query();
  int totalFlights    = fromWholeDataset.lastQueryList.size();
  int cancelledNumber = fromWholeDataset.cancelledFlights().size();
  //int cancelledNumberPercent = cancelledNumber/totalFlights;
  int divertedNumber  = fromWholeDataset.divertedFlights().size();
  //int divertedNumberPercent = divertedNumber/totalFlights;

  int totalUnaffected = totalFlights-(divertedNumber + cancelledNumber);
  //int flightsUnaffected = totalFlights - (cancelledNumber + divertedNumber);

  int[] AFlights = {divertedNumber, cancelledNumber, totalUnaffected};
  //Muireann O'Neill 14/03/24 17:12 initializing Charts here;
  thePieChart = new PieChart(AFlights);
  // Zicheng  20/03/24 Initialised flight distances to bar chart
  ArrayList<Datapoint> sortedFlights = sortByDistance(fromWholeDataset.flightsFrom("JFK"));

  Datapoint[] flights = sortedFlights.toArray(Datapoint[]::new);

  float[] flightDistance = new float[flights.length];
  for (int i = 0; i < flights.length; i++) {
    flightDistance[i] = flights[i].distance;
  }
  String[] flightDestination = new String[flights.length];
  for (int i = 0; i < flights.length; i++) {
    flightDestination[i] = flights[i].dest;
  }

  // BarChart (Checks flight distance)
  float[] topDistances = new float[datapoints.size()];
  String[] topDestinations = new String[datapoints.size()];
  int airportCounter = 0; //Counts airports passed through

  for (int i = 0; i < flightDistance.length && airportCounter < 5; i++) {
    if (! inTopDestinations(flightDestination[i], topDestinations)) {
      topDistances[airportCounter] = flightDistance[i];
      topDestinations[airportCounter] = flightDestination[i];
      airportCounter++;
    }
  }
  topDistances = Arrays.copyOf(topDistances, airportCounter);
  topDestinations = Arrays.copyOf(topDestinations, airportCounter);
  theBarChart = new TheBarChart(barChart, topDistances, topDestinations);



  // Buttons
  Screens = new Screen();
  //the side bar buttons here:
  initializeSidebarButtons();
  initializeHorizontalButtons();
  // Oliver, 22nd March: Working on horix=zontal buttons
  showCase = new WidgetType2(SCREENX/1.5, SCREENY/6, SCREENX/1.01, SCREENY/3,

   255, body);
   

   //Query for flights by a specific carrier (e.g., American Airlines with carrier code "AA")
  Query carrierQuery = new Query();
  ArrayList<Datapoint> bySpecificCarrier = carrierQuery.flightsByCarrier("AA");
  
   //Query for flights on a specific date
    Query onDate = new Query();
    ArrayList<Datapoint> onSpecificDate = onDate.flightsOnDate("20220101"); // Example: "20240101" for January 1, 2024

// Aryan, 27th March
    // Get the summary for a specific flight number (replace "XX" with the actual flight number)
    getFlightSummary("AA", 1); // First enter the airline code within quotes and then enter the flt num

  // Oliver 26th March: Map work
  map = new Map(SCREENX/2.5, SCREENY/3, 700, 450, datapoints.toArray(new Datapoint[0]) );
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
  for (int i=0; i<buttonsHorizontal.length; i++)
  {
    buttonsHorizontal[i].draw();
  }
  showCase.draw(datapoints.toArray(new Datapoint[0]));
}

void mousePressed() {
  int event;
  event = showCase.pressed(mouseX, mouseY);
  scrollY -= 20;
  if (event>-1)
  {
    startingEntry += displayNum;
    if (startingEntry > datapoints.size()) {
      startingEntry = 0; // go back to the beginning;
    }
  }
  for (int i =0; i<buttonsHorizontal.length; i++)
  {
    event=buttonsHorizontal[i].getEvent(mouseX, mouseY);
    if (event>=0)
    {
      if (event==0)
      {
        showCase.show=-showCase.show;
      }
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
// TODO: Change the data structure of loaded data entries. Now we implement an array of Datapoints to store the whole set of data
// work flow here: convert each String entry to an instance of Datapoint, store it into the array, then next entry;
ArrayList<Datapoint> loadDatapoints(String fileName) {
  String[] lines = loadStrings(fileName); // Loads in csv file in String array "lines" (each line is an element in array)
  //datapoints = new Datapoint[lines.length - 1];  // Adjusted the size of datapoints array
  

  for (int i = 1; i < lines.length; i++) {  // Start reading from the second line, skipping the header
    String[] pieces = split(lines[i], ','); // Got rid of integer and replaced it with constant variable

    if (pieces.length == STANDARDENTRYLENGTH) { // checks if all the variables are there, if so, load it
      Datapoint thisDatapoint = new Datapoint(pieces);
      datapoints.add(thisDatapoint);
    } else {
      String[] adjustedPieces = new String[STANDARDENTRYLENGTH];
      if (pieces.length == STANDARDENTRYLENGTH - 1 ) { //in the given dataset, cancelled flights have no dep_time and arr_time
        arrayCopy(pieces, 0, adjustedPieces, 0, 16); //copy from first element to CRSArrTime
        adjustedPieces[16] = "9999"; // the actual arrive time is set to " ";
        arrayCopy(pieces, 16, adjustedPieces, 17, 3); //copy the last three elements
      } else if (pieces.length == STANDARDENTRYLENGTH - 2 ) { //in the given dataset, cancelled flights have no dep_time and arr_time
        arrayCopy(pieces, 0, adjustedPieces, 0, 14); //copy from first element to CRSDeptTime
        adjustedPieces[14] = "9999"; // the actual dept time is set to " ";
        adjustedPieces[15] = pieces[14];
        adjustedPieces[16] = "9999"; // the actual arr time is set to " ";
        arrayCopy(pieces, 15, adjustedPieces, 17, 3); //copy the last three elements
      }
      Datapoint thisDatapoint = new Datapoint(pieces);
      datapoints.add(thisDatapoint);
    }
  } // for loop ends here

  return datapoints; // this is an array of Datapoint instances
}

void initializeSidebarButtons() {
  buttons = new Widget[sideBarButtonsNum];
  for (int j = 0; j < buttons.length; j++) {
    if (j == 1) {
      buttons[j] = new Widget(60, (SCREENY / buttons.length) * j + 60, 100, 60, 20, "Pie Chart", 255, body, j);
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
      buttonsHorizontal[j] = new Widget(((SCREENX - SCREENX / 1.99) / buttonsHorizontal.length) * j + SCREENX / 4, SCREENY - 65, 100, 60,20, "Toggle data", 255, body, j);
    } else {
      buttonsHorizontal[j] = new Widget(((SCREENX - SCREENX / 1.99) / buttonsHorizontal.length) * j + SCREENX / 4, SCREENY - 65, 100, 60,20, "button" + j, 255, body, j);
    }
  }
}

boolean inTopDestinations(String airport, String[] topDestinations) {
  for (String destination : topDestinations) {
    if (airport.equals(destination)) {
      return true;
    }
  }
  return false;
}

ArrayList<Datapoint> sortByDistance(ArrayList<Datapoint> input) {
  ArrayList<Datapoint> sortedList = new ArrayList<Datapoint>(input);

  Collections.sort(sortedList, (item2, item1) -> Integer.compare(item1.getDistance(), item2.getDistance()));
  return sortedList;
}
