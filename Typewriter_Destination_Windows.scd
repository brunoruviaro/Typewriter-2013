// ***************************************
// Typewriter 2013 - DESTINATION WINDOW
// ***************************************

// Destination Window Display
// TextWindows receiving OSC messages from other players

NetAddr.langPort
s.boot;
s.quit;
Window.closeAll;

// Evaluate the region below. It should create a single big window, filling up the whole screen, with as many text views as players defined by hand in the array "typewriter".

(

// Create array of players
var typewriter = [
	"player1",
	"player2",
	"player3",
	"player4",
	"player5",
	"player6",
	"player7"
	"player8"];

// Create array of colors for TextView background (comment out for default white)
var colors = [
	/*Color.new255(255,222,173),
	Color.new255(240,240,230),
	Color.new255(205,200,177),
	Color.new255(238,232,205),
	Color.new255(240,247,226)*/];

// Create the function that will mass-create TextViews
~createTextWindows = {
	arg playername, color = Color.new255(255,255,255), fontsize = 40, win;
	var tex, responder;
	tex = TextView(win.view, 250@300);
	tex.font_(Font("Courier",fontsize));
	tex.background_(color);
	tex.editable_(false);
	tex.hasVerticalScroller_(false);
	responder = OSCFunc({ arg msg; {tex.string = msg[1].asString}.defer; }, "/"++playername.asSymbol, n);
	};

// Close older windows first
Window.closeAll;

// Create new window
w = Window.new("fullscreen", Window.screenBounds).front;
w.background = Color.new255(255,255,255); //Color.white;

// The numbers are the gaps and margins between objects inside window
w.view.decorator = FlowLayout( w.view.bounds, 10@10, 20@20 );

// Create all TextWindows
typewriter.do( { arg item, i;
	~createTextWindows.value(
		playername: item,
		color: colors[i],
		fontsize: 40,
		win: w)});

z = typewriter; // just for testing with local OSC below; useless otherwise.

)

// ================================================

Window.closeAll

// testing with local OSC messages...
~here = NetAddr("127.0.0.1", NetAddr.langPort);
~here.sendMsg("/player1", "test");

// automated testing with local OSC messages...
z.do( { arg item, i;  SystemClock.sched(0,{NetAddr("127.0.0.1", NetAddr.langPort).sendMsg("/"++item, 8888.rand); 2.0.rand})  });

SystemClock.clear;

// unused, but kept here just because:
// number of players
~numberOfPlayers = 8;
// width and height of screen
~screenWidth = Window.screenBounds.width;
~screenHeight = Window.screenBounds.height;

