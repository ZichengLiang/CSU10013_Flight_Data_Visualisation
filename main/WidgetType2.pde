//Oliver 19th March: creation of new widget type to show data
class WidgetType2
{
  float x, y, width, height;
  color widgetColor, labelColor;
  PFont widgetFont;
  Datapoint[] data;

  WidgetType2(float x, float y, float width, float height,
    color widgetColor, PFont widgetFont, Datapoint[] data)
  {
    this.x=x;
    this.y=y;
    this.width = width;
    this.height= height;
    this.widgetColor=widgetColor;
    this.widgetFont=widgetFont;
    this.data = data;
    labelColor= color(0);
  }

  void draw()
  {
    fill(widgetColor);
    rect(x, y, width, height);
    fill(0);
    for (int i3 = 0; i3 < displayNum; i3++) {
      int thisEntry = 0;
      thisEntry = startingEntry + i3;
      //~M: seems to be confusing the system, prints 10 times once replaced
      if (thisEntry < datapointCount) {
        //M: there seems to be somthing going wrong with calling on data here, i need more info on exactly how data is being called before i can fix this
        text(thisEntry + " > " + datapoints[thisEntry].carrierCode + datapoints[thisEntry].flightNumber + " ---- "
          + datapoints[thisEntry].origin + " -> " + datapoints[thisEntry].dest
          , x+x/4, y-y/1.3 + i3*20);
      }
    }
  }

  int pressed(float mX, float mY)
  {
    if (mX>x-(width/2) && mX < x+(width/2) && mY >y-(height/2) && mY <y+(height/2)) 
    {
      return 1;
    }
    return EVENT_NULL;
  }
}
