//Daniel 15/03/24 initialized TheBarChart class
import org.gicentre.utils.stat.*;
// Used from giCentre for template

class TheBarChart {
  BarChart barChart;
  float[] dataDisplay;
  String[] labelDisplay;

  TheBarChart(BarChart chart, float[]inputData, String[]inputLabels) {

    barChart = chart;
    barChart.setData(inputData);

    barChart.setMinValue(0);
    barChart.setMaxValue(6000);

    barChart.showValueAxis(true);
    barChart.setBarLabels(inputLabels);
    barChart.showCategoryAxis(true);
    //barChart.setCategoryAxisLabel("Airports");

    //Colour
    barChart.setBarColour(#26B6E0); // Light Blue
    barChart.setAxisLabelColour(color(#26B6E0));
    barChart.setAxisValuesColour(color(#26B6E0));
  }
  void setData(float[] dataDisplay) {
    this.dataDisplay = dataDisplay;
  }
  void setLabel(String[] labelDisplay) {
    this.labelDisplay = labelDisplay;
  }
  void draw() {
    barChart.draw(150, 50, width - 200, height - 200);

    fill(#26B6E0);
    textAlign(CENTER, TOP);
    textSize(15);
    text("Airports", 415, 500);
  }
}
