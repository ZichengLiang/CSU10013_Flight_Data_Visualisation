class Map
{
  PImage map;
  float x, y, sizeX, sizeY;
  
  PShape america;
  MapStates[] states;
  
  Map (float x, float y, float sizeX, float sizeY, Datapoint[] data)
  {
    map = loadImage("alabama.png");
    this.x=x; this.y=y; this.sizeX=sizeX; this.sizeY=sizeY;
    //map.resize(100,100);
    
    america = loadShape("us.svg");
    
    // creates all the childShapes in a list
    states = new MapStates[50];
    states[0] = new MapStates("OH", america, x, y, sizeX, sizeY, 
    color(findColour(data, "OH"),0,50) ) ;
        states[1] = new MapStates("NY", america, x, y, sizeX, sizeY, 
    color(findColour(data, "NY"), 0, 50)) ;
        states[2] = new MapStates("AL", america, x, y, sizeX, sizeY, 
    color(findColour(data, "AL"), 0, 50)) ;
        states[3] = new MapStates("AK", america, x, y, sizeX, sizeY, 
    color(findColour(data, "AK"), 0, 50)) ;
        states[4] = new MapStates("AZ", america, x, y, sizeX, sizeY, 
    color(findColour(data, "AZ"), 0, 50)) ;
        states[5] = new MapStates("AR", america, x, y, sizeX, sizeY, 
    color(findColour(data, "AR"),0,50)) ;
        states[6] = new MapStates("CA", america, x, y, sizeX, sizeY, 
    color(findColour(data, "CA"),0,50)) ;
        states[7] = new MapStates("CO", america, x, y, sizeX, sizeY, 
    color(findColour(data, "CO"),0,50)) ;
        states[8] = new MapStates("CT", america, x, y, sizeX, sizeY, 
    color(findColour(data, "CT"),0,50)) ;
        states[9] = new MapStates("DE", america, x, y, sizeX, sizeY, 
    color(findColour(data, "DE"),0,50)) ;
        states[10] = new MapStates("FL", america, x, y, sizeX, sizeY, 
    color(findColour(data, "FL"),0,50)) ;
        states[11] = new MapStates("GA", america, x, y, sizeX, sizeY, 
    color(findColour(data, "GA"),0,50)) ;
        states[12] = new MapStates("HI", america, x, y, sizeX, sizeY, 
   color( findColour(data, "HI"),0,50)) ;
        states[13] = new MapStates("ID", america, x, y, sizeX, sizeY, 
    color(findColour(data, "ID"),0,50)) ;
        states[14] = new MapStates("IL", america, x, y, sizeX, sizeY, 
    color(findColour(data, "IL"),0,50)) ;
        states[15] = new MapStates("IN", america, x, y, sizeX, sizeY, 
    color(findColour(data, "IN"),0,50)) ;
        states[16] = new MapStates("IA", america, x, y, sizeX, sizeY, 
   color( findColour(data, "IA"),0,50)) ;
        states[17] = new MapStates("KS", america, x, y, sizeX, sizeY, 
    color(findColour(data, "KS"),0,50)) ;
        states[18] = new MapStates("KY", america, x, y, sizeX, sizeY, 
    color(findColour(data, "KY"),0,50)) ;
        states[19] = new MapStates("LA", america, x, y, sizeX, sizeY, 
    color(findColour(data, "LA"),0,50)) ;
        states[20] = new MapStates("ME", america, x, y, sizeX, sizeY, 
   color( findColour(data, "ME"),0,50)) ;
        states[21] = new MapStates("MD", america, x, y, sizeX, sizeY, 
   color( findColour(data, "MD"),0,50)) ;
        states[22] = new MapStates("MA", america, x, y, sizeX, sizeY, 
    color(findColour(data, "MA"),0,50)) ;
        states[23] = new MapStates("MI", america, x, y, sizeX, sizeY, 
    color(findColour(data, "MI"),0,50)) ;
        states[24] = new MapStates("MN", america, x, y, sizeX, sizeY, 
    color(findColour(data, "MN"),0,50)) ;
        states[25] = new MapStates("MS", america, x, y, sizeX, sizeY, 
    color(findColour(data, "MS"),0,50)) ;
        states[26] = new MapStates("MO", america, x, y, sizeX, sizeY, 
    color(findColour(data, "MO"),0,50)) ;
        states[27] = new MapStates("MT", america, x, y, sizeX, sizeY, 
    color(findColour(data, "MT"),0,50)) ;
        states[28] = new MapStates("NE", america, x, y, sizeX, sizeY, 
    color(findColour(data, "NE"),0,50)) ;
        states[29] = new MapStates("NV", america, x, y, sizeX, sizeY, 
    color(findColour(data, "NV"),0,50)) ;
        states[30] = new MapStates("NJ", america, x, y, sizeX, sizeY, 
    color(findColour(data, "NJ"),0,50)) ;
        states[31] = new MapStates("NM", america, x, y, sizeX, sizeY, 
    color(findColour(data, "NM"),0,50)) ;
        states[32] = new MapStates("NC", america, x, y, sizeX, sizeY, 
    color(findColour(data, "NC"),0,50)) ;
        states[33] = new MapStates("ND", america, x, y, sizeX, sizeY, 
    color(findColour(data, "ND"),0,50)) ;
        states[34] = new MapStates("OK", america, x, y, sizeX, sizeY, 
    color(findColour(data, "OK"),0,50)) ;
        states[35] = new MapStates("OR", america, x, y, sizeX, sizeY, 
   color( findColour(data, "OR"),0,50)) ;
        states[36] = new MapStates("PA", america, x, y, sizeX, sizeY, 
    color(findColour(data, "PA"),0,50)) ;
        states[37] = new MapStates("RI", america, x, y, sizeX, sizeY, 
    color(findColour(data, "RI"),0,50)) ;
        states[38] = new MapStates("SC", america, x, y, sizeX, sizeY, 
    color(findColour(data, "SC"),0,50)) ;
        states[39] = new MapStates("SD", america, x, y, sizeX, sizeY, 
    color(findColour(data, "SD"),0,50)) ;
        states[40] = new MapStates("TN", america, x, y, sizeX, sizeY, 
    color(findColour(data, "TN"),0,50)) ;
        states[41] = new MapStates("TX", america, x, y, sizeX, sizeY, 
    color(findColour(data, "TX"),0,50)) ;
        states[42] = new MapStates("UT", america, x, y, sizeX, sizeY, 
   color( findColour(data, "UT"),0,50)) ;
        states[43] = new MapStates("VT", america, x, y, sizeX, sizeY, 
    color(findColour(data, "VT"),0,50)) ;
        states[44] = new MapStates("VA", america, x, y, sizeX, sizeY, 
   color( findColour(data, "VA"),0,50)) ;
        states[45] = new MapStates("WA", america, x, y, sizeX, sizeY, 
    color(findColour(data, "WA"),0,50)) ;
        states[46] = new MapStates("WV", america, x, y, sizeX, sizeY, 
   color( findColour(data, "WV"),0,50)) ;
        states[47] = new MapStates("WI", america, x, y, sizeX, sizeY, 
    color(findColour(data, "WI"),0,50)) ;
        states[48] = new MapStates("WY", america, x, y, sizeX, sizeY, 
   color( findColour(data, "WY"),0,50)) ;
        states[49] = new MapStates("NH", america, x, y, sizeX, sizeY, 
   color( findColour(data, "NH"),0,50)) ;

  }
  
  void draw()
  {
    fill(255,0,0);
    noStroke();
    shape(america, x,y, sizeX, sizeY);
    
    for(int i =0; i<states.length; i++)
    {
      states[i].draw();
    }
  }
}

// Problem: for Whatever reason, nothing is added onto the "point" variable
int findColour(Datapoint[] data, String state)
{
  int point =0;
  System.out.println(state);
  for(int x=1; x<data.length; x++)
  {
    System.out.print(data[x].originState);
    if(state==data[x].originState)
    {
      point+=255;
    }
  }
  System.out.println(point);
  return point;
}
