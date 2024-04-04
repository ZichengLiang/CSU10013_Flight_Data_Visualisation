/*
 Aryan: 20th March
 added 3 more queries namely divertedFlights, flightsByCarrier and flightsOnDate
 divertedFlights help show the number of diverted flights from a particular airport
 flightsByCarrier help show the details of flights from a particular carrier including the summary
 flightsOnDate help show the number of flights on a particular date
 */
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
class Query {
  // TODO: write more query functions
  ArrayList<Datapoint> lastQueryList;
  String name;

  // Constructors: default constructor search within the whole set
  Query() {
    List<Datapoint> tempList = Arrays.asList(datapoints);
    this.lastQueryList = new ArrayList<Datapoint>(tempList);
    name = "whole data set";
  }
  // this constructor takes in one ArrayList and search within the given set
  Query(ArrayList<Datapoint> lastQueryList, String name) {
    this.lastQueryList = lastQueryList;
    this.name = name;
  }
  /*
   methods list:
   ArrayList<Datapoint> flightsFrom(String airportCode); ArrayList<Datapoint> flightsFrom(int originWac);
   ArrayList<Datapoint> flightsTo(String airportCode); ArrayList<Datapoint> flightsTo(int destWac);
   ArrayList<Datapoint> flightRoute(String origin, String dest);
   ArrayList<Datapoint> lateFlights();
   ArrayList<Datapoint> divertedFlights();
   ArrayList<Datapoint> flightsByCarrier(String carrierCode);
   ArrayList<Datapoint> flightsOnDate(String date);
   
   String GetReport(ArrayList<Datapoint> inputList, int TYPE);
   */
  ArrayList<Datapoint> flightsFrom(String airportCode) {
    // queries function: print all the flights going to passed airport code
    ArrayList<Datapoint> flightsFromList = new ArrayList<Datapoint>(lastQueryList.stream()
      .filter(datapoint -> datapoint.originIs(airportCode))
      .collect(Collectors.toList()));

    println(getReport(flightsFromList, FLIGHTS_FROM));
    return flightsFromList;
  }

  ArrayList<Datapoint> flightsFrom(int originWac) {
    //Zicheng, 20th March, 22:00: a new way to get the sorted ArrayList:
    // you can copy & paste codes in /*...*/, but remember to change the name of new^List and conditionFunction()
    // (an "auto-reminder" is implemented ^w^~)
    // when naming the returned ArrayList, please name it as <functionNameList>, it is easier to explore the class
    /*
     ArrayList<Datapoint> functionName^List = new ArrayList<Datapoint>(lastQueryList.stream()
     .filter(datapoint -> datapoint.conditionFunction())
     .collect(Collectors.toList()));
     */

    ArrayList<Datapoint> flightsFromList = new ArrayList<Datapoint>(lastQueryList.stream()
      .filter(datapoint -> datapoint.originWacIs(originWac))
      .collect(Collectors.toList()));

    println(getReport(flightsFromList, FLIGHTS_FROM));
    return flightsFromList;
  }

  ArrayList<Datapoint> flightsTo(int destWac) {
    // queries function: print all the flights going to passed airport code
    ArrayList<Datapoint> flightsToList = new ArrayList<Datapoint>(lastQueryList.stream()
      .filter(datapoint -> datapoint.destWacIs(destWac))
      .collect(Collectors.toList()));

    println(getReport(flightsToList, FLIGHTS_TO));
    return flightsToList;
  }

  ArrayList<Datapoint> flightRoute(String origin, String dest) {
    ArrayList<Datapoint> flightRoute = new ArrayList<Datapoint> (lastQueryList.stream()
      .filter(datapoint -> datapoint.originIs(origin)).filter(datapoint -> datapoint.destIs(dest))
      .collect(Collectors.toList()));

    println(getReport(flightRoute, FLIGHT_ROUTE));

    return flightRoute;
  }

  ArrayList<Datapoint> lateFlights() {
    // Zicheng: 18th March, 21:00
    // lateFlights query function: print all the late flights in the form:
    // <flight code> + <flight date> + <late arrival minutes> + total number of late flights
    // note: it doesn't count a flight late if the late time is less than 10 minutes
    ArrayList<Datapoint> lateFlightsList = new ArrayList<Datapoint>(lastQueryList.stream()
      .filter(datapoint -> datapoint.isLate())
      .collect(Collectors.toList()));

    println(getReport(lateFlightsList, LATE_FLIGHTS));
    return lateFlightsList;
  }


  // This is for displaying diverted flights
  ArrayList<Datapoint> divertedFlights() {
    ArrayList<Datapoint> divertedFlightsList = new ArrayList<Datapoint>(lastQueryList.stream()
      .filter(datapoint -> datapoint.isDiverted())
      .collect(Collectors.toList()));

    println(getReport(divertedFlightsList, DIVERTED_FLIGHTS));
    return divertedFlightsList;
  }

