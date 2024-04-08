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
      displayTableData(tableX, tableY, tableWidth, tableHeight);
      fill(200);
      rect(buttonX + (plusMinusButtonSize - plusMinusButtonSize / 3) / 2+ 1830, plusButtonY + (plusMinusButtonSize / 3) + 80, plusMinusButtonSize / 3+50, plusMinusButtonSize / 3);
      rect(buttonX + (plusMinusButtonSize / 3)+ 1830, plusButtonY + (plusMinusButtonSize - plusMinusButtonSize / 3) / 2 + 80, plusMinusButtonSize / 3, plusMinusButtonSize / 3 + 50);
      fill(200);
      rect(buttonX + (plusMinusButtonSize - plusMinusButtonSize / 3) + 3650 / 2, minusButtonY + plusMinusButtonSize / 3 + 120, plusMinusButtonSize / 3 + 50, plusMinusButtonSize / 3);
      fill(200);
      triangle(arrowX, arrowMargin + buttonHeight, arrowX + buttonWidth / 2, arrowMargin, arrowX + buttonWidth, arrowMargin + buttonHeight);
      fill(200);
      triangle(arrowX, downArrowY, arrowX + buttonWidth / 2, downArrowY + buttonHeight, arrowX + buttonWidth, downArrowY);
      fill(0);
      fill(200);
      triangle(leftArrowX + buttonWidth , horizontalArrowsY , leftArrowX + buttonWidth / 2 , horizontalArrowsY + buttonHeight / 2 , leftArrowX + buttonWidth , horizontalArrowsY + buttonHeight);
      fill(200);
      triangle(rightArrowX, horizontalArrowsY, rightArrowX + buttonWidth / 2, horizontalArrowsY + buttonHeight / 2, rightArrowX, horizontalArrowsY + buttonHeight);
      if (mouse == true){
      } 
      break;

    case 3:
      fill(SCREEN4);
      rect(startX, startY, screenX, screenY);
      break;

    case 4: //Reserved for Bar chart
      fill(SCREEN5);
      theBarChart.draw();
      break;
    }
    textSize(12);
  }
}
