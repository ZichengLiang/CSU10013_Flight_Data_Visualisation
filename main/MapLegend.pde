class MapLegend
{
  float x, y, sizeX, sizeY;
  color colour;
  String value;
  
  MapLegend(float x, color colour, String value)
  {
    this.x=x;this.y= SCREENY/8;
    this.colour=colour;
    this.value=value;
    
    sizeX=35;sizeY=sizeX;
  }
  
  void draw()
  {
    fill(colour);
    rect(x,y,sizeX,sizeY);
    fill(0);
    textSize(sizeX/2);
    text(value, x+sizeX*2, y+(sizeY/4));
  }
}
