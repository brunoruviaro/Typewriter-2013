~heig = 600;
~leng = 1200;
w =  Window.new("janelica",Rect(100,100,~leng,~heig));
w.front;

t = TextView(w.asView,Rect(10,10,~leng-20, 60));
t.string = ".";
t.font = Font("Arial",44);
t.stringColor = Color.red;


Window.closeAll

t.string = "Legalssscara de bananal";

t.setFont(Font("Arial", 20), 0, 5);


t.font = Font("Helvetica", 42);
t.stringColor = Color.red;

t.setString("12345", 0, 0);


(
u = Window.new("fullscreen", Window.screenBounds).front;
// change the gaps and margins to see how they work
u.view.decorator = FlowLayout( u.view.bounds, 10@10, 20@20 );
16.do{ Slider2D( u.view,80@80 ).background_( Color.rand ) };
)

(
u = Window.new("fullscreen", Window.screenBounds).front;
// change the gaps and margins to see how they work
u.view.decorator = FlowLayout( u.view.bounds, 10@10, 20@20 );
16.do{ TextView( u.view,210@200 ) };
)

///////////////
// START HERE
///////////////

// number of players
~numberOfPlayers = 8;

// width and height of screen
~screenWidth = Window.screenBounds.width;
~screenHeight = Window.screenBounds.height;

t.string_("uauauaua")
t.string = "come on";
t.font = Font("Arial", 55);
t.stringColor_(Color.red);


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
	//responder = OSCFunc({ arg msg; {tex.string = msg[1].asString}.defer; }, "/"++player.asSymbol, n);
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