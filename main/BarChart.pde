//Daniel 15/03/24 initialized TheBarChart class
import org.gicentre.utils.stat.*;
// Used from giCentre for template

class TheBarChart {
  BarChart barChart;
  float[] dataDisplay = {0.0};
  String[] labelDisplay = {"sample"};
  String title = "default";

  TheBarChart(BarChart chart) {
    barChart = chart;
    barChart.setData(dataDisplay);
    barChart.setMinValue(0);
    barChart.setMaxValue(6000);

    barChart.showValueAxis(true);
    barChart.showCategoryAxis(true);
    barChart.setBarLabels(labelDisplay);
    barChart.setCategoryAxisLabel(title);

    //Colour
    barChart.setBarColour(#26B6E0); // Light Blue
    barChart.setAxisLabelColour(color(#26B6E0));
    barChart.setAxisValuesColour(color(#26B6E0));
    barChart.setBarGap(10);
  }
  void setData(float[] dataDisplay) {
    this.dataDisplay = dataDisplay;
  }
  
  void byDistanceFrom(String origin) {
    ArrayList<Datapoint> flightsFrom = currentQuery.flightsFrom(origin);
    Collections.sort(flightsFrom, (item2, item1) -> Integer.compare(item1.getDistance(), item2.getDistance()));
    Datapoint[] flights = flightsFrom.toArray(Datapoint[]::new);
    float[] flightDistance = new float[flights.length];
    for (int i = 0; i < flights.length; i++) {
      flightDistance[i] = flights[i].distance;
    }
    String[] flightDestination = new String[flights.length];
    for (int i = 0; i < flights.length; i++) {
      flightDestination[i] = flights[i].dest;
    }
    float[] topDistances = new float[datapoints.length];
    String[] topDestinations = new String[datapoints.length];
    int airportCounter = 0; //Counts airports passed through

    for (int i = 0; i < flightDistance.length && airportCounter < 5; i++) {
      if (! inTopDestinations(flightDestination[i], topDestinations)) {
        topDistances[airportCounter] = flightDistance[i];
        topDestinations[airportCounter] = flightDestination[i];
        airportCounter++;
      }
    }
    topDistances = Arrays.copyOf(topDistances, airportCounter);
    topDestinations = Arrays.copyOf(topDestinations, airportCounter);
    title = "longest flights from " + origin;
    barChart.setCategoryAxisLabel(title);
    barChart.setData(topDistances);
    barChart.setBarLabels(topDestinations);
  }
  
  boolean inTopDestinations(String airport, String[] topDestinations) {
  for (String destination : topDestinations) {
    if (airport.equals(destination)) {
      return true;
    }
  }
  return false;
}
  

  void draw() {
    barChart.draw(300, 50, width - 700, height - 200);

    fill(#26B6E0);
    textAlign(CENTER, TOP);
    textSize(15);
  }
}
