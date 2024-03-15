class Widget {
  int x, y, width, height;
  String label; int event;
  color widgetColor, labelColor;
  PFont widgetFont;


  Widget(int x,int y, int width, int height, String label,
  color widgetColor, PFont widgetFont, int event){
    this.x=x; this.y=y; this.width = width; this.height= height;
    this.label=label; this.event=event; 
    this.widgetColor=widgetColor; this.widgetFont=widgetFont;
    labelColor= color(0);
   }
  void draw(){
    fill(widgetColor);
    rect(x,y,width,height);
    fill(labelColor);
    textAlign(RIGHT);
    text(label, x, y);
  }
  int getEvent(int mX, int mY){
     if(mX>x-(width/2) && mX < x+(width/2) && mY >y-(height/2) && mY <y+(height/2)){
        return event;
     }
     return EVENT_NULL;
  }
}
