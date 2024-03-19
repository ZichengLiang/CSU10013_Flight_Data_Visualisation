import java.util.Arrays;
import java.util.List;
class Query {
  // TODO: flightsFrom and flightsTo are still interacting directly with datapoints[2000], upgrade them
  // TODO: write more query functions
  // TODO: consider more about the attributes inside this class
  ArrayList<Datapoint> lastQueryList; //not sure about the name??

  Query() {
    List<Datapoint> tempList = Arrays.asList(datapoints); 
    this.lastQueryList = new ArrayList<Datapoint>(tempList);
  }
  
  Query(ArrayList<Datapoint> lastQueryList){
    this.lastQueryList = lastQueryList;
  }

  ArrayList<Datapoint> lateFlights() {
    // Zicheng: 18th March, 21:00
    // lateFlights query function: print all the late flights in the form:
    // <flight code> + <flight date> + <late arrival minutes> + total number of late flights
    // note: it doesn't count a flight late if the late time is less than 10 minutes
    println("these flights are late");
    int count = 0;
    ArrayList lateFlightsList = new ArrayList<Datapoint>();
    Datapoint[] lastQuery = lastQueryList.toArray(Datapoint[]::new); //toArray function returns Objects[]
    
    for (int i = 0; i < lastQuery.length; i++) {
      if (lastQuery[i].isLate() && lastQuery[i].lateArrMinutes >= 10) {
        count++;
        lateFlightsList.add(lastQuery[i]);
        print( count + "> " + lastQuery[i].flightCode + " at " + lastQuery[i].flightDate + " is late by " );
        lastQuery[i].printDuration(lastQuery[i].lateArrMinutes);
      }
    }
    println("There are " + count + " late flights out of " + datapoints.length + " flights, the delay rate is " +  100 * (double) count/datapoints.length + "%" );
    return lateFlightsList;
  }

  ArrayList<Datapoint> lateFlights(ArrayList<Datapoint> lastQueryList) {
    // Zicheng: 18th March, 19:00
    // overload method for cross-query, pass in an arraylist and it will search through the passed array
    // lateFlights query function: print all the late flights in the form:
    // <flight code> + <flight date> + <late arrival minutes> + total number of late flights
    // note: it doesn't count a flight late if the late time is less than 10 minutes
    ArrayList<Datapoint> lateFlightsList = new ArrayList<Datapoint>();
    Datapoint[] lastQuery = lastQueryList.toArray(Datapoint[]::new); 

    println("these flights are late");
    int count = 0;
    for (int i = 0; i < lastQuery.length; i++) {
      if (lastQuery[i].isLate() && lastQuery[i].lateArrMinutes >= 10) {
        count++;
        lateFlightsList.add(lastQuery[i]);
        print( count + "> " + lastQuery[i].flightCode + " at " + lastQuery[i].flightDate + " is late by " );
        lastQuery[i].printDuration(lastQuery[i].lateArrMinutes);
      }
    }
    println("There are " + count + " late flights out of " + lastQuery.length + " flights, the delay rate is " +  100 * (double) count/lastQuery.length + "%" );
    return lateFlightsList;
  }

  ArrayList<Datapoint> flightsFrom(String airportCode) {
    // queries function: print all the flights going to passed airport code
    int count = 0;
    String cityName = " ";
    ArrayList<Datapoint> flightsFromList = new ArrayList<Datapoint>();

    println("these flights fly from " + airportCode);
    for (int i = 0; i < datapoints.length; i++) {
      if (datapoints[i].originIs(airportCode)) {
        count++;
        flightsFromList.add(datapoints[i]);
        println(count + "> " + datapoints[i].flightCode + " on " + datapoints[i].flightDate + " to " + datapoints[i].combinedDestCityName);
        cityName = datapoints[i].combinedOriginCityName;
      }
    }
    // print the summary
    if (count == 0) {
      println("there is no such record!");
    } else {
      println("there are " + count + " flights departed from " + airportCode + " airport in " + cityName);
    }
    return flightsFromList;
  }

  ArrayList<Datapoint> flightsTo(String airportCode) {
    // queries function: print all the flights going to passed airport code
    int count = 0;
    String cityName = " ";
    ArrayList<Datapoint> flightsToList = new ArrayList<Datapoint>();
    println("these flights fly to " + airportCode);
    for (int i = 0; i < datapoints.length; i++) {
      if (datapoints[i].destIs(airportCode)) {
        count++;
        flightsToList.add(datapoints[i]);
        println(count + "> " + datapoints[i].flightCode + " on " + datapoints[i].flightDate + " from " + datapoints[i].combinedOriginCityName);
        cityName = datapoints[i].combinedDestCityName;
      }
    }
    // print the summary
    if (count == 0) {
      println("there is no such record!");
    } else {
      println("there are " + count + " flights fly to " + airportCode + " airport which is in " + cityName);
    }

    return flightsToList;
  }
}