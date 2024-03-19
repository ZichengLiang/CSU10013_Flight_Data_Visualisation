// Zicheng, 12th March, 21:00: I modified the sample program on https://processing.org/examples/loadfile2.html to fit our dataset;

Datapoint[] datapoints;
String[] lines;
int datapointCount = 0;
PFont body;
int displayNum = 10; // Display this many entries on each screen;
int startingEntry = 0; // Display from this entry number;

// Oliver, 15th March: creation of widgets to swicth between screens
Screen Screens;
Widget[] buttons;

//M: As far as I understand it, draw function won't work properly if size is in setup.
void settings(){
  size(SCREENX, SCREENY);
}
void setup(){
  fill(255);
  noLoop();
  body = loadFont("myFont-12.vlw"); 
  textFont(body);
  textSize(12);
  rectMode(CENTER);
  
  datapoints = loadDatapoints("flights2k.csv");
  //datapoints = loadDatapoints("flights10k.csv");
  
  // Query functions test cases: 
  // Query late = new Query(); // start a query from the whole dataset;
  // late.lateFlights();
   Query airport = new Query();
   ArrayList<Datapoint> fromJFK = airport.flightsFrom("JFK");
   Query nothing = new Query(fromJFK);
   nothing.flightsTo("JFK");
 
 
 Screens = new Screen();
 buttons = new Widget[5];
 for(int j = 0; j < buttons.length; j++){
  buttons[j] = new Widget(60, (SCREENY/buttons.length)*j+60, 100, 60, "button " + j,
  255, body, j);
 }
}

//displaynum = 10
  void draw(){
  background(0);

    Screens.draw();
    for(int i=0; i<buttons.length; i++)
    {
      buttons[i].draw();
    }
  }


void mousePressed(){
  startingEntry += displayNum;
  if (startingEntry > datapoints.length){
    startingEntry = 0; // go back to the begining;
  }
  int event;
  for(int i =0; i<buttons.length;i++)
  {
    event=buttons[i].getEvent(mouseX, mouseY);
    if(event>=0)
    {
      Screens.screenType=event;
    }
  }
  redraw();
}

//this function loads csv entries given the file name, it converts all lines into a Datapoint array;
Datapoint[] loadDatapoints(String fileName){
  lines = loadStrings(fileName); // Loads in csv file in String array "lines" (each line is an element in array)
  datapoints = new Datapoint[lines.length];  // Datapoint array datapoints is given the length of lines
  
  for(int i = 0; i < lines.length; i++){
    String[] pieces = split(lines[i], ','); // Got rid of integer and replaced it with constant variable
    
    if (pieces.length == DATAPOINTVARIABLECOUNT){ // checks if all the variables are there, if so, load it
      datapoints[datapointCount] = new Datapoint(pieces);
      datapointCount++;
    }
    else{
      String[] adjustedPieces = new String[DATAPOINTVARIABLECOUNT];
      if (pieces.length == DATAPOINTVARIABLECOUNT - 1 ){ //in the given dataset, some cancelled flights have no arr_time (but they have dep_time
      arrayCopy(pieces, 0, adjustedPieces, 0, 16); //copy from first element to CRSArrTime
      adjustedPieces[16] = " "; // the actual arrive time is set to " ";
      arrayCopy(pieces, 16, adjustedPieces, 17, 3); //copy the last three elements
     }
     else if (pieces.length == DATAPOINTVARIABLECOUNT - 2 ){ //in the given dataset, some cancelled flights have no dep_time and arr_time
      arrayCopy(pieces, 0, adjustedPieces, 0, 14); //copy from first element to CRSDeptTime
      adjustedPieces[14] = " "; // the actual dept time is set to " ";
      adjustedPieces[15] = pieces[14];
      adjustedPieces[16] = " "; // the actual arr time is set to " ";
      arrayCopy(pieces, 15, adjustedPieces, 17, 3); //copy the last three elements
     }
       datapoints[datapointCount] = new Datapoint(adjustedPieces);
       datapointCount++; 
       println(datapointCount + "lines loaded!");
   } 
 } // for loop ends here
  return datapoints; // returns an array of Datapoint instances
}
