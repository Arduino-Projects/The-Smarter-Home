#include <SPI.h>
#include "nRF24L01.h"
#include "RF24.h"
#include <Adafruit_NeoPixel.h>


#define BTN_CONNECT 4
#define LED_CONNECT 3

Adafruit_NeoPixel connectionLED(1, LED_CONNECT, NEO_GRB + NEO_KHZ800);
RF24 radio(7, 8);
const byte addressRelay[6] = "00001";
const byte addressRGB[6] = "00002";
const byte addressLock[6] = "00003";
const byte addressDoorbell[6] = "00004";
const byte addressRead[6] = "00010";
boolean reading = false;


void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  Serial3.begin(9600);
  connectionLED.begin();
  connectionLED.setPixelColor(0, connectionLED.Color(0, 255, 0));
  connectionLED.show();
  radio.begin();
  radio.setDataRate(RF24_2MBPS);
  //  radio.openWritingPipe(addressWrite);
  radio.openReadingPipe(0, addressRead);
  radio.startListening();
  pinMode(BTN_CONNECT, INPUT_PULLUP);
}

void loop() {
  // put your main code here, to run repeatedly:
  if (!digitalRead(BTN_CONNECT))
  {
    connectionLED.setPixelColor(0, connectionLED.Color(0, 0, 255));
    connectionLED.show();
    if (!reading)
    {
      radio.openReadingPipe(0, addressRead);
      radio.startListening();
      reading = true;
    }
    if (radio.available())
    {
      int check;
      radio.read(&check, sizeof(int));
      delay(900);
      if (check == 1)
      {
        Serial3.print('b');
        radio.stopListening();
        radio.openWritingPipe(addressRGB);
        delay(100);
        boolean temp = true;
        radio.write(&temp, sizeof(boolean));
      }
      if (check == 2)
      {
        Serial3.print('a');
        radio.stopListening();
        radio.openWritingPipe(addressRelay);
        delay(100);
        boolean temp = true;
        radio.write(&temp, sizeof(boolean));
      }
      if (check == 3)
      {
        Serial3.print('c');
        radio.stopListening();
        radio.openWritingPipe(addressLock);
        delay(100);
        boolean temp = true;
        radio.write(&temp, sizeof(boolean));
      }
      if (check == 4)
      {
        Serial3.print('d');
        radio.stopListening();
        radio.openWritingPipe(addressDoorbell);
        delay(100);
        boolean temp = true;
        radio.write(&temp, sizeof(boolean));
      }
    }
    else
    {
      reading = false;
      connectionLED.setPixelColor(0, connectionLED.Color(0, 255, 0));
      connectionLED.show();
    }
  }
  if (Serial3.available())
  {
    String s = Serial3.readString();

    if (s.charAt(0) == '1')
    {
      int sending = s.substring(1, 2).toInt();
      Serial.println(sending);
      radio.stopListening();
      radio.openWritingPipe(addressRelay);
      radio.write(&sending, sizeof(int));
    }
    if (s.charAt(0) == '2')
    {
      radio.stopListening();
      radio.openWritingPipe(addressRGB);
      char k[11];
      s.substring(1,11).toCharArray(k,10);
      radio.write(&k, sizeof(k));
    }
    if (s.charAt(0) == '3')
    {
      int sending = s.substring(1, 2).toInt();
      Serial.println(sending);
      radio.stopListening();
      radio.openWritingPipe(addressLock);
      radio.write(&sending, sizeof(int));
    }
    radio.openReadingPipe(0, addressRead);
    radio.startListening();

  }

  if (radio.available())
  {
    int readIn;
    radio.read(&readIn, sizeof(int));
    if (readIn == 5)
    {
      Serial3.print("e");
    }
  }


}
