// Zicheng, 12th March, 18:00: created the Datapoint class;
class Datapoint{
    
    // Zicheng, 12th March, 18:00: fields added according to the .csv files;
    
    // flight date infos
    String flightDate, flightDay, flightMonth;
    // flight code infos
    String carrierCode; int  flightNumber; String flightCode;
    // flight origin & destination infos
    String origin, originCityNamePart1, originCityNamePart2, originState; int originWac;
    String dest, destCityNamePart1, destCityNamePart2, destState; int destWac;
    // flight delay and duration infos
    int  CRSDepTime, depTime, CRSArrTime, arrTime;
    int cancelled, diverted;
    // flight distance;
    int distance;
    
    String combinedOriginCityName, combinedDestCityName;
    int lateDepMinutes, lateArrMinutes, plannedFlightDuration, actualFlightDuration;
    
    // Zicheng, 12th March, 21:00: a constructor with all parameters;
     public Datapoint(String[] pieces){
      flightDate = pieces[0];
      char[] flightDateEdit = flightDate.toCharArray();
      for(int i = 0; i < 6; i++){
      flightDateEdit = shorten(flightDateEdit);
      }
      flightDate = new String(flightDateEdit);
      //TODO: get out flightDay and flightMonth
      // flightDay = new String(flightDateEdit, 0, 1); // String(data, offset, length), it doesn't work when length == 2, why??
      // flightMonth = new String(flightDateEdit, 4, 1); // this doesn't work either! ArrayIndexOutOfBound exception
      
      
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
    
    boolean carrierCodeIs(String input){
      return input.equalsIgnoreCase(carrierCode);
    }
    
    boolean flightCodeIs(String input){
      return input.equalsIgnoreCase(flightCode);
    }
    
    boolean originIs(String input){
      return input.equalsIgnoreCase(origin);
    }
    
    boolean originStateIs(String input){
      return input.equalsIgnoreCase(originState);
    }
    
    boolean originWacIs(int input){
      return input == originWac;
    }
    
    boolean destIs(String input){
      return input.equalsIgnoreCase(dest);
    }
    
    boolean destStateIs(String input){
      return input.equalsIgnoreCase(destState);
    }
    
    boolean destWacIs(int input){
      return input == destWac;
    }
    
    boolean cancelled(){
      return cancelled == 1;
    }
    
    boolean isDiverted(){
      return diverted == 1;
    }
    
    boolean departsLate(){
      return (lateDepMinutes >= 0);
    }
    
    boolean departsLate(int minutes){
      return (lateDepMinutes >= minutes);
    }
    
    boolean arrivesLate(){
      return (lateArrMinutes >= 0);
    }
    
     boolean arrivesLate(int minutes){
      return (lateArrMinutes >= minutes);
    }
    
    boolean isLate(){
      return (lateDepMinutes >= 0 || lateArrMinutes >= 0) && (cancelled == 0);
    }
    
    int getMinutes(int time){
      int hours = time / 100;
      int minutes = time - 100 * hours;
      return hours * 60 + minutes;
    }
    
    int getDuration (int start, int end){
      int duration;
      if(start < end){
        duration = getMinutes(end) - getMinutes(start);
      }
      else{
        duration = (getMinutes(end) + 24 * 60) - getMinutes(start);
      }
      return duration;
    }
    
   void printDuration(int duration){
     int hours = duration / 60;
     int minutes = duration % 60;
     println(hours + " hours and " + minutes + " minutes.");
   }
   
   String removeQuotationMarks(String input){
     char[] process = input.toCharArray();
     shorten(process);
     String output = new String(process, 1, process.length-2);
     return output;
   }
   
  }
