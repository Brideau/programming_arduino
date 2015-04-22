// sketch 08-01
#include <avr/pgmspace.h>
int ledPin = 13;
int dotDelay = 200;

const PROGMEM char sA[]  = ".-";
const PROGMEM char sB[]  = "-...";
const PROGMEM char sC[]  = "-.-.";
const PROGMEM char sD[]  = "-..";
const PROGMEM char sE[]  = ".";
const PROGMEM char sF[]  = "..-.";
const PROGMEM char sG[]  = "--.";
const PROGMEM char sH[]  = "....";
const PROGMEM char sI[]  = "..";
const PROGMEM char sJ[]  = ".---";
const PROGMEM char sK[]  = "-.-";
const PROGMEM char sL[]  = ".-..";
const PROGMEM char sM[]  = "--";
const PROGMEM char sN[]  = "-.";
const PROGMEM char sO[]  = "---";
const PROGMEM char sP[]  = ".--.";
const PROGMEM char sQ[]  = "--.-";
const PROGMEM char sR[]  = ".-.";
const PROGMEM char sS[]  = "...";
const PROGMEM char sT[]  = "-";
const PROGMEM char sU[]  = "..-";
const PROGMEM char sV[]  = "...-";
const PROGMEM char sW[]  = ".--";
const PROGMEM char sX[]  = "-..-";
const PROGMEM char sY[]  = "-.--";
const PROGMEM char sZ[]  = "--..";

const PROGMEM char* const letters[] = {sA, sB, sC, sD, sE, sF, sG, sH, sI, sJ, sK, sL, sM,
                                sN, sO, sP, sQ, sR, sS, sT, sU, sV, sW, sX, sY, sZ};

const PROGMEM char s0[]  = "-----";
const PROGMEM char s1[]  = ".----";
const PROGMEM char s2[]  = "..---";
const PROGMEM char s3[]  = "...--";
const PROGMEM char s4[]  = "....-";
const PROGMEM char s5[]  = ".....";
const PROGMEM char s6[]  = "-....";
const PROGMEM char s7[]  = "--...";
const PROGMEM char s8[]  = "---..";
const PROGMEM char s9[]  = "----.";


const PROGMEM char* const numbers[] = {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9};

char buffer[6];

void setup()                 
{
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);
}

void loop()                    
{
  char ch;
  if (Serial.available() > 0)
  {
    ch = Serial.read();
    if (ch >= 'a' && ch <= 'z')
    {
      strcpy_P(buffer, (char*)pgm_read_word(&(letters[ch - 'a'])));
      flashSequence(buffer);
    }
    else if (ch >= 'A' && ch <= 'Z')
    {
      strcpy_P(buffer, (char*)pgm_read_word(&(letters[ch - 'A'])));
      flashSequence(buffer);
    }
    else if (ch >= '0' && ch <= '9')
    {
      strcpy_P(buffer, (char*)pgm_read_word(&(letters[ch - '0'])));
      flashSequence(buffer);
    }
    else if (ch == ' ')
    {
      delay(dotDelay * 4);  // gap between words  
    }
  }
}

void flashSequence(char* sequence)
{
   int i = 0;
   while (sequence[i] != NULL)
   {
       flashDotOrDash(sequence[i]);
       i++;
   }
   delay(dotDelay * 3);    // gap between letters
}

void flashDotOrDash(char dotOrDash)
{
  digitalWrite(ledPin, HIGH);
  if (dotOrDash == '.')
  {
    delay(dotDelay);           
  }
  else // must be a dash
  {
    delay(dotDelay * 3);           
  }
  digitalWrite(ledPin, LOW);    
  delay(dotDelay); // gap between flashes
}

