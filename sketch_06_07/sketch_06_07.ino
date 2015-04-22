//sketch 06-07

#include <Bounce2.h>

int inputPin = 5;
int ledPin = 13;

int ledValue = LOW;
Bounce bouncer = Bounce();

void setup() {
 pinMode(ledPin, OUTPUT);

 pinMode(inputPin, INPUT);
 digitalWrite(inputPin, HIGH);
 
 bouncer.attach(inputPin);
 bouncer.interval(5);
}

void loop() {
  if (bouncer.update() && bouncer.read() == LOW) {
   ledValue = ! ledValue;
   digitalWrite(ledPin, ledValue);
  }
}
