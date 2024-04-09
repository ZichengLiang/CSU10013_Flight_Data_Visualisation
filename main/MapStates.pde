class MapStates
{
  PShape state;
  float x, y, sizeX, sizeY;
  color colour;
  String stateName;

  MapStates(String state, PShape parent, float x, float y, float sizeX, float sizeY,
    color colour)
  {
    stateName=state;
    this.state = parent.getChild(state);
    this.x=x;
    this.y=y;
    this.sizeX=sizeX;
    this.sizeY=sizeY;
    this.colour=colour;
  }

  void draw()
  {
    state.disableStyle();
    fill(colour);
    shape(state, x, y, sizeX, sizeY);
  }
  
  void colourChange(color colour)
  {
    this.colour=colour;
  }
}
