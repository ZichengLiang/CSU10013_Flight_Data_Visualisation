class Widget {
  float x, y, width, height;
  String label;
  int event;
  color widgetColor, labelColor;
  PFont widgetFont;
  int cornerRadius;


  Widget(float x, float y, int width, int height, int cornerRadius, String label,
    color widgetColor, PFont widgetFont, int event) {
    this.x=x;
    this.y=y;
    this.width = width;
    this.height= height;
    this.cornerRadius = cornerRadius;
    this.label=label;
    this.event=event;
    this.widgetColor=widgetColor;
    this.widgetFont=widgetFont;
    labelColor= color(0);
  }
  void draw() {
    fill(widgetColor);
    rect(x, y, width, height, cornerRadius, cornerRadius, cornerRadius, cornerRadius);
    fill(labelColor);
    textAlign(RIGHT);

    text(label, x+width/4, y);
  }
  int getEvent(int mX, int mY) {
    if (mX>x-(width/2) && mX < x+(width/2) && mY >y-(height/2) && mY <y+(height/2)) {
      return event;
    }
    return EVENT_NULL;
  }
}
