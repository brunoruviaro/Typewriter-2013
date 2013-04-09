// ********************************
// Typewriter 2013 - Player patch
// ********************************

// Check list to get your set-up going:
// 0. Start the SC Server (if you haven't already) with Ctrl+B;
// 1. Make sure you are connected to the network;
// 2. Make sure your name & sound folder are correct in the lines below;
// 3. Bring the volume of your laptop all the way up;
// 4. Select all text in this file and evaluate. The typing window should pop up.
// Shortcut for 'evaluate' is: Shift+Return (Mac), Ctrl+E (Linux), Ctrl+Enter (Windows)


~playerName = "/player1" ; // player1, player2, etc; with slash & double quotes. Example: "/player1"
~soundFolder = "Bells"; // name of the folder with samples. Example: "Drums"
~folderPath = "/home/lork/Music/typewriter/"; // path to Typewriter folder
~serverAddress = NetAddr("127.0.0.1", 57120); // address of main computer (to which messages are sent)
(~folderPath++"Typewriter_Settings.scd").load; // load some settings
(~folderPath++"Typewriter_Window.scd").load; // open the window for typing

// All text preceded by two slashes are just comments. They don't do anything.
// END OF FILE
