#include <Servo.h>
#include <SPI.h>
#include "nRF24L01.h"
#include "RF24.h"
#include <Adafruit_NeoPixel.h>


#define BTN_CONNECT 4
#define LED_CONNECT 3
#define LOCK_PIN 6

Adafruit_NeoPixel connectionLED(1, LED_CONNECT, NEO_GRB + NEO_KHZ800);
RF24 radio(7, 8);
Servo lock;
const byte address[6] = "00003";
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

  lock.attach(LOCK_PIN);
  lock.write(20);
  //  radio.openReadingPipe(0, address);
  pinMode(BTN_CONNECT, INPUT_PULLUP);
}

void loop() {
  if (!connectedToHub)
  {
    if (!digitalRead(BTN_CONNECT))
    {
      connectionLED.setPixelColor(0, connectionLED.Color(255, 255, 255));
      connectionLED.show();
      while (!digitalRead(BTN_CONNECT));
      int sender = 3;
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

      if (k == 1)
      {
        lock.write(160);
      }
      else if (k == 0)
      {
        lock.write(20);
      }
    }
    connectionLED.setPixelColor(0, connectionLED.Color(0, 255, 0));
    connectionLED.show();
  }



}