  // This is for displaying cancelled flights
  ArrayList<Datapoint> cancelledFlights() {
    ArrayList<Datapoint> cancelledFlightsList = new ArrayList<Datapoint>();
    Datapoint[] lastQuery = lastQueryList.toArray(new Datapoint[0]);

    println("These flights are calcelled:");
    for (int i = 0; i < lastQuery.length; i++) {
      if (lastQuery[i].isCancelled()) {
        cancelledFlightsList.add(lastQuery[i]);
        println(cancelledFlightsList.size() + "> " + lastQuery[i].flightCode + " on " + lastQuery[i].flightDate + " is cancelled.");
      }
    }
    println("There are " + cancelledFlightsList.size() + " diverted flights out of " + lastQuery.length + " flights.");
    return cancelledFlightsList;
  }



  ArrayList<Datapoint> flightsTo(String airportCode) {
    // queries function: print all the flights going to passed airport code
    ArrayList<Datapoint> flightsToList = new ArrayList<Datapoint>(lastQueryList.stream()
      .filter(datapoint -> datapoint.destIs(airportCode))
      .collect(Collectors.toList()));

    println(getReport(flightsToList, FLIGHTS_TO));
    return flightsToList;
  }

  // This is for flights by particular carrier
  ArrayList<Datapoint> flightsByCarrier(String carrierCode) {
    ArrayList<Datapoint> flightsByCarrierList = new ArrayList<Datapoint>(lastQueryList.stream()
      .filter(datapoint -> datapoint.carrierCodeIs(carrierCode))
      .collect(Collectors.toList()));

    println(getReport(flightsByCarrierList, FLIGHTS_BY_CARRIER));

    return flightsByCarrierList;
  }
  ArrayList<Datapoint> flightsOnDate(String date) {
    ArrayList<Datapoint> flightsList = new ArrayList<Datapoint>();
    for (Datapoint datapoint : lastQueryList) {
      if (datapoint.flightDate.trim().equals(date.trim())) {
        flightsList.add(datapoint);
      }
    }

    println(getReport(flightsList, FLIGHTS_ON_DATE));
    return flightsList;
  }

  String getReport(ArrayList<Datapoint> inputList, int type) {
    if (inputList.isEmpty()) {
      return ("Sorry, there is no such flight!");
    } else if (type < 0 || type > 6) { // 6 is the last number of supported query function
      return ("Sorry, we cannot make such query now!");
    } else {
      StringBuilder report = new StringBuilder();
      // the for loop generates each-line information, example:
      // 1> Flight Code: AA1, Date: 01/01/2022, Origin: JFK in New York, NY, Destination: LAX in Los Angeles, CA, the flight distance is 2475 miles.
      for (int i = 0; i < inputList.size(); i++) {
        Datapoint flight = inputList.get(i);
        report.append(i+1)
          .append("> Flight Code: ").append(flight.flightCode)
          .append(", Date: ").append(flight.flightDate)
          .append(", Origin: ").append(flight.origin)
          .append(" in ").append(flight.combinedOriginCityName)
          .append(", Destination: ").append(flight.dest)
          .append(" in ").append(flight.combinedDestCityName)
          .append(", the flight distance is ").append(flight.distance).append(" miles")
          .append("\n");
      } // for loop ends

      switch(type) {
      case FLIGHTS_FROM:
        // the report header
        report.insert(0, ":\n")
          .insert(0, inputList.get(0).originWac).insert(0, " where the WAC is ")
          .insert(0, inputList.get(0).origin).insert(0, "These flights fly from ");
        // the report tail
        report.append(inputList.size())
          .append(" flights depart from ").append(inputList.get(0).origin);
        break;

      case FLIGHTS_TO:
        report.insert(0, ":\n")
          .insert(0, inputList.get(0).destWac).insert(0, " where the WAC is ")
          .insert(0, inputList.get(0).dest).insert(0, "These flights fly to ");
        report.append(inputList.size())
          .append(" flights arrive at").append(inputList.get(0).dest);
        break;

      case DIVERTED_FLIGHTS:
        report.insert(0, ":\n").insert(0, "These flights are diverted");
        report.append(inputList.size()).append(" flights are diverted.");
        break;

      case FLIGHTS_BY_CARRIER:
        report.insert(0, ":\n")
          .insert(0, inputList.get(0).getCarrierCode()).insert(0, "These flights are operated by carrier");
        report.append("Totally, there are ").append(inputList.size())
          .append(" flights operated by carrier ").append(inputList.get(0).carrierCode);
        break;

      case FLIGHTS_ON_DATE:
        report.insert(0, ":\n")
          .insert(0, inputList.get(0).getFlightDate()).insert(0, "These flights are found on date");
        report.append(inputList.size()).append(" flights are on date").append(inputList.get(0).getFlightDate());
        break;

      case LATE_FLIGHTS:
        report.insert(0, ":\n").insert(0, "These flights are late (more than 10 minutes)");
        report.append(inputList.size()).append(" flights are late (more than 10 minutes).");
        break;

      case FLIGHT_ROUTE:
        report.insert(0, ":\n");
        report.append("Totally, there are ").append(inputList.size())
          .append(" flights fly from ").append(inputList.get(0).getOrigin())
          .append(" to ").append(inputList.get(0).getDest());
        break;
      }//switch ends

      return report.toString();
    }
  } // getReport ends
}
