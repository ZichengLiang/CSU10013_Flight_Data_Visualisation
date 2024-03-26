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
    screenX = (SCREENX)-(2*borders);
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
      displayTableData(tableX, tableY, tableWidth, tableHeight);
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
