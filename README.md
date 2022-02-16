# BJT-Curve-tracer---Arduino
 The project is on a simple Output characteristic curve tracer for the BJT or MOSFET implemented using Arduino.

**Arduino File:** 
The Baud rate is set as 9600. The loop initiates only in arrival of the value ‘H’ from the Processing app. Digital pin5 is used to generate triangular wave. The PWM wave is increased in step of 4 from 0 to 255 and when it reaches 255 it is then decreased. At digital input pin 3 it is used to give it to the base. The PWM value is increased in 5 step for five output characteristic curves.

**Processing App code: **
This is used to create file and save the values obtained from the Arduino. It open a file and saves the data when the key ‘s’ is pressed. When ‘w’ is pressed it writes the corresponding data into the file. This file is later accessed by the Scilab and the graph is plotted.

**Scilab Code to plot:**
The .mat file is accessed and the corresponding scales are adjusted to get the value of the reading.
