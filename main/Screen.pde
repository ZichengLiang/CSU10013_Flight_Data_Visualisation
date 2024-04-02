// Oliver, 14th March, creation of Screen class
class Screen
{
  int screenType, borders;
  int colourR=100;
  int colourG=50;
  int colourB=50;

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

    screenX = (SCREENX/1.01)-(2*borders);
    screenY = (SCREENX/1.01)-(2*borders);
    //Screen location
    startX = (4*SCREENX/6);//-(borders+screenX/2);
    startY = SCREENY/2;

    screenType=-1;
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
      fill(SCREEN1);
      rect(startX, startY, screenX, screenY);

      break;

    case 1: //Reserved for Pie Chart
      fill(SCREEN2);
      rect(startX, startY, screenX, screenY);

      thePieChart.draw();
      break;

    case 2: // reserved for table
      fill(SCREEN3);
      rect(startX, startY, screenX, screenY);
      map.draw();
      break;

    case 3:
      fill(SCREEN4);
      rect(startX, startY, screenX, screenY);
      displayTableData(tableX, tableY, tableWidth, tableHeight);
      break;

    case 4: //Reserved for Bar chart
      fill(SCREEN5);
      theBarChart.draw();
      break;
      
     default:
     fill(SCREEN6);
     rect(startX, startY, screenX, screenY);
     fill(0);
     textSize(20);
     textAlign(CENTER);
     text("Welcome to our program. \nPlease press one of the side buttons to begin", startX, 50);
    }
    
    fill(0);
    rect(SCREENX-100, SCREENY-500, 200, SCREENY-200);
    textSize(12);
  }
}
