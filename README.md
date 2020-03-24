<p align="center"><img src="https://raw.githubusercontent.com/electroplankton/atmux/master/image.png"></p>
<h3 align="center">autotmux</h3>
<p align="center">written in 50~ bash lines</p>
launch: `./start.sh atscript.at`

.at file formatting:

There are 3 commands, 
  - pane [int] -> changes the active pane
  - split [v|h] -> splits the selected pane vertically or horizontally
  - start [string] -> command to execute.
  
It will initially launch with a couple errors, you can ignore them (mabye)
