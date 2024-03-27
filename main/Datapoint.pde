// Aryan, Friday 22nd March: imported the following java.time package
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Locale;
import java.time.ZoneId;
import java.util.HashMap;

// Zicheng, 12th March, 18:00: created the Datapoint class;
class Datapoint {
    // Zicheng, 12th March, 18:00: fields added according to the .csv files;

    // flight date infos
    String flightDate, flightDay, flightMonth;
    // flight code infos
    String carrierCode;
    int flightNumber;
    String flightCode;
    // flight origin & destination infos
    String origin, originCityNamePart1, originCityNamePart2, originState;
    int originWac;
    String dest, destCityNamePart1, destCityNamePart2, destState;
    int destWac;
    // flight delay and duration infos
    int CRSDepTime, depTime, CRSArrTime, arrTime;
    int cancelled, diverted;
    // flight distance;
    int distance;

    String combinedOriginCityName, combinedDestCityName;
    int lateDepMinutes, lateArrMinutes, plannedFlightDuration, actualFlightDuration;

    // Zicheng, 12th March, 21:00: a constructor with all parameters;
  public Datapoint(String[] pieces) {
    flightDate = pieces[0];
    char[] flightDateEdit = flightDate.toCharArray();
    for (int i = 0; i < 6; i++) {
        flightDateEdit = shorten(flightDateEdit);
    }
    flightDate = new String(flightDateEdit);

    carrierCode = pieces[1];
    System.out.println("Flight number string: " + pieces[2]);
    if (!pieces[2].isEmpty()) { // Check if flight number is not empty
        flightNumber = int(pieces[2]);
    } else {
        // Handle the case when flight number is empty
        flightNumber = 0; // assigning 0 as a default value
    }
    flightCode = carrierCode + flightNumber;

    origin = pieces[3];
    originCityNamePart1 = pieces[4];
    originCityNamePart2 = pieces[5];
    originState = pieces[6];
    combinedOriginCityName = originCityNamePart1 + "," + originCityNamePart2;
    combinedOriginCityName = removeQuotationMarks(combinedOriginCityName);
    originWac = Integer.parseInt(pieces[7]);

    dest = pieces[8];
    destCityNamePart1 = pieces[9];
    destCityNamePart2 = pieces[10];
    combinedDestCityName = destCityNamePart1 + "," + destCityNamePart2;
    combinedDestCityName = removeQuotationMarks(combinedDestCityName);
    destState = pieces[11];
    destWac = Integer.parseInt(pieces[12]);

    CRSDepTime = Integer.parseInt(pieces[13]);
    depTime = int(pieces[14]);
    CRSArrTime = Integer.parseInt(pieces[15]);
    arrTime = int(pieces[16]);

    cancelled = Integer.parseInt(pieces[17]);
    diverted = Integer.parseInt(pieces[18]);

    distance = Integer.parseInt(pieces[19]);

    lateDepMinutes = getDuration(CRSDepTime, depTime);
    lateArrMinutes = getDuration(CRSArrTime, arrTime);
    plannedFlightDuration = getDuration(CRSDepTime, CRSArrTime);
    actualFlightDuration = getDuration(depTime, arrTime);
}


    int getDistance() {
        return distance;
    }

    boolean carrierCodeIs(String input) {
        return input.equalsIgnoreCase(carrierCode);
    }

    boolean flightCodeIs(String input) {
        return input.equalsIgnoreCase(flightCode);
    }

    boolean originIs(String input) {
        return input.equalsIgnoreCase(origin);
    }

    boolean originStateIs(String input) {
        return input.equalsIgnoreCase(originState);
    }

    boolean originWacIs(int input) {
        return input == originWac;
    }

    boolean destIs(String input) {
        return input.equalsIgnoreCase(dest);
    }

    boolean destStateIs(String input) {
        return input.equalsIgnoreCase(destState);
    }

    boolean destWacIs(int input) {
        return input == destWac;
    }

    boolean cancelled() {
        return cancelled == 1;
    }

    boolean isDiverted() {
        return diverted == 1;
    }

    boolean departsLate() {
        return (lateDepMinutes >= 0);
    }

    boolean departsLate(int minutes) {
        return (lateDepMinutes >= minutes);
    }

    boolean arrivesLate() {
        return (lateArrMinutes >= 0);
    }

    boolean arrivesLate(int minutes) {
        return (lateArrMinutes >= minutes);
    }

    boolean isLate() {
        return (lateDepMinutes >= 0 || lateArrMinutes >= 0) && (cancelled == 0);
    }

    int getMinutes(int time) {
        int hours = time / 100;
        int minutes = time - 100 * hours;
        return hours * 60 + minutes;
    }

    int getDuration(int start, int end) {
        int duration;
        if (start < end) {
            duration = getMinutes(end) - getMinutes(start);
        } else {
            duration = (getMinutes(end) + 24 * 60) - getMinutes(start);
        }
        return duration;
    }

    void printDuration(int duration) {
        int hours = duration / 60;
        int minutes = duration % 60;
        System.out.println(hours + " hours and " + minutes + " minutes.");
    }

    String removeQuotationMarks(String input) {
        char[] process = input.toCharArray();
        shorten(process);
        String output = new String(process, 1, process.length - 2);
        return output;
    }

    private char[] shorten(char[] array) {
        return array;
    }

    private final DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormatter.ofPattern("MM/dd/yyyy HHmm", Locale.US);

    public String getOriginTimezone() {
        if (AirportTimezones.airportTimezones.containsKey(origin)) {
            return AirportTimezones.airportTimezones.get(origin);
        } else {
            return "UTC";
        }
    }

    public String getDestinationTimezone() {
        if (AirportTimezones.airportTimezones.containsKey(dest)) {
            return AirportTimezones.airportTimezones.get(dest);
        } else {
            return "UTC";
        }
    }
}
