// ****************************
// Typewriter 2013 - Settings
// ****************************

// Nothing needs to be changed in this file.
// All parameters can now be controlled directly through the Player patch.

Buffer.freeAll;

b = (); // <== Buffers will be stored here
b.media = (~folderPath++"Sounds/"++~soundFolder++"/*.wav").pathMatch.collect { |i| Buffer.read(s, i)};

// Create a SynthDef to play samples
SynthDef("qwerty-sample-playback", {
	arg bufnum = 0, rate = 1; // just give it a default value
	var out;
	//	out = SinOsc.ar(freq)*0.1;
	out = PlayBuf.ar(2, bufnum, rate, doneAction: 2);
	Out.ar(0, out)
}).add;

// some global variables

~rate = 1.0; // global variable (will hold current playback rate)

["number of samples", b.media.size].postln;
["player name", ~playerName].postln;
"File loaded successfully".postln;
" ".postln;

// Test
// {PlayBuf.ar(2, b.media[rrand(0, (b.media.size-1))])}.play; // number of channels and buffer



