// ********************************
// "Wherever We Are"
// Concert Intro
// June 6, 2013
// ********************************

~playerName = "/player1" ;
~soundFolder = "Bells"; // Prepared Piano sounds
~folderPath = "/home/lork/Music/SuperCollider/Typewriter-2013/";
~serverAddress = NetAddr("127.0.0.1", 57120); // address of Bruno's computer
(~folderPath++"Typewriter_Settings.scd").load;
Window.closeAll;
(~folderPath++"Typewriter_Window.scd").load; // open the window for typing
~transp = rrand(0.9,1.1);

// END OF FILE


