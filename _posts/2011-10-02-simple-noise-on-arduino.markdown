---
layout: post
title:  "Simple noise on the arduino"
date: 2011-10-02T21:04:00+02:00
categories: arduino music sound
---

Inspired by the <a href="http://www.motherboard.tv/2011/9/29/minimalism-worship-these-sweet-loops-were-made-with-only-one-line-of-code">minimalists</a> I tried this out on the arduino:<br><br><br>
int speakerPin = 11;<br><br>
void outp(byte value) {<br>
    analogWrite(speakerPin, value); delayMicroseconds(200);<br>
}<br><br>
void setup() {<br>
    pinMode(speakerPin, OUTPUT);<br><br><br>
    // Set up Timer 2 to do pulse width modulation on the speaker<br>
    // pin.<br><br>
    // Use internal clock (datasheet p.160)<br>
    ASSR &amp;= ~(_BV(EXCLK) | _BV(AS2));<br><br>
    // Set fast PWM mode  (p.157)<br>
    TCCR2A |= _BV(WGM21) | _BV(WGM20);<br>
    TCCR2B &amp;= ~_BV(WGM22);<br><br>
    // Do non-inverting PWM on pin OC2A (p.155)<br>
    // On the Arduino this is pin 11.<br>
    TCCR2A = (TCCR2A | _BV(COM2A1)) &amp; ~_BV(COM2A0);<br>
    TCCR2A &amp;= ~(_BV(COM2B1) | _BV(COM2B0));<br><br>
    // No prescaler (p.158)<br>
    TCCR2B = (TCCR2B &amp; ~(_BV(CS12) | _BV(CS11))) | _BV(CS10);<br><br>
}<br><br>
void loop() {<br>
  int t;<br>
  for(t=0;;t++){ outp(t*((t&gt;&gt;12|t&gt;&gt;8)&amp;63&amp;t&gt;&gt;4)); }<br>
}<br><br>
It does sound somewhat similar. So right now it's just a hack in order to try it out.<br><br>
Note:<br>
The code above is corrected with a little help from <a href="http://forskningsavd.se/">Davey at forsken</a>.
<div style="clear: both;"></div>