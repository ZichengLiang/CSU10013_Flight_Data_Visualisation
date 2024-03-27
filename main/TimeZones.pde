 static class AirportTimezones {
        // Define a map to store airport codes and their corresponding timezones
        static final HashMap<String, String> airportTimezones = new HashMap<>();

        // Static initializer block to populate the map
        static {
            // Populate the map with airport codes and their timezones
            airportTimezones.put("JFK", "America/New_York");  // Example: JFK airport in New York
            airportTimezones.put("LAX", "America/Los_Angeles");  // Example: LAX airport in Los Angeles
            // Add more airport codes and timezones as needed
        }
    }
    

void getFlightSummary(String airlineCode, int flightNumber) {
    // Iterate through the datapoints and find the matching flight
    for (Datapoint flight : datapoints) {
        // Check if the flight number and airline code match
        if (flight.carrierCodeIs(airlineCode) && flight.flightNumber == flightNumber) {
            // Calculate the planned flight time
            int plannedDepartureTime = flight.CRSDepTime;
            int plannedArrivalTime = flight.CRSArrTime;
            int plannedFlightTime = plannedArrivalTime - plannedDepartureTime;

            // Calculate the actual flight time
            int actualDepartureTime = flight.depTime;
            int actualArrivalTime = flight.arrTime;
            int actualFlightTime = actualArrivalTime - actualDepartureTime;

            // Convert flight times to hours and minutes
            int plannedHours = plannedFlightTime / 100;
            int plannedMinutes = plannedFlightTime % 100;
            int actualHours = actualFlightTime / 100;
            int actualMinutes = actualFlightTime % 100;

            // Print the flight summary
            System.out.println("Flight " + airlineCode + flightNumber +
                               " had a planned flight time of " +
                               plannedHours + " hours and " +
                               plannedMinutes + " minutes " +
                               "but the actual flight time was \n " +
                               actualHours + " hours and " +
                               actualMinutes + " minutes.");

            // Exit the loop since we found the matching flight
            return;
        }
    }
    // Print a message if the flight is not found
    System.out.println("Flight not found for airline: " + airlineCode + ", flight number: " + flightNumber);
}


String getTimeString(int minutes) {
    int hours = minutes / 60;
    int mins = minutes % 60;
    return String.format("%d:%02d", hours, mins);
}

Datapoint findFlightByNumber(String flightNumber) {
    // Iterate through the datapoints array to find the flight with the given number
    for (Datapoint flight : datapoints) {
        if (flight.flightNumber==int((flightNumber))) {
            return flight;
        }
    }
    return null; // Flight not found
}
