DalgoAufgabe2: Simulate Waves
===================

This is a project authored by **Jan-Tjorben Arning, Helen Heinermann, Felicia Primadita** as a part of the second group assignment on the major: Data and Algorithm (*deutsch: Daten und Algorithmen*) for the summer semester 2015.

###Aim of the project
The project provides the optical simulation of several sinusoidal acoustic sources embedded in a graphical user interface (GUI). The frequency, amplitude and phase of each of the sources are changeable parameters. In addition, it is possible to show the waveform at any chosen point as a line plot as a function of time. 

###How does the project work?
The project uses the parameters (frequency, amplitude and phase) to at first form a simple sinusoidal wave over time. Now the wave will be spread into a circular wave and plot in 3-dimensional coordinate system X, Y and Z. X and Y span a surface that is shown from above. If there are several waves, their interference will be implied into the computations. The third dimension Z is encoded in a grey scale that symbolizes the amplitude at each place, whereas white represents a crest and black represents a trough. If you want to create a not-moving circular wave without the GUI, you can use the function ***circular_wave.m*** and if you want to manually combine several waves without the GUI, use the function ***interference.m***. See the instruction below.

###What do I need to be able to execute the program?

To be able to run the datas, you need MATLAB (from R2013).

###Installation instruction

If you need any version of MATLAB, then you can find the software also online here:  [MATLAB](http://de.mathworks.com/products/matlab/whatsnew.html?s_tid=tb_15a).

###Instruction Manual
 1. Execute **simulateWavesMain.m** in MATLAB.
 
 2. When the GUI has appeared on the screen, you will be asked how many sources you want to use in the first place. Type in the number of sources and click on the <kbd>**OK**</kbd>.
  >**IMPORTANT** : The edit field should be filled in with a number between 1 and 10.
  
 3. Now you can set the parameters frequency ```f```, amplitude ```A``` and phase ```P```  on the right side of the GUI and then click on the <kbd>**Start**</kbd>. The simulation will start.
 
 4. While the simulation is running, a line plot of the waveform at any chosen point can be depicted. Therefore, click on the  <kbd>**Line plot**</kbd> and choose a position. The line plot axes on the lower right of the GUI will now show the waveform as a function of time at the chosen position.
 
 5. If you want to add a source, you can use the <kbd>**Add source**</kbd>, which can be found on the right top of the GUI.
 >**NOTE** : It is ONLY POSSIBLE to add source, when the simulation has been started by clicking on <kbd>**Start**</kbd>.
 
 6. If you change the parameters frequency, amplitude or phase in running process, click <kbd>**Start**</kbd> again and the simulation will be updated instantly with the new settings.
  

###Usage Examples
1. Open MATLAB. 

2. Type in the command window: 
```simulateWavesMain```

3. A Graphical User Interface will appear on the screen. 

4. An input window will appear on screen, asking how many sources you want to use. 

	```How many sources do you want to have?```
	If you put in:  ```2``` , you are allowed to fix 2 different positions by clicking in any places on the left simulation window (the big white surface). Click on the <kbd>**Start**</kbd> and the simulation will start.
> You have to write in a number. Otherwise, you will be prompted to enter a new number. 
> The maximum number of sources is 10. If you put more than ```10```, a question dialogue will appear on the screen asking you, whether you want to put a new number. 
> >By clicking ```Yes```,you are able to put in a new number. 
> >By clicking ```No```, the number of sources is fixed to ten. 

5. If you want to add ONE source, make sure, you have started the simulation before. Then, click on the <kbd>**Add source**</kbd>. By clicking on the left simulation window, you can choose the position of the new source. The simulation will be updated instantly. The parameters can be changed (see example 7) .
> **IMPORTANT**: add a source one by one, which means: click on the <kbd>**Add source**</kbd>, fix your one desired source point, and then click again <kbd>**Add source**</kbd> and fix the other desired point.

6. If you want to look at a line plot, click on the <kbd>**Line plot**</kbd>. Then, click on the left simulation window to choose the position you want to look at. The line plot will appear on the screen in a smaller plotting box beside the main plotting box / left simulation window. 
> **NOTE**: 
> It is only possible to line plot while the simulation is running. Otherwise, an error dialogue will appear on the warning pannel beside the main simulation window. 

	> If you want to change the position of the line plot, you can click on the <kbd>**Line plot**</kbd> again and repeat the procedure at another position. 

7. If you want to change some parameters, you just need to determine your new frequency, amplitude, and phase of the desired source into the edit windows on the right. 
> EXAMPLE:
> **Source 1**
```f``` 50 ```A``` 1 ```P```0
**Source 3**
```f```150 ```A```1.6 ```P``` 

	Click on the <kbd>**Start**</kbd> again to update the simulation.

8. To just see how an acoustic wave looks like according to parameters: amplitude y0, frequency f, start angular phase phi0, and stepsize tau, use the circular_wave function z = circular_wave(y0,  f,  phi0,  tau,  idx_x,  idx_y). idx_x and _y represents the x- and y-coordinate of wave center.
```z = circular_wave(2, 30, 0.2, 0.1, 0, 10)```

9. To see how some waves interfere with each other, use the interference function z = interference(y0,  f,  phi0,  tau, n), whose inputs : amplitude y0, frequency f, start angular phase phi0, should be represented as vectors. Stepsize tau is the same for all waves. n is the desired number of waves. An example if you want to have 3 waves interfering:
```z = ìnterference([2 1 2], [500 150 300], [0.2 1 0.5], 0.1, 3)``` 
You will be then lead to a empty figure with white box, where you can determine where the center points of the waves should be.

###License

Simulate Waves Project is a free project; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.  See the GNU General Public License for more details: e.g. in the file 'GNU-GPL' that follows with this TIMIT MIT Project or at http://www.gnu.org/licenses/gpl
