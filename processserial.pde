import processing.serial.*;
PrintWriter output; // output file
Serial myPort; // The serial port
int xPos = 1; // hor position graph
void setup ()
{ 
	size( 300, 300); // set the window size:
	println(Serial.list()[0]); // List serial ports
	myPort = new Serial(this, Serial.list()[0], 9600 ); // initialize to 9600 baud
	myPort.bufferUntil('\n'); // serialEvent() @ \n:
	background( 0); // set inital background:
	println( "Click on image and hit s to start"); // will start serial data
	println( "Hit w to write to file"); // dump to file ad stop
	String file = String.valueOf(year());
	file = file +"."+String.valueOf(month());
	file = file +"."+String.valueOf(day());
	file = file +"."+String.valueOf(hour());
	file = file +"."+String.valueOf(minute());
	file = file +"."+String.valueOf(second())+".mat";
	println( file);
	output = createWriter(file); // Sketch->Show_Sketch_fie
} // setup
void draw ()
{
	if( keyPressed)
	{
		if (key == 's' || key == 'S')
		{ 
			myPort.write( "H");
		} //if (key == 's' || key == 'S')
		if (key == 'w' || key == 'W')
		{ 
			output.flush(); // Writes the remaining data to the file
			output.close(); // Finishes the file
			exit(); // Stops the program
		} // if (key == 'w' || key == 'W')
	} // if( keyPressed)
} // draw ()
void serialEvent (Serial myPort)
{ 
	String inString = myPort.readStringUntil('\n'); // get the ASCII string:
	if (inString != null)
	{
		inString = trim(inString); // trim whitespace:
		int[] vv = int(split(inString, ' '));
		// println( inString );
		output.println( inString );
		float val0 = float(vv[0]);
		float val1 = float(vv[1]);
		val0 = map(val0, 0, 1023, 0, height*.95);
		val1 = map(val1, 0, 1023, 0, height*.95);
		stroke( 127,34,255); // color to draw
		line( val1, height - val0-1, val1+1, height - val0); // draw the line:
		if (xPos >= 6*width)
			{
			 xPos = 0; // auto redraw
			background( 0);
			} // if (xPos >= 2*width)
		else
			{
			 xPos= xPos+1;
			} // else
	} // if (inString != null)
} // serialEvent (Serial myPort)
