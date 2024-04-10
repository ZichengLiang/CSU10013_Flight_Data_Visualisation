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
  
  MapLegend[] mapLegend;


  // Main Screen
  Screen()
  {
    //Screen area

    screenX = (SCREENX/1.01)-(2*borders);
    screenY = (SCREENX/1.01)-(2*borders);
    //Screen location
    startX = (4*SCREENX/6);//-(borders+screenX/2);
    startY = SCREENY/2;

    screenType=0;
    borders = 15;
    
    //Oliver April 10th: Creation of Legend for map
    mapLegend = new MapLegend[5];
    init_legend(mapLegend);
  }

  // Graph Screen Type A
  //  Screen(int dataA, int dataB, int dataC)
  //  {
  //   this();
  //    screenType=2;
  //  }

  // Drawing of screen
  void draw() {
    horizontalButtons = (screenType == 4); // Draws horizontal buttons if Bar Chart button pressed
    switch(screenType)
    {
    case 0:
      fill(SCREEN1);
      rect(startX, startY, screenX, screenY);

      fill(255);
      textSize(20);
      // textAlign(RIGHT);
      text("This is Team 9, welcome to our program ! \nPlease press one of the side buttons to begin", (screenX/4) + 50, 100);
      // Zicheng: 4th April, addded the insights using query functions
      //textAlign(LEFT);
      text("Insights: Among " + currentQuery.getArrayList().size() + " flights in the current query: " + currentQuery.name, screenX/4 - 50, 200);
      ArrayList<Datapoint> longestFlights = currentQuery.sortByDistance();
      //textAlign(LEFT);
      text("* The longest flight goes from " + longestFlights.get(0).combinedOriginCityName
        + " to " + longestFlights.get(0).combinedDestCityName
        + "\n its flight distance is " + longestFlights.get(0).distance + " miles.", (screenX/4) - 50, 250); // y position = 250

      // textAlign(LEFT);
      text("* The busiest carrier company is " + currentQuery.busiestAirline()
        + " which operates " + currentQuery.flightsByCarrier.get(currentQuery.busiestAirline()).size() + " airlines .", (screenX/4) - 50, 320); // y position = 320

      //  textAlign(LEFT);
      text("* The busiest airport (by departure) is " + currentQuery.busiestDeptAirport()
        + "\n from where " + currentQuery.flightsByOrigin.get(currentQuery.busiestDeptAirport()).size() + " flights depart.", (screenX/4) - 50, 360); // y position = 360

      // textAlign(LEFT);
      // text("* The busiest airport (by arrival) is " + currentQuery.busiestArrAirport()
      //   + "\n where " + currentQuery.flightsByDestination.get(currentQuery.busiestArrAirport()).size() + " flights arrive.", screenX/4, 420); // y position = 400

      // textAlign(LEFT);
      Date queryDate = new Date(122, 0, dateSlider.getUserInput());
      text("* There are "
        + currentQuery.flightsAfterDate(queryDate)
        + " flights \n  after the date "  + queryDate, (screenX/4) - 50, 420); // y position = 420

      break;

    case 1: //Reserved for Pie Chart
      fill(SCREEN2);
      rect(startX, startY, screenX, screenY);
      thePieChart.draw();
      break;

    case 2: // reserved for table
      map.renewMap(currentQuery.getArrayList());
      //Create background
      fill(SCREEN3);
      rect(startX, startY, screenX, screenY);

      
      //Create Legend
      fill(255);
      rect(startX, SCREENY/8, screenX, SCREENY/4);
      for(int i=0; i<mapLegend.length;i++)
      {
        mapLegend[i].draw();
      }
      map.draw();

      break;

    case 3:
      fill(SCREEN4);
      rect(startX, startY, screenX, screenY);
      displayTableData(tableX, tableY, tableWidth, tableHeight);
      
      fill(200);
      rect(0, 0, screenX/2.9 + 3, 2500);
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

    case 4: // Reserved for Bar chart
      fill(#F7C242);
      rect(startX, startY, screenX, screenY);
      theBarChart.draw();
      break;

    default:
      fill(SCREEN6);
      rect(startX, startY, screenX, screenY);
      fill(0);
      textSize(20);
      textAlign(CENTER);
      text("Welcome to our program. \nPlease press one of the side buttons to begin", SCREENX / 2, 50);
    }

    fill(#BC3D3D); // Redish
    rect(SCREENX-100, SCREENY-500, 200, SCREENY-100);
    
    //adds title to filter
    fill(0);
    text("Filter",SCREENX-190, 20);
    
    textSize(12);
  }
  
  void init_legend(MapLegend[] array)
{
  colorMode(RGB, 10000);
  
  for(int i=0; i<array.length; i++)
  {
    array[i] = new MapLegend((startX-(screenX/2))+i*(startX/array.length)+20,
    color(i*(10000/array.length),0,2500), i*(10000/array.length)+"+");
  }
  
  colorMode(RGB, 255);
}

}
