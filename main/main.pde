// Zicheng, 12th March, 21:00: I modified the sample program on https://processing.org/examples/loadfile2.html to fit our dataset;
Datapoint[] datapoints;
String[] lines;
int datapointCount;
PFont body;
int displayNum = 10; // Display this many entries on each screen;
int startingEntry = 0; // Display from this entry number;
boolean PieDisplayed = false; //Muireann O'Neill 17/03/2024 activates/deactivates PieChart
int current_screen = 0;
//Muireann O'Neill 13/03/24 19:30: As far as I understand it, draw function won't work properly if size is in setup.
//void settings(){
//  size(600, 600);
//}
  //Muireann O'Neill 15/03/24 11:12 declaring Charts here;
  //===== 
  PieChart thePieChart;
  
  //=====
void setup(){
  size(600, 600);
  //Muireann O'Neill 14/03/24 17:12 initializing Charts here;
  //====
  thePieChart = new PieChart();
  //====
  fill(255);
  noLoop();
  body = loadFont("myFont-12.vlw"); 
  textFont(body);
  textSize(12);
  
//<<<<<<< HEAD
  //lines = loadStrings("flights2k.csv");                   //loading strings into array 'lines'
  //datapoints = new Datapoint[lines.length];               //setting a new object Datapoint as length of Array'lines'
  //println(lines.length);                    
  //for(int i = 0; i < lines.length; i++){    
  //  String[] pieces = split(lines[i], ',');              // new string splitting lines by ','  Note: try usedelimiter if it does not work that's fine but it would be a cleaner solution
  //  if (pieces.length == 18){                            //?? if the length of 'pieces' is == 18;
  //    datapoints[datapointCount] = new Datapoint(pieces);//new datapoint is created with the length of pieces datapoint count increases by 1;
//=======
  lines = loadStrings("flights2k.csv"); // Loads in csv file (each line is an element in array)
  datapoints = new Datapoint[lines.length];
  println(lines.length);
  for(int i2 = 0; i2 < lines.length; i2++){
    String[] pieces = split(lines[i2], ','); // Got rid of integer and replaced it with constant variable
//========
  
 
// Oliver, 13th March, 1:05: Commented out if statement to add more to dataponts array
//    if (pieces.length == DATAPOINTVARIABLECOUNT){ // checks if all the variables are there
      datapoints[datapointCount] = new Datapoint(pieces);
//>>>>>>> main
      datapointCount++;
   }
  
  // if there are spare elements in datapoints array, remove them.
  if (datapointCount != datapoints.length){
    datapoints = (Datapoint[]) subset(datapoints, 0, datapointCount);
  }
 }
  
//displaynum = 10
  void draw(){
  background(0);
  if (current_screen == 0){
  for(int i3 = 0; i3 < displayNum; i3++){
    int thisEntry = 0;
    thisEntry = startingEntry + i3;
    if (thisEntry < datapointCount){
      text(thisEntry + " > " + datapoints[thisEntry].carrierCode + datapoints[thisEntry].flightNumber + "----" 
           + datapoints[thisEntry].origin + " -> " + datapoints[thisEntry].combinedOriginCityName
           , 20, 20 + i3*20);
      
     
    }
  }
  }
   else if (current_screen == PIECHARTSCREEN){
     thePieChart.draw();
   }
    
  
}
// Muireann O'Neill started 16/3/24 20:25 finished 19/3/24 12:54 
void keyPressed(){
   if (key == 'b'){
     PieDisplayed = true; 
     current_screen = PIECHARTSCREEN;  //display piechart screen
     println("b pressed");             //print to test for error
     redraw();                         //redraw screen
   }
   else{
     current_screen = 0;              //set currentscreen as main
     redraw();                        //redraw screen
     //PieDisplayed = false;
   }
   
 }

     
    
    


//<<<<<<< HEAD
//void mousePressed(){
//  startingEntry += displayNum;
//  if (startingEntry > datapoints.length){
//    startingEntry = 0; // go back to the begining;
//  }
//  redraw();
//}

// input.useDelimiter("[\\p{javaWhitespace}\\/]");
//=======
void mousePressed(){
  startingEntry += displayNum;
  if (startingEntry > datapoints.length){
    startingEntry = 0; // go back to the begining;
  }
  redraw();
}


//>>>>>>> main
