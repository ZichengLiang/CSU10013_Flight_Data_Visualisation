// Aryan, Friday 22nd March: imported the following java.time package
import java.time.*;
import java.util.*;

// Zicheng, 12th March, 18:00: created the Datapoint class;
class Datapoint {
  // Zicheng, 12th March, 18:00: fields added according to the .csv files;
  // Zicheng: 6th April, fixed the date function and connected it to the text display
  // flight date infos
  Date flightDate;
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
  SimpleDateFormat dateFormat = new SimpleDateFormat ("MM/dd/yyyy HH:mm");

  // Zicheng, 12th March, 21:00: a constructor with all parameters;
  public Datapoint(String[] pieces) {

    SimpleDateFormat dateFormat = new SimpleDateFormat ("MM/dd/yyyy HH:mm");
    String flightDateOrg = pieces[0];
    try {
      flightDate = dateFormat.parse(flightDateOrg);
    }
    catch (ParseException e) {
      System.out.println("Unparseable using " + dateFormat);
    }

    carrierCode = pieces[1];
    flightNumber = int (pieces[2]);
    flightCode = carrierCode + flightNumber;

    origin = pieces[3];
    originCityNamePart1 = pieces[4];
    originCityNamePart2 = pieces[5];
    originState = pieces[6];
    combinedOriginCityName = originCityNamePart1 + "," + originCityNamePart2;
    combinedOriginCityName = removeQuotationMarks(combinedOriginCityName);
    originWac = int(pieces[7]);

    dest = pieces[8];
    destCityNamePart1 = pieces[9];
    destCityNamePart2 = pieces[10];
    combinedDestCityName = destCityNamePart1 + "," + destCityNamePart2;
    combinedDestCityName = removeQuotationMarks(combinedDestCityName);
    destState = pieces[11];
    destWac = int (pieces[12]);

    CRSDepTime = int (pieces[13]);
    depTime = int (pieces[14]);
    CRSArrTime = int (pieces[15]);
    arrTime = int (pieces[16]);

    cancelled = int (pieces[17]);
    diverted = int (pieces[18]);

    distance = int (pieces[19]);

    lateDepMinutes = getDuration(CRSDepTime, depTime);
    lateArrMinutes = getDuration(CRSArrTime, arrTime);
    plannedFlightDuration = getDuration(CRSDepTime, CRSArrTime);
    actualFlightDuration = getDuration(depTime, arrTime);
  }

  public Date getFlightDate() {
    return flightDate;
  }

  public String getCarrierCode() {
    return carrierCode;
  }

  public int getFlightNumber() {
    return flightNumber;
  }

  public String getFlightCode() {
    return flightCode;
  }

  public String getOrigin() {
    return origin;
  }

  public String getOriginState() {
    return originState;
  }

  public int getOriginWac() {
    return originWac;
  }

  public String getDest() {
    return dest;
  }

  public String getDestState() {
    return destState;
  }

  public int getDestWac() {
    return destWac;
  }

  public int getCRSDepTime() {
    return CRSDepTime;
  }

  public int getDepTime() {
    return depTime;
  }

  public int getCRSArrTime() {
    return CRSArrTime;
  }

  public int getArrTime() {
    return arrTime;
  }

  public int getCancelled() {
    return  cancelled;
  }

  public int getDiverted() {
    return  diverted;
  }

  public int getDistance() {
    return distance;
  }

  public String getCombinedOriginCityName() {
    return combinedOriginCityName;
  }

  public String getCombinedDestCityName() {
    return combinedDestCityName;
  }

  public int getLateDepMinutes() {
    return lateDepMinutes;
  }

  public int getLateArrMinutes() {
    return lateArrMinutes;
  }

  public int getPlannedFlightDuration() {
    return plannedFlightDuration;
  }

  public int getActualFlightDuration() {
    return actualFlightDuration;
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

  boolean isCancelled() {
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

  int getDuration (int start, int end) {
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
    println(hours + " hours and " + minutes + " minutes.");
  }

  String removeQuotationMarks(String input) {
    char[] process = input.toCharArray();
    shorten(process);
    String output = new String(process, 1, process.length-2);
    return output;
  }

  //private final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatter.ofPattern("MM/dd/yyyy HHmm", Locale.US);

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

  private char[] shorten(char[] array) {
    return array;
  }
}
