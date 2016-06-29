// LCD5110_Scrolling_Text (C)2013 Henning Karlsen
// web: http://www.henningkarlsen.com/electronics
//
// Modified by Alexey Stepanov (Hardware SPI Support)
//
// This program is a demo of how to use print().
//
// This program requires a Nokia 5110 LCD module.
//
// It is assumed that the LCD module is connected to
// the following pins using a levelshifter to get the
// correct voltage to the module.
//      SCK  - Pin 13
//      MOSI - Pin 11
//      DC   - Pin 5
//      RST  - Pin 6
//      CS   - Pin 3
//
#include <SPI.h>
#include <LCD5110_Graph_SPI.h>

LCD5110 myGLCD(5,6,3);

extern uint8_t SmallFont[];

int y;

void setup()
{
  myGLCD.InitLCD();
  myGLCD.setFont(SmallFont);
  randomSeed(analogRead(0));
}

void loop()
{
  y = random(0, 40);
  for (int i=84; i>=-(34*6); i--)
  {
    myGLCD.print("LCD5110_Graph Scrolling Text Demo ", i, y);
    myGLCD.update();
    delay(50);
  }
}
