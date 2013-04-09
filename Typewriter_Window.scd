// ****************************
// Typewriter 2013 - Window
// ****************************
//
// This file creates the typing window that
// - captures keystrokes
// - sends text to main computer
// - plays samples

(
var key_a = 97; // unicode for character "a"
var key_z = 122;  // unicode for character "z"
var key_A = 65; // unicode for character "A" (capital A)
var key_Z = 90; // unicode for character "Z" (capital Z)
var key_0 = 48; // unicode for character "0" (zero)
var key_9 = 57; // unicode for character "9" (nine)
var len = 350; // typing window size: length
var hi = 380; // typing window size: height

var win = Window.new("play as you type",Rect(500,Window.screenBounds.height-600,len,hi));
var tex = TextView(win.asView,Rect(10,10,len-20,hi-20)).focus(true);

var destination = ~serverAddress;  // main computer address

tex.keyDownAction =
	{arg view, char, modifiers, unicode, keycode;
	 var bufnum, this_rate;

	destination.sendMsg(~playerName, tex.string); // send this out before anything else...

	case
	   	{(unicode >= key_A) && (unicode <= key_Z)} {bufnum = unicode - key_A; this_rate=0.6}
		{(unicode >= key_a) && (unicode <= key_z)} {bufnum = unicode - key_a; this_rate=1}
		{(unicode >= key_0) && (unicode <= key_9)} {bufnum = rrand(0, b.media.size-1); this_rate=5}
		{(unicode >= 33) && (unicode <= 127)} {bufnum = rrand(0, b.media.size-1); this_rate=2}
		{true} {bufnum = -1}; // flag: not a letter nor number; don't play anything

         // ["key", unicode, "bufnum", b.media[bufnum], "rate", this_rate, "volume", ~amp].postln; // verbose
	 ["key", char, unicode].postln;

	 if( (bufnum != -1), {Synth("qwerty-sample-playback", [\bufnum, bufnum, \rate, this_rate])});
         // Synth("qwerty-sine-playback", [\freq, keyToFreq+rrand(1, 10), \amp, amp]);
	};
win.front;
tex.font_(Font("Courier",40));
tex.stringColor_(Color.black);
)
