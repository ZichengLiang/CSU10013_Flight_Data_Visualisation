// Zicheng, 12th March, 21:00: I modified the sample program on https://processing.org/examples/loadfile2.html to fit our dataset;
Datapoint[] datapoints;
String[] lines;
int datapointCount;
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
  
  lines = loadStrings("flights2k.csv"); // Loads in csv file (each line is an element in array)
  datapoints = new Datapoint[lines.length];
  println(lines.length);
  for(int i2 = 0; i2 < lines.length; i2++){
    String[] pieces = split(lines[i2], ','); // Got rid of integer and replaced it with constant variable
    
// Oliver, 13th March, 1:05: Commented out if statement to add more to dataponts array
//    if (pieces.length == DATAPOINTVARIABLECOUNT){ // checks if all the variables are there
      datapoints[datapointCount] = new Datapoint(pieces);
      datapointCount++;
   }
  
  // if there are spare elements in datapoints array, remove them.
  if (datapointCount != datapoints.length){
    datapoints = (Datapoint[]) subset(datapoints, 0, datapointCount);
  }
  
  Screens = new Screen();
  buttons = new Widget[5];
  for(int i =0; i<buttons.length; i++)
  {
    buttons[i] = new Widget(60, (SCREENY/buttons.length)*i+60, 100, 60, "button "+i,
  255, body, i);
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
