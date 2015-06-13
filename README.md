DalgoAufgabe2: Simulate Waves
===================

This is a project authored by **Jan-Tjorben Arning, Felicia Primadita, and Helen Heinermann,** as a part of the second group assignment on the major: Data and Algorithm (*deutsch: Daten und Algorithmen*) for the summer semester 2015.

###Aim of the project
The project shall provide the optical simulation of several sinusoidal acoustic sources embedded in a graphical user interface. The frequency, amplitude and phase of each of the sources shall be changeable parameters. In addition it shall be possible to show the waveform at any chosen point as a line plot over time. 

###How does the project work?
The project uses the parameters (frequency, amplitude and phase) to at first form a simple sinusoidal wave over time. Now the wave will be spread into a circular wave and plot in 3 dimensions x, y and z. X and y span a surface that is shown from above. If there are several waves their interference will be implied into the computations.The third dimension z is encoded in a grey scale that symbolizes the amplitude at each place. If you want to create a circular wave without the GUI you can use the function ***kreiswelle.m*** and if you want to manually combine several waves without the GUI use the function ***interferenz.m***

###What do I need to be able to execute the program?

To be able to run the datas, you need MATLAB (up to R2013).

###Installation instruction

If you need any version of MATLAB, then you can find the software also online here:  [MATLAB](http://de.mathworks.com/products/matlab/whatsnew.html?s_tid=tb_15a).

###Instruction Manual
 1. Execute simulateWavesMain.m im MATLAB.
 
 2. When the GUI has appeared on the screen, there will appear an input dialogue on your screen, in which you will be asked how many sources you want to use in the first place. Type in the number of sources and click on the ***OK*** - button.
 
 3. Now you can set the parameters frequency, amplitude and phase on the right sight of the GUI and then click on the startbutton.The simulation will start.
 
 4. While the simulation is running a line plot of the waveform at any chosen point can be depicted. Therefore click on the  ***Line plot***-button and choose a position. The line plot box on the lower right of the GUI will now show the waveform over time at the chosen position.
 
 5. If you want to add a source, you can use the *** Add source ***-button, which can be found on the right top of the GUI.
 
 6. If you change the parameters frequency, amplitude or phase in running process, click start again and the simulation will be updated instantly with the new settings.
  

###Usage Examples
1. Open MATLAB. 

2. Type in the command window: simulateWavesMain

3. A Graphical User Interface will appear on the screen. 

4. An edit window will appear on screen asking how many sources you want to use. Type in a 2. Click on the plotting box twice to choose the positions of your two sound sources. Click on the startbutton and the simulation will start.

5. If you want to add a source, click on the ***Add sources***-button. By clicking on the plotting box you can choose the position of the new third source. The simulation will be updated instantly.

6. If you want to look at a line plot, click on the ***Line plot***-button. Then click on the plotting box to choose the position you want to look at. The line plot will appear on screen in a plotting box beside the main plotting box.

7. If you want to change some parameters, type in a new frequency for Source 1 (e.g. 50 Hz) and a new amplitude for source 3 (e.g. 1.6) into the edit windows on the right. Click on the ***Start***-button again to update the simulation

###License

Simulate Waves Project is free project; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.  See the GNU General Public License for more details: e.g. in the file 'GNU-GPL' that follows with this TIMIT MIT Project or at http://www.gnu.org/licenses/gpl
