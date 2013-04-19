// ********************************
// Typewriter 2013 - Player patch
// Last updated on April 18, 2013
// ********************************

// Checklist
//
// 0. Start the SC Server (if you haven't already) with Ctrl+B.
// 1. Make sure you are connected to the network.
// 2. Make sure your name & sound folder are correct in the lines below.
//    Your custom samples should be in a folder inside the Sounds folder.
//    Name your files a.wav, b.wav, c.wav etc in order to map sounds to letters.
//    Both mono and stereo samples are accepted.
// 3. Select all text in this file and evaluate. The typing window should pop up.
//    If typing window does not show up, try Alt+Tab to look for it behind other windows.
// 4. Bring the volume up in the audio interface.
//
// Shortcut for 'evaluate' is Ctrl + Enter

~playerName = "/player1" ; // player1, player2, etc; with slash & double quotes. Example: "/player1"

~soundFolder = "Drums"; // name of the folder with samples. Example: "Drums"

~folderPath = "/home/lork/Music/SuperCollider/Typewriter-2013/"; // path to Typewriter folder

~serverAddress = NetAddr("127.0.0.1", 57120); // address of main computer (to which messages are sent)

(~folderPath++"Typewriter_Settings.scd").load; // load some settings

Window.closeAll;

s.meter; // open the meter window

(~folderPath++"Typewriter_Window.scd").load; // open the window for typing

// Transposition factor available below
// 1 means "no transposition"
// 2 is one octave above
// 0.5 is one octave below etc.
// You can also try something like {rrand(1.0,2)} to give each note a brand new random factor.
// You can change transposition in the middle of performance (no need to re-evaluate all lines).

~transp = 1;

// Setting a Master Amplitude below 1 may be useful if you are playing
// many samples at the same time and getting distorted results.

~masterAmp.set(\amp, 1);

// END OF FILE


