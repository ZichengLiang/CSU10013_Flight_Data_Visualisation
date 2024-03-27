class Map
{
  PImage map;
  float x, y;
  
  Map (float x, float y)
  {
    map = loadImage("alabama.png");
    this.x=x; this.y=y;
    map.resize(100,100);
  }
  
  void draw()
  {
    tint(100,0,0);
    image(map, x,y);
  }
}
