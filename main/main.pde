// Zicheng, 12th March, 18:00: created the empty main;
// Hi im checking if i made a change again again
// Hello

void settings() {
}

void setup() {
}

void draw() {
  background(0);
  for (int i = 0; i < displayNum; i++) {
    int thisEntry = startingEntry + i;
    if (thisEntry < datapointCount) {
      text(thisEntry + " > " + datapoints[thisEntry].carrierCode, 20, 20 + i*20);
    }
  }
}

void mousePressed() {
}
