// Zicheng, 12th March, 18:00: created the Datapoint class;
class Datapoint{
  
  // Zicheng, 12th March, 18:00: fields added according to the .csv files;
  int  flightDate, flightNumber, originWac, destWac, distance;
  int  CRSDepTime, depTime, CRSArrTime, arrTime;
  String carrierCode, origin, originCityName, originState, dest, destCityName, destState;
  boolean cancelled, diverted;
  
  // Zicheng, 12th March, 18:00: a constructor with all parameters;
  Datapoint(int flightDate, String carrierCode, int flightNumber, 
            String origin, String originCityName, String originState, int originWac,
            String dest, String destCityName, String destState, int destWac,
            int CRSDepTime, int depTime, int CRSArrTime, int arrTime, 
            boolean cancelled, boolean diverted, 
            int distance)
            {
              this.flightDate = flightDate; this.carrierCode = carrierCode; this.flightNumber = flightNumber;
              this.origin = origin; this.originCityName = originCityName; this.originState = originState; this.originWac = originWac;
              this.dest = dest; this.destCityName = destCityName; this.destState = destState; this.destWac = destWac;
              this.CRSDepTime = CRSDepTime; this.depTime = depTime; this.CRSArrTime = CRSArrTime; this.arrTime = arrTime;
              this.cancelled = cancelled; this.diverted = diverted;
              this.distance = distance;
            }
}
