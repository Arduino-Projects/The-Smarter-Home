#include <SPI.h>
#include "nRF24L01.h"
#include "RF24.h"
#include <Adafruit_NeoPixel.h>



#define BTN_CONNECT 4
#define LED_CONNECT 3

Adafruit_NeoPixel connectionLED(1, LED_CONNECT, NEO_GRB + NEO_KHZ800);
RF24 radio(7, 8);
const byte address[6] = "00002";
const byte addressWrite[6] = "00010";
boolean connectedToHub = false;
int r = 0;
int g = 0;
int b = 0;

Adafruit_NeoPixel light(24, 6, NEO_GRB + NEO_KHZ800);


void setup() {
  // put your setup code here, to run once:

  connectionLED.begin();
  connectionLED.setPixelColor(0, connectionLED.Color(255, 0, 0));
  connectionLED.show();
  radio.begin();
  radio.setDataRate(RF24_2MBPS);
  radio.openWritingPipe(addressWrite);
  Serial.begin(115200);
  //  radio.openReadingPipe(0, address);
  pinMode(BTN_CONNECT, INPUT_PULLUP);

  light.begin(); // Initialize NeoPixel strip object (REQUIRED)
  light.show();  // Initialize all pixels to 'off'
}

void loop() {


  if (!connectedToHub)
  {
    if (!digitalRead(BTN_CONNECT))
    {
      connectionLED.setPixelColor(0, connectionLED.Color(255, 255, 255));
      connectionLED.show();
      while (!digitalRead(BTN_CONNECT));
      int sender = 1;
      radio.write(&sender, sizeof(int));

      connectionLED.setPixelColor(0, connectionLED.Color(0, 0, 255));
      connectionLED.show();
      radio.openReadingPipe(0, address);
      radio.startListening();
      while (!radio.available());
      if (radio.available())
      {
        boolean temp = true;
        radio.read(&temp, sizeof(boolean));
        connectionLED.setPixelColor(0, connectionLED.Color(0, 255, 0));
        connectionLED.show();
        connectedToHub = true;
        radio.openReadingPipe(0, address);
        radio.startListening();
      }
    }
    else
    {
      connectionLED.setPixelColor(0, connectionLED.Color(255, 0, 0));
      connectionLED.show();
    }
  }


  else
  {
    radio.openReadingPipe(0, address);
    radio.startListening();
    if (radio.available())
    {
      char k[11];
      radio.read(&k, sizeof(k));
      String rs = "";
      rs += k[0];
      rs += k[1];
      rs += k[2];
      String gs = "";
      gs += k[3];
      gs += k[4];
      gs += k[5];
      String bs = "";
      bs += k[6];
      bs += k[7];
      bs += k[8];
      r = rs.toInt();
      g = gs.toInt();
      b = bs.toInt();

    }
    for (int i = 0; i < 24; i++)
    {
      light.setPixelColor(i, connectionLED.Color(r, g, b));
    }
    light.show();
    connectionLED.setPixelColor(0, connectionLED.Color(0, 255, 0));
    connectionLED.show();
  }



}
