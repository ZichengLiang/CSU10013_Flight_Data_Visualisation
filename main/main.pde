// Zicheng, 12th March, 21:00: I modified the sample program on https://processing.org/examples/loadfile2.html to fit our dataset;

Datapoint[] datapoints;
String[] lines;
int datapointCount = 0;
PFont body;
int displayNum = 10; // Display this many entries on each screen;
int startingEntry = 0; // Display from this entry number;
boolean drawBarChart = false; // Used to check if bar chart is used

// Oliver, 15th March: creation of widgets to swicth between screens
Screen Screens;
Widget[] buttons;
Widget[] buttonsHorizontal;
WidgetType2 showCase;
//Muireann O'Neill 15/03/24 11:12 declaring Charts here;
//=====
PieChart thePieChart;

//Daniel 15/03/24 initialized BarCharts here
TheBarChart theBarChart;

//M: As far as I understand it, draw function won't work properly if size is in setup.
void settings() {
  size(SCREENX, SCREENY);
}
void setup() {
  //Muireann O'Neill 14/03/24 17:12 initializing Charts here;
  //====
  thePieChart = new PieChart();
  //====
  //Daniel 15/03/24 initialized BarCharts here
  BarChart barChart = new BarChart(this); // Create a new BarChart instance
  theBarChart = new TheBarChart(barChart); // Initialize TheBarChart with the BarChart instance
  //====
  fill(255);
  noLoop();
  body = loadFont("myFont-12.vlw");
  textFont(body);
  textSize(12);
  rectMode(CENTER);

  datapoints = loadDatapoints("flights2k.csv");

  // Query functions test cases:
  Query late = new Query();
  late.lateFlights();
  //flightsFrom("JFK");
  //flightsTo("JFK");


  Screens = new Screen();
  buttons = new Widget[5];
  buttonsHorizontal = new Widget[3];
  for (int j = 0; j < buttons.length; j++) {
    if (j==1)
    {
      buttons[j] = new Widget(60, (SCREENY/buttons.length)*j+60, 100, 60, "Pie Chart",
        255, body, j);
    } else if (j==4)
    {
      buttons[j] = new Widget(60, (SCREENY/buttons.length)*j+60, 100, 60, "Bar Chart",
        255, body, j);
    } else
    {
      buttons[j] = new Widget(60, (SCREENY/buttons.length)*j+60, 100, 60, "button " + j,
        255, body, j);
    }
  }
  for (int j = 0; j<buttonsHorizontal.length; j++)
  {
    if (j==0)
    {
      buttonsHorizontal[j] = new Widget( ((SCREENX-SCREENX/1.99)/buttonsHorizontal.length)*j+SCREENX/4, SCREENY-65, 100, 60, "Toggle data",
        255, body, j);
    } else
    {
      buttonsHorizontal[j] = new Widget( ((SCREENX-SCREENX/1.99)/buttonsHorizontal.length)*j+SCREENX/4, SCREENY-65, 100, 60, "button"+j,
        255, body, j);
    }
  }
  // Oliver, 22nd March: Working on horix=zontal buttons

  showCase = new WidgetType2(SCREENX/1.5, SCREENY/6, SCREENX/1.01, SCREENY/3,
    255, body);
}

//displaynum = 10
void draw() {
  background(0);

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
  showCase.draw(datapoints);
}


void mousePressed() {
  int event;
  event = showCase.pressed(mouseX, mouseY);
  if (event>-1)
  {
    startingEntry += displayNum;
    if (startingEntry > datapoints.length) {
      startingEntry = 0; // go back to the begining;
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

Datapoint[] loadDatapoints(String fileName) {
  lines = loadStrings(fileName); // Loads in csv file in String array "lines" (each line is an element in array)
  datapoints = new Datapoint[lines.length];  // Datapoint array datapoints is given the length of lines

  for (int i = 0; i < lines.length; i++) {
    String[] pieces = split(lines[i], ','); // Got rid of integer and replaced it with constant variable

    if (pieces.length == DATAPOINTVARIABLECOUNT) { // checks if all the variables are there, if so, load it
      datapoints[datapointCount] = new Datapoint(pieces);
      datapointCount++;
    } else {
      String[] adjustedPieces = new String[DATAPOINTVARIABLECOUNT];
      if (pieces.length == DATAPOINTVARIABLECOUNT - 1 ) { //in the given dataset, cancelled flights have no dep_time and arr_time
        arrayCopy(pieces, 0, adjustedPieces, 0, 16); //copy from first element to CRSArrTime
        adjustedPieces[16] = " "; // the actual arrive time is set to " ";
        arrayCopy(pieces, 16, adjustedPieces, 17, 3); //copy the last three elements
      } else if (pieces.length == DATAPOINTVARIABLECOUNT - 2 ) { //in the given dataset, cancelled flights have no dep_time and arr_time
        arrayCopy(pieces, 0, adjustedPieces, 0, 14); //copy from first element to CRSDeptTime
        adjustedPieces[14] = " "; // the actual dept time is set to " ";
        adjustedPieces[15] = pieces[14];
        adjustedPieces[16] = " "; // the actual arr time is set to " ";
        arrayCopy(pieces, 15, adjustedPieces, 17, 3); //copy the last three elements
      }
      datapoints[datapointCount] = new Datapoint(adjustedPieces);
      datapointCount++;
    }
  } // for loop ends here

  return datapoints; // this is an array of Datapoint instances
}
