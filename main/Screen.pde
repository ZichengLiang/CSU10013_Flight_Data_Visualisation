// Oliver, 14th March, creation of Screen class
class Screen
{
  int screenType, borders;
  int colourR=100; int colourG=50; int colourB=50;
  
  //Screen area
  float screenX;
  float screenY;
  //Screen location
  float startX;
  float startY;
  
  // Main Screen
  Screen()
  {
    //Screen area
    screenX = (SCREENX/1.5)-(2*borders);
    screenY = SCREENY-(2*borders);
    //Screen location
    startX = (4*SCREENX/6);//-(borders+screenX/2);
    startY = SCREENY/2;
    
    screenType=0;
    borders = 15;
  }
  
// Graph Screen Type A
//  Screen(int dataA, int dataB, int dataC)
//  {
//   this();
//    screenType=2;
//  }
 
  // Drawing of screen
  void draw()
  {
    switch(screenType)
    {
      case 0:
      fill(colourR, colourG, colourB);
      rect(startX, startY, screenX, screenY);
      
      fill(255);
      for(int i3 = 0; i3 < displayNum; i3++){
      int thisEntry = 0;
      thisEntry = startingEntry + i3;
      //~M: seems to be confusing the system, prints 10 times once replaced
      if (thisEntry < datapointCount){
      //M: there seems to be somthing going wrong with calling on data here, i need more info on exactly how data is being called before i can fix this
        text(thisEntry + " > " + datapoints[thisEntry].carrierCode + datapoints[thisEntry].flightNumber + " ---- " 
                     + datapoints[thisEntry].origin + " -> " + datapoints[thisEntry].dest
                     , startX-(screenX/2)+borders, startY-(screenY/2)+borders + i3*20);
        }
      }
      break;
      
      case 1:
      fill(255,255,0);
      rect(startX, startY, screenX, screenY);
      displayTableData(tableX, tableY, tableWidth, tableHeight);

      break;
      
      case 2:
      fill(255);
      rect(startX, startY, screenX, screenY);
      break;
      
      case 3:
      fill(255,0,0);
      rect(startX, startY, screenX, screenY);
      break;
      
      case 4:
      fill(0,255,0);
      rect(startX, startY, screenX, screenY);
      break;
      
    }
  }
}
