class TheMap
{
  PImage map;
  float x, y, sizeX, sizeY;
  int blue;

  PShape america;
  MapStates[] states;

  TheMap (float x, float y, float sizeX, float sizeY, ArrayList<Datapoint> list)
  {
    this.x=x;
    this.y=y;
    this.sizeX=sizeX;
    this.sizeY=sizeY;
    
    blue = 10000;
    //map.resize(100,100);

    america = loadShape("us.svg");
    
    ArrayList<Datapoint> data = (ArrayList<Datapoint>)list.clone();
    states = new MapStates[50];
    
    colorMode(RGB, 100000);
    states[0] = new MapStates("OH", america, x, y, sizeX, sizeY,
      color(findColour(data, "OH"), 0, blue) ) ;
    states[1] = new MapStates("NY", america, x, y, sizeX, sizeY,
      color(findColour(data, "NY"), 0, blue)) ;
    states[2] = new MapStates("AL", america, x, y, sizeX, sizeY,
      color(findColour(data, "AL"), 0, blue)) ;
    states[3] = new MapStates("AK", america, x, y, sizeX, sizeY,
      color(findColour(data, "AK"), 0, blue)) ;
    states[4] = new MapStates("AZ", america, x, y, sizeX, sizeY,
      color(findColour(data, "AZ"), 0, blue)) ;
    states[5] = new MapStates("AR", america, x, y, sizeX, sizeY,
      color(findColour(data, "AR"), 0, blue)) ;
    states[6] = new MapStates("CA", america, x, y, sizeX, sizeY,
      color(findColour(data, "CA"), 0, blue)) ;
    states[7] = new MapStates("CO", america, x, y, sizeX, sizeY,
      color(findColour(data, "CO"), 0, blue)) ;
    states[8] = new MapStates("CT", america, x, y, sizeX, sizeY,
      color(findColour(data, "CT"), 0, blue)) ;
    states[9] = new MapStates("DE", america, x, y, sizeX, sizeY,
      color(findColour(data, "DE"), 0, blue)) ;
    states[10] = new MapStates("FL", america, x, y, sizeX, sizeY,
      color(findColour(data, "FL"), 0, blue)) ;
    states[11] = new MapStates("GA", america, x, y, sizeX, sizeY,
      color(findColour(data, "GA"), 0, blue)) ;
    states[12] = new MapStates("HI", america, x, y, sizeX, sizeY,
      color( findColour(data, "HI"), 0, blue)) ;
    states[13] = new MapStates("ID", america, x, y, sizeX, sizeY,
      color(findColour(data, "ID"), 0, blue)) ;
    states[14] = new MapStates("IL", america, x, y, sizeX, sizeY,
      color(findColour(data, "IL"), 0, blue)) ;
    states[15] = new MapStates("IN", america, x, y, sizeX, sizeY,
      color(findColour(data, "IN"), 0, blue)) ;
    states[16] = new MapStates("IA", america, x, y, sizeX, sizeY,
      color( findColour(data, "IA"), 0, blue)) ;
    states[17] = new MapStates("KS", america, x, y, sizeX, sizeY,
      color(findColour(data, "KS"), 0, blue)) ;
    states[18] = new MapStates("KY", america, x, y, sizeX, sizeY,
      color(findColour(data, "KY"), 0, blue)) ;
    states[19] = new MapStates("LA", america, x, y, sizeX, sizeY,
      color(findColour(data, "LA"), 0, blue)) ;
    states[20] = new MapStates("ME", america, x, y, sizeX, sizeY,
      color( findColour(data, "ME"), 0, blue)) ;
    states[21] = new MapStates("MD", america, x, y, sizeX, sizeY,
      color( findColour(data, "MD"), 0, blue)) ;
    states[22] = new MapStates("MA", america, x, y, sizeX, sizeY,
      color(findColour(data, "MA"), 0, blue)) ;
    states[23] = new MapStates("MI", america, x, y, sizeX, sizeY,
      color(findColour(data, "MI"), 0, blue)) ;
    states[24] = new MapStates("MN", america, x, y, sizeX, sizeY,
      color(findColour(data, "MN"), 0, blue)) ;
    states[25] = new MapStates("MS", america, x, y, sizeX, sizeY,
      color(findColour(data, "MS"), 0, blue)) ;
    states[26] = new MapStates("MO", america, x, y, sizeX, sizeY,
      color(findColour(data, "MO"), 0, blue)) ;
    states[27] = new MapStates("MT", america, x, y, sizeX, sizeY,
      color(findColour(data, "MT"), 0, blue)) ;
    states[28] = new MapStates("NE", america, x, y, sizeX, sizeY,
      color(findColour(data, "NE"), 0, blue)) ;
    states[29] = new MapStates("NV", america, x, y, sizeX, sizeY,
      color(findColour(data, "NV"), 0, blue)) ;
    states[30] = new MapStates("NJ", america, x, y, sizeX, sizeY,
      color(findColour(data, "NJ"), 0, blue)) ;
    states[31] = new MapStates("NM", america, x, y, sizeX, sizeY,
      color(findColour(data, "NM"), 0, blue)) ;
    states[32] = new MapStates("NC", america, x, y, sizeX, sizeY,
      color(findColour(data, "NC"), 0, blue)) ;
    states[33] = new MapStates("ND", america, x, y, sizeX, sizeY,
      color(findColour(data, "ND"), 0, blue)) ;
    states[34] = new MapStates("OK", america, x, y, sizeX, sizeY,
      color(findColour(data, "OK"), 0, blue)) ;
    states[35] = new MapStates("OR", america, x, y, sizeX, sizeY,
      color( findColour(data, "OR"), 0, blue)) ;
    states[36] = new MapStates("PA", america, x, y, sizeX, sizeY,
      color(findColour(data, "PA"), 0, blue)) ;
    states[37] = new MapStates("RI", america, x, y, sizeX, sizeY,
      color(findColour(data, "RI"), 0, blue)) ;
    states[38] = new MapStates("SC", america, x, y, sizeX, sizeY,
      color(findColour(data, "SC"), 0, blue)) ;
    states[39] = new MapStates("SD", america, x, y, sizeX, sizeY,
      color(findColour(data, "SD"), 0, blue)) ;
    states[40] = new MapStates("TN", america, x, y, sizeX, sizeY,
      color(findColour(data, "TN"), 0, blue)) ;
    states[41] = new MapStates("TX", america, x, y, sizeX, sizeY,
      color(findColour(data, "TX"), 0, blue)) ;
    states[42] = new MapStates("UT", america, x, y, sizeX, sizeY,
      color( findColour(data, "UT"), 0, blue)) ;
    states[43] = new MapStates("VT", america, x, y, sizeX, sizeY,
      color(findColour(data, "VT"), 0, blue)) ;
    states[44] = new MapStates("VA", america, x, y, sizeX, sizeY,
      color( findColour(data, "VA"), 0, blue)) ;
    states[45] = new MapStates("WA", america, x, y, sizeX, sizeY,
      color(findColour(data, "WA"), 0, blue)) ;
    states[46] = new MapStates("WV", america, x, y, sizeX, sizeY,
      color( findColour(data, "WV"), 0, blue)) ;
    states[47] = new MapStates("WI", america, x, y, sizeX, sizeY,
      color(findColour(data, "WI"), 0, blue)) ;
    states[48] = new MapStates("WY", america, x, y, sizeX, sizeY,
      color( findColour(data, "WY"), 0, blue)) ;
    states[49] = new MapStates("NH", america, x, y, sizeX, sizeY,
      color( findColour(data, "NH"), 0, blue)) ;

    colorMode(RGB, 255);
  }

