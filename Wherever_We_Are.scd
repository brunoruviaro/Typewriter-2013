// ********************************
// "Wherever We Are"
// Concert Intro
// June 6, 2013
// ********************************

~playerName = "/player2" ;
~soundFolder = "Bells"; // Prepared Piano sounds
~folderPath = "/home/lork/Music/SuperCollider/Typewriter-2013/";
~serverAddress = NetAddr("127.0.0.1", 57120); // address of Bruno's computer
(~folderPath++"Typewriter_Settings.scd").load;
//Window.closeAll;
(~folderPath++"Typewriter_Window.scd").load; // open the window for typing
~transp = rrand(0.9,1.1);
"there we go!".postln;
// END OF FILE




/*

ORDER OF LAPTOPS ON STAGE:

13  11  6  4  1  8  5  10  3  2

This is what you should write on the first line above (~playerName):

Laptop 13 is "/player1";
Laptop 11 is "/player2";
Laptop 6 is "/player3";
Laptop 4 is "/player4";
Laptop 1 is "/player5";
Laptop 8 is "/player6";
Laptop 5 is "/player7";
Laptop 10 is "/player8";
Laptop 3 is "/player9";
Laptop 2 is "/player10";

*/
