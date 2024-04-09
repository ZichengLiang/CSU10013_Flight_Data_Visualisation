// Aryan: 3rd April

import g4p_controls.*;
import java.util.ArrayList;
import processing.core.PApplet; // Import the PApplet class

public class Slider {

  ArrayList<Datapoint> filteredFlights = new ArrayList<Datapoint>(); // To store filtered results
  GSlider hourSlider;
  String[] tickLabels = new String[24];
  PApplet parent; // Reference to the parent PApplet instance
  int userInput;

  public Slider(PApplet parent, int limit) {
    this.parent = parent; // Assign the parent PApplet instance
    G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
    G4P.setMouseOverEnabled(true);
    int sliderWidth = 175; // Width of the slider
    int sliderHeight = 40; // Height of the slider
    int margin = 10; // Margin from the edges of the window

    // Initialize the tick labels with numbers from 0 to 23
    for (int i = 0; i < 24; i++) {
      tickLabels[i] = String.format("%02d:00", i); // Format each hour with leading zeros
    }

    // Position the slider at the top right, with a margin
    int sliderX = parent.width - sliderWidth - margin; // X position
    int sliderY = 400;

    hourSlider = new GSlider(parent, sliderX, sliderY, sliderWidth, sliderHeight, 10.0); // Use the parent PApplet instance
    hourSlider.setLimits(0, 0, limit); // Slider range from 0 to 23 hours
    hourSlider.setNumberFormat(G4P.INTEGER, 0);
    hourSlider.setShowValue(true); // Display value above cursor
    hourSlider.setOpaque(false);
    hourSlider.addEventHandler(this, "hourSliderChanged");
    hourSlider.addEventHandler(this, "handleSliderEvents");
  }


// here you can add any actions u wish to

  public void hourSliderChanged(GSlider slider, GEvent event) {
    if (event == GEvent.DRAGGED) {
      int hour = slider.getValueI();
      filterFlightsAfterHour(hour);
    }
  }
  
  public int getUserInput(){
    return userInput;
  }
  
  public void handleSliderEvents(GSlider slider, GEvent event) {
    userInput = slider.getValueI();
  }

  public void filterFlightsAfterHour(int hour) {
    filteredFlights.clear();
    for (Datapoint dp : datapoints) {
      if (matchesHourCriteria(dp, hour)) {
        filteredFlights.add(dp);
      }
    }
    println("Filtered flights count: " + filteredFlights.size());
  }

  public boolean matchesHourCriteria(Datapoint dp, int hour) {
    int flightHour = dp.getCRSDepTime() / 100;
    return flightHour >= hour;
  }

  public void drawTickLabels(float margin) {
    float interval = hourSlider.getWidth() / 24.0;
    float y = hourSlider.getY() + hourSlider.getHeight() + margin;

    textAlign(CENTER, CENTER);
    textSize(10);

    int currentIndex = (int) ((hourSlider.getValueF() / 24.0) * 24);

    for (int i = 0; i < 24; i++) {
      float x = hourSlider.getX() + (i + 0.5) * interval;
      stroke(255);
      fill(255);
      if (i == currentIndex) {
        text(tickLabels[i], x, y);
        break;
      }
    }
  }
}