  void draw()
  {
    colorMode(RGB, 100000);

    fill(255, 0, 0);
    noStroke();
    shape(america, x, y, sizeX, sizeY);

    for (int i =0; i<states.length; i++)
    {
      states[i].draw();
    }


    colorMode(RGB, 255);
  }

  void renewMap(ArrayList<Datapoint> list)
  {
    ArrayList<Datapoint> data = (ArrayList<Datapoint>)list.clone();
    if (data.get(0)==null)
    {
      System.out.println("null");
    }

    colorMode(RGB, 100000);
    states[0].colourChange(color(findColour(data, "OH"), 0, blue) ) ;
    states[1].colourChange(color(findColour(data, "NY"), 0, blue) ) ;
    states[2].colourChange(color(findColour(data, "AL"), 0, blue) ) ;
    states[3].colourChange(color(findColour(data, "AK"), 0, blue) ) ;
    states[4].colourChange(color(findColour(data, "AZ"), 0, blue) ) ;
    states[5].colourChange(color(findColour(data, "AR"), 0, blue) ) ;
    redraw();
    
    states[6].colourChange(color(findColour(data, "CA"), 0, blue) ) ;
    states[7].colourChange(color(findColour(data, "CO"), 0, blue) ) ;
    states[8].colourChange(color(findColour(data, "CT"), 0, blue) ) ;
    states[9].colourChange(color(findColour(data, "DE"), 0, blue) ) ;
    states[10].colourChange(color(findColour(data, "FL"), 0, blue) ) ;
    redraw();
    
    states[11].colourChange(color(findColour(data, "GA"), 0, blue) ) ;
    states[12].colourChange(color(findColour(data, "HI"), 0, blue) ) ;
    states[13].colourChange(color(findColour(data, "ID"), 0, blue) ) ;
    states[14].colourChange(color(findColour(data, "IL"), 0, blue) ) ;
    states[15].colourChange(color(findColour(data, "IN"), 0, blue) ) ;
    redraw();
    
    states[16].colourChange(color(findColour(data, "IA"), 0, blue) ) ;
    states[17].colourChange(color(findColour(data, "KS"), 0, blue) ) ;
    states[18].colourChange(color(findColour(data, "KY"), 0, blue) ) ;
    states[19].colourChange(color(findColour(data, "LA"), 0, blue) ) ;
    states[20].colourChange(color(findColour(data, "ME"), 0, blue) ) ;
    redraw();
    
    states[21].colourChange(color(findColour(data, "MD"), 0, blue) ) ;
    states[22].colourChange(color(findColour(data, "MA"), 0, blue) ) ;
    states[23].colourChange(color(findColour(data, "MI"), 0, blue) ) ;
    states[24].colourChange(color(findColour(data, "MN"), 0, blue) ) ;
    states[25].colourChange(color(findColour(data, "MS"), 0, blue) ) ;
    redraw();
    
    states[26].colourChange(color(findColour(data, "MO"), 0, blue) ) ;
    states[27].colourChange(color(findColour(data, "MT"), 0, blue) ) ;
    states[28].colourChange(color(findColour(data, "NE"), 0, blue) ) ;
    states[29].colourChange(color(findColour(data, "NV"), 0, blue) ) ;
    states[30].colourChange(color(findColour(data, "NJ"), 0, blue) ) ;
    redraw();
    
    states[31].colourChange(color(findColour(data, "NM"), 0, blue) ) ;
    states[32].colourChange(color(findColour(data, "NC"), 0, blue) ) ;
    states[33].colourChange(color(findColour(data, "ND"), 0, blue) ) ;
    states[34].colourChange(color(findColour(data, "OK"), 0, blue) ) ;
    states[35].colourChange(color(findColour(data, "OR"), 0, blue) ) ;
    redraw();
    
    states[36].colourChange(color(findColour(data, "PA"), 0, blue) ) ;
    states[37].colourChange(color(findColour(data, "RI"), 0, blue) ) ;
    states[38].colourChange(color(findColour(data, "SC"), 0, blue) ) ;
    states[39].colourChange(color(findColour(data, "SD"), 0, blue) ) ;
    states[40].colourChange(color(findColour(data, "TN"), 0, blue) ) ;
    redraw();
    
    states[41].colourChange(color(findColour(data, "TX"), 0, blue) ) ;
    states[42].colourChange(color(findColour(data, "UT"), 0, blue) ) ;
    states[43].colourChange(color(findColour(data, "VI"), 0, blue) ) ;
    states[44].colourChange(color(findColour(data, "VA"), 0, blue) ) ;
    states[45].colourChange(color(findColour(data, "WA"), 0, blue) ) ;
    redraw();
    
    states[46].colourChange(color(findColour(data, "WV"), 0, blue) ) ;
    states[47].colourChange(color(findColour(data, "WI"), 0, blue) ) ;
    states[48].colourChange(color(findColour(data, "WY"), 0, blue) ) ;
    states[49].colourChange(color(findColour(data, "NH"), 0, blue) ) ;

    colorMode(RGB, 255);
  }
}

// Problem: for Whatever reason, nothing is added onto the "point" variable
int findColour(ArrayList <Datapoint> data, String state)
{
  int point =0;
  for (int x=1; x<data.size(); x++)
  {
    if (data.get(x) != null)
    {
      if (data.get(x).originState.equals(state))
      {
        data.remove(x);
        point+=3;
      }
    }
  }
  return point;
}
