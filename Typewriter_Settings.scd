// *********************************
// Typewriter 2013 - Settings
// Last updated on April 18, 2013
// *********************************

// Nothing needs to be changed in this file.
// All parameters can now be controlled directly through the Player patch.
// Accepts both mono and stereo samples. Calls appropriate Synth accordingly.
// Master Volume control available (controllable from main Player patch).

Buffer.freeAll;

b = (); // <== Buffers will be stored here
b.media = (~folderPath++"Sounds/"++~soundFolder++"/*.wav").pathMatch.collect { |i| Buffer.read(s, i)};

// Create a SynthDef to play samples (NOTE:
SynthDef("qwerty-mono-sample-playback", {
	arg bufnum = 0, rate = 1; // default values
	var out;
	//	out = SinOsc.ar(freq)*0.1;
	out = PlayBuf.ar(1, bufnum, rate, doneAction: 2);
	Out.ar(0, out)
}).add;

SynthDef("qwerty-stereo-sample-playback", {
	arg bufnum = 0, rate = 1; // default values
	var out;
	//	out = SinOsc.ar(freq)*0.1;
	out = PlayBuf.ar(2, bufnum, rate, doneAction: 2);
	Out.ar(0, out)
}).add;

["Player Name: " ++ ~playerName].postln;
["Number of Samples Loaded Successfully: " ++ b.media.size].postln;
if((b.media.size == 0), {"ERROR: No sound files were loaded. Wrong folder?".postln});
" ".postln;

SynthDef("masterAmp", {arg inbus = 0, amp = 1;
     ReplaceOut.ar(inbus, In.ar(inbus, 2) * amp);
     }).add;

~masterAmp = Synth("masterAmp", target: 0, addAction: \addToTail);

// Test
// {PlayBuf.ar(2, b.media[rrand(0, (b.media.size-1))])}.play; // number of channels and buffer
//////////////////////

//b.media.size