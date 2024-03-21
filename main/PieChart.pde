import org.gicentre.utils.stat.*;
class PieChart {
  
  int[] data;
  
  PieChart(int[] data){
    this.data = data;
  }
  //look up map processing
  
  int[] angles = {90,90,90,90}; //represents degrees
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
     
    background(49,34,200);
    pieChart(300);
  }
  
  void pieChart(float diameter) {
    float lastAngle = 0;
    for (int i = 0; i < data.length; i++) {
      float blue = map(i, 0, data.length, 0, 255);
      fill(blue);
      arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(data[i]));
      lastAngle += radians(data[i]);
    }
  }
}
