import org.gicentre.utils.stat.*;

class PieChart {
  
  int[] data;
  int[] originalData;
  int Conversion; //determaines what kind of conversion is done in piConverter - radians or percentage
  Query fromWholeDataSet = new Query();
  int totalFlights = fromWholeDataSet.lastQueryList.size();
   
  PieChart(int[] data){
    originalData = data;
    Conversion = 360;
    this.data = piConverter(data);
    int[] PercentageData = piConverter(data);
    //[]int PiConverted =  convertedData;    
    //360 x ax
    //      sum
  }
  //look up map processing
  
  int[] angles = {90,90,90,90}; //represents degrees
  String[] dataLables ={"Diverted","cancelled","Unchanged"};
  //Query fromWholeDataSet = new Query();
  //int[] flights = {divertedNumber,cancelledNumber,23};
   // 360  == 100%
  int N;
  int i = 0;
  
  
  //int[] Cancelled = new int[Datapoint.cancelled];
  //  int Cancelled = (Datapoint.cancelled);
  //int i = Datapoint.length;
 //int i = 0;
 // while (i != 0){
 //int[] AFlights = main.AFlights;

 // }
  
  void  draw() {
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

//int sumData = 0;
//int DataDivBy360 = 0;
// double data = 3452.345
//int value = (int)data;
//

int[] piConverter(int[] data){
    int[]convertedData = new int[data.length];
    float dataPointDecValue;
 for (int i = 0;  i < data.length; i++){           // 22/03/2024 11:32 
   dataPointDecValue = data[i]*Conversion;      //  data is multiplied by 360 to convert it to a fraction of PI
    println(dataPointDecValue);
   dataPointDecValue = dataPointDecValue/totalFlights;       // the data fraction eg 218*360 cancelled flights out of 2000 218*360/2000 is converted to decimal form
   println(dataPointDecValue);
   int dataPointDecFin = (int)dataPointDecValue;   // converts the float into an int
   convertedData[i] = dataPointDecFin;
   println(convertedData[i]);
 }
     Conversion = 0;
    return(convertedData);
  }
  
}
  
  //    for (int i = 0;  i < data.length; i++){
//      sumData += data[i];
//   }
   
//       for (int i = 0;  i < data.length; i++){
//      convertedData[i] = data[i]*360;
//    }
//    DataDivBy360 = 360/sumData;
