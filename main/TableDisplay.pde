Table table;

int fontSize = 10; 
int tableX = 340; 
int tableY = 20; 
int tableWidth = 200; 
int tableHeight = 200; 
int rowHeight = 20; 
int columnWidth = 100; 

float scrollY = 0;

void displayTableData(int xcoordinate, int ycoordinate, int width, int height) {
  textSize(fontSize);

  // Calculate the maximum width for each column
  float[] columnWidths = new float[table.getColumnCount()];
  for (int colIndex = 0; colIndex < table.getColumnCount(); colIndex++) {
    float maxColumnWidth = textWidth(table.getColumnTitle(colIndex)); // Start with column header width
    for (TableRow row : table.rows()) {
      float cellWidth = textWidth(row.getString(colIndex));
      if (cellWidth > maxColumnWidth) {
        maxColumnWidth = cellWidth;
      }
    }
    columnWidths[colIndex] = maxColumnWidth;
  }

  float x = xcoordinate;
  float y = ycoordinate + scrollY;

  fill(0);
  // Display column headers
  for (int i = 0; i < table.getColumnCount(); i++) {
    String columnName = table.getColumnTitle(i);
    text(columnName, x-70, y);
    x += columnWidths[i] + 30; // Move to the next column
  }

  y += 20; // Move down below the headings to start displaying rows

  // Display row data
  for (TableRow row : table.rows()) {
    x = xcoordinate - 70; // Reset x position to start for each row, adhering to the left alignment requirement
    for (int colIndex = 0; colIndex < table.getColumnCount(); colIndex++) {
      String cellData = row.getString(colIndex);
      text(cellData, x, y);
      x += columnWidths[colIndex] + 30; // Move to the next column
    }
    y += textAscent() + 5; // Move down for the next row, ensuring rows are spaced out properly
  }
}
