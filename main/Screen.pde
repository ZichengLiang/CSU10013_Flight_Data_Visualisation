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

      fill(255);
      textSize(20);
      textAlign(RIGHT);
      text("This is Team 9, welcome to our program ! \nPlease press one of the side buttons to begin", startX, 100);
      // Zicheng: 4th April, addded the insights using query functions
      textAlign(LEFT);
      text("Insights: Among " + currentQuery.getArrayList().size() + " flights in the current query: " + currentQuery.name, screenX/4, 200);
      ArrayList<Datapoint> longestFlights = currentQuery.sortByDistance();
      textAlign(LEFT);
      text("* The longest flight goes from " + longestFlights.get(0).combinedOriginCityName
        + " to " + longestFlights.get(0).combinedDestCityName
        + "\n its flight distance is " + longestFlights.get(0).distance + " miles.", screenX/4, 250); // y position = 250

      textAlign(LEFT);
      text("* The busiest carrier company is " + currentQuery.busiestAirline()
        + " which operates " + currentQuery.flightsByCarrier.get(currentQuery.busiestAirline()).size() + " airlines .", screenX/4, 320); // y position = 320

      textAlign(LEFT);
      text("* The busiest airport (by departure) is " + currentQuery.busiestDeptAirport()
        + "\n from where " + currentQuery.flightsByOrigin.get(currentQuery.busiestDeptAirport()).size() + " flights depart.", screenX/4, 360); // y position = 360

      textAlign(LEFT);
      text("* The busiest airport (by arrival) is " + currentQuery.busiestArrAirport()
        + "\n where " + currentQuery.flightsByDestination.get(currentQuery.busiestArrAirport()).size() + " flights arrive.", screenX/4, 420); // y position = 400

      break;

    case 1: //Reserved for Pie Chart
      fill(SCREEN2);
      rect(startX, startY, screenX, screenY);
      //thePieChart.getAbnormalFlights(currentQuery);
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
    rect(SCREENX-100, SCREENY-500, 200, SCREENY-200);
    textSize(12);
  }
}
