///Daniel 15/03/24 initialized TheBarChart class
import org.gicentre.utils.stat.*;
// Used from giCentre for template

class TheBarChart {
  BarChart barChart;

  TheBarChart(BarChart chart) {
    barChart = chart;
    barChart.setData(new float[]{400, 800, 1200, 100, 2000});

    barChart.setMinValue(0);
    barChart.setMaxValue(2000);

    barChart.showValueAxis(true);
    barChart.setBarLabels(new String[]{"DEN", "JFK", "DUB", "MAD", "TEX"});
    barChart.showCategoryAxis(true);
    //  barChart.setCategoryAxisLabel("Airports");

    //Colour
    barChart.setBarColour(color(#26B6E0)); // Light Blue
    barChart.setAxisLabelColour(color(#26B6E0));
    barChart.setAxisValuesColour(color(#26B6E0));
  }

  void draw() {
    barChart.draw(150, 50, width - 200, height - 200);

    fill(#26B6E0); 
    textAlign(CENTER, TOP); 
    textSize(15); 
    text("Airports", 415, 500);
  }
}
