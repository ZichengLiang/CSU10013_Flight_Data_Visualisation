class Time{ 
  // time handles two formats of input: 01/01/2022; 2317;
  int minutes;
  int hours;
  int day;
  int month;
  int year;
  // TODO: store all flight time info, including CRSDept, dept, CRSArr, arr (?? or get a child class?)
  
  Time(String date){
    String[] pieces = split(date, '/'); 
    month = Integer.valueOf(pieces[0]);
    day = Integer.valueOf(pieces[1]);
    year = Integer.valueOf(pieces[2]);
  }
  
  Time(int time){
    if(time >= 100){
      hours = time / 100;
      minutes = time - 100 * hours;
    }
    else{
      hours = 0;
      minutes = time;
    }
  }
  
  Time(int time, String date){
    String[] pieces = split(date, '/'); 
    month = Integer.valueOf(pieces[0]);
    day = Integer.valueOf(pieces[1]);
    year = Integer.valueOf(pieces[2]);
    if(time >= 100){
      hours = time / 100;
      minutes = time - 100 * hours;
    }
    else{
      hours = 0;
      minutes = time;
    }
  }
  
  void setDate(String date){
    String[] pieces = split(date, '/'); 
    month = Integer.valueOf(pieces[0]);
    day = Integer.valueOf(pieces[1]);
    year = Integer.valueOf(pieces[2]);
  }
  
  void setHoursAndMinutes(int time){
    if(time >= 100){
      hours = time / 100;
      minutes = time - 100 * hours;
    }
    else{
      hours = 0;
      minutes = time;
    }
  }
  
  boolean earlierThan(Time end){
    if(year > end.year){
      return false;
    }
    else if(month > end.month){
      return false;
    }
    else if(day > end.day){
      return false;
    }
    else if(hours > end.hours){
      return false;
    }
    else if(minutes >= end.minutes){
      return false;
    }
    else{
      return true;
    }
  }
  
  int getMinutes(){
      return month * MINUTES_PER_MONTH + day * MINUTES_PER_DAY + hours * MINUTES_PER_HOUR + minutes;
    }
    
  int getDuration (Time start, Time end){
    int duration;
    if(start.earlierThan(end)){
      duration = end.getMinutes() - start.getMinutes();
    }
    else{
      duration = start.getMinutes() - end.getMinutes();
    }
    return duration;
  }
    
}
