import g4p_controls.*;
import java.util.ArrayList;

// Initialize your ArrayList to store Datapoint objects
//ArrayList<Datapoint> datapoints; // Assume this is populated with your CSV data
ArrayList<Datapoint> filteredFlights = new ArrayList<Datapoint>(); // To store filtered results

// Slider to control departure hour
GSlider hourSlider;

String[] tickLabels = new String[24];


// Handler for the slider change event
public void hourSliderChanged(GSlider slider, GEvent event) {
  // Check for the drag event to update the slider position continuously
  if (event == GEvent.DRAGGED) {
    int hour = slider.getValueI();
    // Update any necessary components based on the slider's value
    println("Slider moved to: " + hour); // Debugging line to check slider movement
    filterFlightsAfterHour(hour); // Apply filter based on the selected hour
    // Add any additional actions needed during the drag here
  }
}

void filterFlightsAfterHour(int hour) {
  // Clear previous filter results
  filteredFlights.clear();

  // Loop through datapoints and filter based on the hour
  for (Datapoint dp : datapoints) {
    if (matchesHourCriteria(dp, hour)) {
      filteredFlights.add(dp);
    }
  }

  // Now you can use filteredFlights for display or further processing
  println("Filtered flights count: " + filteredFlights.size());
}

boolean matchesHourCriteria(Datapoint dp, int hour) {
  // Convert CRSDepTime to a comparable format (hour only)
  int flightHour = dp.getCRSDepTime() / 100; // Assuming CRSDepTime is in HHMM format
  
  // Check if the flight departs on or after the specified hour
  return flightHour >= hour;
}

//void drawTickLabels(float margin) {
//  float interval = hourSlider.getWidth() / 24.0; // Calculate the interval between tick labels
//  //float x = hourSlider.getX() + interval / 2.0; // Start drawing tick labels from the center of each interval
//  float y = hourSlider.getY() + hourSlider.getHeight() + margin; // Y position for tick labels (below the slider with margin)

//  textAlign(CENTER, CENTER);
//  textSize(10);
  
//  for (int i = 0; i < 24; i++) {
//    float x = hourSlider.getX() + (i + 0.5) * interval; // Adjust the x position to place the text in the center of the tick interval
//    stroke(255); // Set the stroke color to white
//    fill(255); // Set the fill color to white
//    text(tickLabels[i], x, y); // Draw tick labels
//  }
//}

void drawTickLabels(float margin) {
  float interval = hourSlider.getWidth() / 24.0; // Calculate the interval between tick labels
  float y = hourSlider.getY() + hourSlider.getHeight() + margin; // Y position for tick labels (below the slider with margin)

  textAlign(CENTER, CENTER);
  textSize(10);
  
  int currentIndex = (int) ((hourSlider.getValueF() / 24.0) * 24); // Calculate the index of the current tick label
  
  for (int i = 0; i < 24; i++) {
    float x = hourSlider.getX() + (i + 0.5) * interval; // Adjust the x position to place the text in the center of the tick interval
    stroke(255); // Set the stroke color to white
    fill(255); // Set the fill color to white
    if (i == currentIndex) {
      text(tickLabels[i], x, y); // Draw tick label only if it corresponds to the current slider position
      break; // Break the loop once the current tick label is drawn
    }
  }
}
