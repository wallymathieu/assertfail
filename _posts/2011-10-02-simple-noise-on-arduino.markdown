---
layout: post
title:  "Simple noise on the arduino"
date: 2011-10-02T21:04:00+02:00
tags: arduino music sound
---

Inspired by the [minimalists](http://www.motherboard.tv/2011/9/29/minimalism-worship-these-sweet-loops-were-made-with-only-one-line-of-code) I tried this out on the arduino:  
  
```c++
int speakerPin = 11;  
  
void outp(byte value) {  
    analogWrite(speakerPin, value); delayMicroseconds(200);  
}  
  
void setup() {  
    pinMode(speakerPin, OUTPUT);  
  
  
    // Set up Timer 2 to do pulse width modulation on the speaker  
    // pin.  
  
    // Use internal clock (datasheet p.160)  
    ASSR &= ~(\_BV(EXCLK) | \_BV(AS2));  
  
    // Set fast PWM mode  (p.157)  
    TCCR2A |= \_BV(WGM21) | \_BV(WGM20);  
    TCCR2B &= ~\_BV(WGM22);  
  
    // Do non-inverting PWM on pin OC2A (p.155)  
    // On the Arduino this is pin 11.  
    TCCR2A = (TCCR2A | \_BV(COM2A1)) & ~\_BV(COM2A0);  
    TCCR2A &= ~(\_BV(COM2B1) | \_BV(COM2B0));  
  
    // No prescaler (p.158)  
    TCCR2B = (TCCR2B & ~(\_BV(CS12) | \_BV(CS11))) | \_BV(CS10);  
  
}  
  
void loop() {  
  int t;  
  for(t=0;;t++){ outp(t\*((t>>12|t>>8)&63&t>>4)); }  
}  
```

It does sound somewhat similar. So right now it's just a hack in order to try it out.  
  
Note:  
The code above is corrected with a little help from [Davey at forsken](http://forskningsavd.se/).