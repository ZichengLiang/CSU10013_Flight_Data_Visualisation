import org.gicentre.utils.stat.*;

class PieChart {
  
  int[] data;
  int[] originalData;
  int Conversion; //determaines what kind of conversion is done in piConverter - radians or percentage
  int[] angles = {90,90,90,90}; //represents degrees
  String[] dataLables ={"Diverted","cancelled","Unchanged"};
   
  PieChart(int[] inputData){
    originalData = inputData;
    Conversion = 360;
    this.data = piConverter(inputData);
    int[] PercentageData = piConverter(inputData);
  }
  //look up map processing
  
  PieChart(HashMap<String, Integer> inputData){
    // every label should project to a unique value
    dataLables = inputData.keySet().toArray(String[]::new);
   //  = inputData.values().toArray(Integer[]::new);
   // TODO: finish the constructor
  }
   // 360  == 100%
  int N;
  int i = 0;
  
  
  void  draw() {
    fill(255);
    rect(550,40,160,60*data.length);
    pieChart(300);
  }
  
  void pieChart(float diameter) {
    float lastAngle = 0;
    for (int i = 0; i < data.length; i++) {
      float blue = map(i, 0, data.length, 0, 255);
      float c = map(i, 0, data.length, 8, 200);  // Muireann O'Neill 23/3/24 11:48
      float e = map(i, 0, data.length, 50, 400); //to change pi Chart color
      fill(blue,c,e);
      arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(data[i]));
     if (i < dataLables.length){ 
     textSize(15);
     text( dataLables[i] +" = "+ originalData[i] , 600, 40+30*i);
     }
      lastAngle += radians(data[i]);
    }
  }

  int[] piConverter(int[] data){
    int[]convertedData = new int[data.length];
    float dataPointDecValue;
   for (int i = 0;  i < data.length; i++){           // 22/03/2024 11:32 
     dataPointDecValue = data[i]*Conversion;      //  data is multiplied by 360 to convert it to a fraction of PI
     //println(dataPointDecValue);
     dataPointDecValue = dataPointDecValue/currentQuery.getLastQueryList().size();       // the data fraction eg 218*360 cancelled flights out of 2000 218*360/2000 is converted to decimal form
     //println(dataPointDecValue);
     int dataPointDecFin = (int)dataPointDecValue;   // converts the float into an int
     convertedData[i] = dataPointDecFin;
     println(convertedData[i]);
   }
     Conversion = 0;
    return(convertedData);
  }
  
  
}
  
