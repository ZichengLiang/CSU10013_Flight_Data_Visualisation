
//PImage //we could use an arrow key or button 
class Widgets{
  int xpos, ypos, width, height;
  String label; int mouseOnWidget;
  color widgetColor, labelColor;
  PFont widgetFont;
  Widgets(int xposi,int yposi, int width, int height, String label, color widgetColor, PFont widgetFont, int event){//if using add PImage instead
    this.xpos = xposi; this.ypos = yposi;
    this.width = width; this.height= height;
    this.label=label; this.mouseOnWidget=event;
    this.widgetColor=widgetColor; this.widgetFont=widgetFont;
    labelColor= color(0); 
  }
  
  
}
