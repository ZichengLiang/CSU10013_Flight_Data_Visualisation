// Zicheng, 12th March, 18:00: created the Datapoint class;
class Datapoint{
    
    // Zicheng, 12th March, 18:00: fields added according to the .csv files;
    int  flightDate, flightNumber, originWac, destWac, distance;
    int  CRSDepTime, depTime, CRSArrTime, arrTime;
    String carrierCode, flightCode, origin, originCityNamePart1, originCityNamePart2, originState, dest, destCityNamePart1, destCityNamePart2, destState;
    int cancelled, diverted, lateDepMinutes, lateArrMinutes;
    String combinedOriginCityName;
    
    // Zicheng, 12th March, 21:00: a constructor with all parameters;
    public Datapoint(String[] pieces){
      flightDate = int (pieces[0]);
      carrierCode = pieces[1]; 
      flightNumber = int (pieces[2]);
      origin = pieces[3];  
      originCityNamePart1 = pieces[4];
      originCityNamePart2 = pieces[5];
      originState = pieces[6];
      combinedOriginCityName = originCityNamePart1+originCityNamePart2;
      originWac = int(pieces[7]);
      dest = pieces[8];
      destCityNamePart1 = pieces[9];
      destCityNamePart2 = pieces[10];
      destState = pieces[11]; 
      destWac = int (pieces[12]);
      CRSDepTime = int (pieces[13]);
      depTime = int (pieces[14]);
      CRSArrTime = int (pieces[15]);
      arrTime = int (pieces[16]); 
      cancelled = int (pieces[17]);
      diverted = int (pieces[18]); 
      distance = int (pieces[19]);
      
      //Oliver 14th March, 16:15: Fixing raised issue
      flightCode = carrierCode + flightNumber;
      lateDepMinutes = depTime - CRSDepTime;
      lateArrMinutes = arrTime - CRSArrTime;
    }
  }
