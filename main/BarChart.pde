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
    barChart.setMinValue(0); // Sets 0 as start of y-axis

    barChart.showValueAxis(true); // Displays y-axis
    barChart.showCategoryAxis(true); // Displays x-axis
    barChart.setBarLabels(labelDisplay);
    barChart.setCategoryAxisLabel(title);

    //Colour
    barChart.setBarColour(#26B6E0); // Light Blue
    barChart.setAxisLabelColour(color(#26B6E0)); // Light Blue
    barChart.setAxisValuesColour(color(#26B6E0)); // Light Blue
    barChart.setBarGap(10); // Sets gap between bars
  }
  void setData(float[] dataDisplay) {
    this.dataDisplay = dataDisplay;
  }

  void byDistanceFrom(String origin) {

    ArrayList<Datapoint> flightsFrom = currentQuery.flightsFrom(origin); // Sorts flights

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
    float[] topDistances = new float[datapoints.length]; // Picks top 5 destinations
    String[] topDestinations = new String[datapoints.length];
    int airportCounter = 0;

    for (int i = 0; i < flightDistance.length && airportCounter < 5; i++) {
      if (! inTopDestinations(flightDestination[i], topDestinations)) {
        topDistances[airportCounter] = flightDistance[i];
        topDestinations[airportCounter] = flightDestination[i];
        airportCounter++;
      }
    }
    topDistances = Arrays.copyOf(topDistances, airportCounter);
    topDestinations = Arrays.copyOf(topDestinations, airportCounter);
    title = "Longest flights from " + origin;
    barChart.setCategoryAxisLabel(title); // Sets title to x-axis
    barChart.setData(topDistances);
    barChart.setBarLabels(topDestinations);
    barChart.setMaxValue(6000); // Max value on y-axis
  }

  void byAirlines() {
    HashMap<String, Integer> flightCountByAirline = new HashMap<>(); // Hashmap gets the flights by each airline
    for (Entry<String, List<Datapoint>> entry : currentQuery.flightsByCarrier.entrySet()) {
      flightCountByAirline.put(entry.getKey(), entry.getValue().size());
    }
    ArrayList<String> flightsByCarrier = new ArrayList<>(flightCountByAirline.keySet()); // Sorts airlines by flight count
    Collections.sort(flightsByCarrier, (item1, item2) -> flightCountByAirline.get(item2) - flightCountByAirline.get(item1));

    int limit = 5;
    float[] topFlightCount = new float[limit];
    String[] topAirlines = new String[limit];

    for (int i = 0; i < limit; i++) {
      String flights = flightsByCarrier.get(i);
      topAirlines[i] = flights;
      topFlightCount[i] = flightCountByAirline.get(flights);
    }
    barChart.setData(topFlightCount);
    barChart.setBarLabels(topAirlines);
    title = "Top Airlines by Number of Flights";
    barChart.setCategoryAxisLabel(title);
    barChart.setMaxValue(200000);

  }


  void byFlightFrom(String origin) {
    HashMap<String, Integer> flightCount = new HashMap<>();
    for (Entry<String, List<Datapoint>> entry : currentQuery.flightsByOrigin.entrySet()) {
      flightCount.put(entry.getKey(), entry.getValue().size());
    }
    ArrayList<String> sortedFlights = new ArrayList<>(flightCount.keySet());
    Collections.sort(sortedFlights, (item1, item2) -> flightCount.get(item2) - flightCount.get(item1));

    int limit = 5;
    float[] topFlightCount = new float[limit];
    String[] topAirports = new String[limit];

    for (int i = 0; i < limit; i++) {
      String airport = sortedFlights.get(i);
      topAirports[i] = airport;
      topFlightCount[i] = flightCount.get(airport);
    }

    barChart.setData(topFlightCount);
    barChart.setBarLabels(topAirports);

    title = "Top Flights from " + origin;
    barChart.setCategoryAxisLabel(title);
    barChart.setMaxValue(40000);
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
    if (button1Clicked == true ||  button2Clicked == true || button3Clicked == true) {
      barChart.draw(300, 50, width - 700, height - 200);
    }
    fill(#26B6E0);
    // textAlign(CENTER, TOP);

    textSize(15);
  }
}
