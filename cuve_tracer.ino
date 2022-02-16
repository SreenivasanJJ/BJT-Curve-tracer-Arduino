int tri = 5; // TriAngle Wave at D5
int vg = 3; // Voltage step port at D3
int j = 0; // Tri value
int k = 0; // Step Value
int slope = 4;
int incomingByte; // read incoming serial data into
void setup()
{ 
	Serial.begin( 9600); // initialize serial communication:
	pinMode( tri, OUTPUT);
	pinMode( vg, OUTPUT);
} // setup
void loop()
{ 
	if (Serial.available() > 0) // see if incoming serial data:
	{
		incomingByte = Serial.read(); // read oldest byte in serial buffer:
	} // if (Serial.available() > 0)
	if (incomingByte == 'H') // if H (ASCII 72), printoutput
	{ 
		delay( 10);
		j = j+slope;
		analogWrite( tri, j); // will be PWM 488 Hz
		analogWrite( vg, k); // will be PWM 488 Hz
		Serial.print( analogRead(0)); // read current at A0
		Serial.print( " ");
		Serial.println( analogRead(1)); // read tri voltage at A1
		delay( 10); // to stabilize adc:
		if (j > 251) slope = -4 ;
		if (j < 1)
		{ 
			slope = 4 ;
			k = k + int(255/5);
		} // if (j > 251) slope = -4 ;
		if (k > 255 ) k = 0 ;
	} // if (incomingByte == 'H')
} // loop()
