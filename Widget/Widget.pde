
ArrayList widgetList;

void setup() {
  PFont stdFont;
  widget widget1, widget2;

  stdFont=loadFont("Centaur-48.vlw");
  textFont(stdFont);

  widget1=new widget(100, 100, 180, 40,
    "press me!", color(100),
    stdFont, EVENT_BUTTON1);
  widget2=new widget(100, 200, 180, 40,
    "no, me!", color(100),
    stdFont, EVENT_BUTTON2);
  size(400, 400);

  widgetList = new ArrayList();
  widgetList.add(widget1);
  widgetList.add(widget2);
}

void draw() {
  for (int i = 0; i<widgetList.size(); i++) {
    widget aWidget = (widget)widgetList.get(i);
    aWidget.draw();
  }
}

void mousePressed() {
  int event;

  for (int i = 0; i<widgetList.size(); i++) {
    widget aWidget = (widget) widgetList.get(i);
    event = aWidget.getEvent(mouseX, mouseY);
    switch(event) {
    case EVENT_BUTTON1:
      println("button 1!");
      break;
    case EVENT_BUTTON2:
      println("button 2!");
      break;
    }
  }
}
