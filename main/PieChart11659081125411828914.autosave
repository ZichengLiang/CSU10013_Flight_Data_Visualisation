import org.gicentre.utils.stat.*;
Widget[] DataToggle;
class PieChart {

  int[] data;
  int[] originalData;
  int Conversion = 360; //determaines what kind of conversion is done in piConverter - radians or percentage
  int[] angles = {90, 90, 90, 90}; //represents degrees
  String[] dataLables;
  String[] company;
  
  ArrayList <Datapoint> pastQuery;
  int[] abnormal= new int[3];

  PieChart(int[] data) {
    originalData = data;
    this.data = piConverter(data);
  }

  PieChart() {
  }

  void getAbnormalFlights() {
    this.dataLables = new String[] {"Diverted", "Cancelled", "Unchanged"};
    int cancelledNumber = currentQuery.cancelledFlights().size();
    int divertedNumber  = currentQuery.divertedFlights().size();
    int unaffectedFlights = currentQuery.getArrayList().size() - cancelledNumber - divertedNumber;
    int[] abnormalFlights = {divertedNumber, cancelledNumber, unaffectedFlights};
    originalData = abnormalFlights;
    this.data = piConverter(abnormalFlights);
  }
  
  
  void carrierCO(Query query) {
    HashMap<String, List<Datapoint>> flightsByCarrier = query.flightsByCarrier;
    if (flightsByCarrier.isEmpty()) {
      throw new IllegalArgumentException("Map is empty");
    }

    ArrayList<String> companies = new ArrayList<>();
    ArrayList<Integer> flights = new ArrayList<>();

    for (Entry<String, List<Datapoint>> carrier : flightsByCarrier.entrySet()) {
      companies.add(carrier.getKey());
      flights.add(carrier.getValue().size());
    }
    
    int[] intFlights = flights.stream()
    .mapToInt(Integer::intValue)
    .toArray();

    this.data = piConverter(intFlights);
    this.company = companies.toArray(String[]::new);
  }

  void pieChart(float diameter, int[] data1) {
    float lastAngle = 0;
    for (int i = 0; i < data1.length; i++) {
      float blue = map(i, 0, data1.length, 0, 255);
      float c = map(i, 0, 90*data1.length, 8, 200);  // Muireann O'Neill 23/3/24 11:48
      float e = map(i, 0, 90*data1.length, 50, 400); //to change pi Chart color
      fill(blue, c, e);
      arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians((float)data1[i]));//creates an arc in the piechart using data
      if (i < dataLables.length&& i<data1.length) {
        textSize(15);
        text( dataLables[i] +" = "+ data1[i], 580, 40+30*i);
      }
      lastAngle += radians(data1[i]);
    }
  }

  int[] piConverter(int[] data) {
    int[]convertedData = new int[data.length];
    float dataPointDecValue;

    for (int i = 0; i < data.length; i++) {           // 22/03/2024 11:32
      dataPointDecValue = data[i]*Conversion;      //  data is multiplied by 360 to convert it to a fraction of PI
      //println(dataPointDecValue);
      dataPointDecValue = dataPointDecValue/currentQuery.getArrayList().size();       // the data fraction eg 218*360 cancelled flights out of 2000 218*360/2000 is converted to decimal form
      //println(dataPointDecValue);
      int dataPointDecFin = (int)dataPointDecValue;   // converts the float into an int
      convertedData[i] = dataPointDecFin;
      //println(convertedData[i]);
    }
    //Conversion = 0;

    return(convertedData);
  }
  
  void  draw() {
    fill(255);
    rect(650, 40, 160, 60*data.length, 20);
    pieChart(300, abnormal);
    fill(0);
    textSize(30);
    text("Types of Flights", Screens.startX-(Screens.screenX/2), 50);
    //   for (int j = 0; j < DataToggle.length; j++) {
    //  if (j == 1) {
    //    DataToggle[j] = new Widget( (SCREENX / buttons.length) * j + 60,60, 100, 60, 20, "Pie Chart", 255, body, j);
    //  } else if (j == 4) {
    //    DataToggle[j] = new Widget( (SCREENX / buttons.length) * j + 60,60, 100, 60, 20, "Bar Chart", 255, body, j);
    //  }
    //}
  }
  
  void PieChange(ArrayList <Datapoint> array)
  {
    ArrayList <Datapoint> tempdata = new ArrayList<Datapoint>();
    for(int i=0; i<array.size(); i++)
    {
      tempdata.add(array.get(i));
    }
    if(tempdata != pastQuery)
    {
      pastQuery = tempdata;
      for(int i=0; i<3;i++)
      {
        abnormal[i]=0;
      }
      
      for(int i=0; i<pastQuery.size(); i++)
      {
        if(pastQuery.get(i).getCancelled()==1)
        {
          abnormal[1]++;
        }
        else if(pastQuery.get(i).getDiverted()==1)
        {
          abnormal[0]++;
        }
        else
        {
          abnormal[2]++;
        }
      }
    }    
  }
}
