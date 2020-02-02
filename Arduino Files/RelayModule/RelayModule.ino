#include <SPI.h>
#include "nRF24L01.h"
#include "RF24.h"
#include <Adafruit_NeoPixel.h>


#define BTN_CONNECT 4
#define LED_CONNECT 3
#define RELAY_PIN 2

Adafruit_NeoPixel connectionLED(1, LED_CONNECT, NEO_GRB + NEO_KHZ800);
RF24 radio(7, 8);
const byte address[6] = "00001";
const byte addressWrite[6] = "00010";
boolean connectedToHub = false;


void setup() {
  // put your setup code here, to run once:

  connectionLED.begin();
  connectionLED.setPixelColor(0, connectionLED.Color(255, 0, 0));
  connectionLED.show();
  radio.begin();
    radio.setDataRate(RF24_2MBPS);
  radio.openWritingPipe(addressWrite);
  
//  radio.openReadingPipe(0, address);
  pinMode(BTN_CONNECT, INPUT_PULLUP);
  pinMode(RELAY_PIN, OUTPUT);
}

void loop() {
  if (!connectedToHub)
  {
    if (!digitalRead(BTN_CONNECT))
    {
      connectionLED.setPixelColor(0, connectionLED.Color(255, 255, 255));
      connectionLED.show();
      while (!digitalRead(BTN_CONNECT));
      int sender = 2;
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
      int k;
      radio.read(&k, sizeof(k));

      if(k == 1)
      {
        digitalWrite(RELAY_PIN, HIGH);
      }
      else if(k == 0)
      {
        digitalWrite(RELAY_PIN, LOW);
      }
    }
    connectionLED.setPixelColor(0, connectionLED.Color(0, 255, 0));
    connectionLED.show();
  }



}
