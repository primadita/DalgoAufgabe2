DalgoAufgabe2: Simulate Waves
===================

This is a project authored by **Jan-Tjorben Arning, Helen Heinermann, Felicia Primadita** as a part of the second group assignment on the major: Data and Algorithm (*deutsch: Daten und Algorithmen*) for the summer semester 2015.

###Aim of the project
The project provides the optical simulation of several sinusoidal acoustic sources embedded in a graphical user interface. The frequency, amplitude and phase of each of the sources are changeable parameters. In addition, it is possible to show the waveform at any chosen point as a line plot as a function of time. 

###How does the project work?
The project uses the parameters (frequency, amplitude and phase) to at first form a simple sinusoidal wave over time. Now the wave will be spread into a circular wave and plot in 3 dimensions x, y and z. X and y span a surface that is shown from above. If there are several waves their interference will be implied into the computations.The third dimension z is encoded in a grey scale that symbolizes the amplitude at each place, whereas white represents a crest and black represents a trough. If you want to create a circular wave without the GUI, you can use the function ***kreiswelle.m*** and if you want to manually combine several waves without the GUI use the function ***interferenz.m***

###What do I need to be able to execute the program?

To be able to run the datas, you need MATLAB (from R2013).

###Installation instruction

If you need any version of MATLAB, then you can find the software also online here:  [MATLAB](http://de.mathworks.com/products/matlab/whatsnew.html?s_tid=tb_15a).

###Instruction Manual
 1. Execute simulateWavesMain.m in MATLAB.
 
 2. When the GUI has appeared on the screen, you will be asked how many sources you want to use in the first place. Type in the number of sources and click on the ***OK*** - button.
 
 3. Now you can set the parameters frequency, amplitude and phase on the right side of the GUI and then click on the ***Start***-button. The simulation will start.
 
 4. While the simulation is running, a line plot of the waveform at any chosen point can be depicted. Therefore, click on the  ***Line plot***-button and choose a position. The line plot axes on the lower right of the GUI will now show the waveform as a function of time at the chosen position.
 
 5. If you want to add a source, you can use the *** Add source ***-button, which can be found on the right top of the GUI.
 
 6. If you change the parameters frequency, amplitude or phase in running process, click start again and the simulation will be updated instantly with the new settings.
  

###Usage Examples
1. Open MATLAB. 

2. Type in the command window: simulateWavesMain

3. A Graphical User Interface will appear on the screen. 

4. An input window will appear on screen asking how many sources you want to use. You have to put a number, you will be prompted to enter a new number. Maximum number of sources is ten. If you put more than ten, a question dialogue will appear on the screen asking you, whether you want to put a new number. By clicking yes, you are able to put in a new number, by clicking no, the number of sources is fixed to ten. If you put in "2" as number of sources, you are allowed to fix two different positions by clicking on the left simulation window. Click on the ***start***- button and the simulation will start.

5. If you want to add a source, make sure, you have started the simulation before. Then, click on the ***Add sources***-button. By clicking on the left simulation window, you can choose the position of the new source. The simulation will be updated instantly. The parameters can be changed (see example 7) .

6. If you want to look at a line plot, click on the ***Line plot***-button. Then click on the simulation window to choose the position you want to look at. The line plot will appear on screen in a plotting box beside the main plotting box. It is only possible to line plot while the simulation is running. Otherwise, an error dialogue will appear on the screen. If you want to change the position of the line plot you can click on the ***Line plot***-button again and repeat the procedure at another position. 

7. If you want to change some parameters, you just need to determine your new frequency, amplitude, and phase of the desired source into the edit windows on the right. For example: Source 1- f: 50 and source 3 - A: 1.6. Click on the ***Start***-button again to update the simulation.

###License

Simulate Waves Project is a free project; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.  See the GNU General Public License for more details: e.g. in the file 'GNU-GPL' that follows with this TIMIT MIT Project or at http://www.gnu.org/licenses/gpl
