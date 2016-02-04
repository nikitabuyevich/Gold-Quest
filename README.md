[![Gold Quest Logo](http://ijust.help/img/Just-Title.png)](http://nikitabuyevich.com/)

  A brave hero in search of five missing gold treasures. Developed in [GameMaker Language](http://docs.yoyogames.com/source/dadiospice/002_reference/001_gml%20language%20overview/index.html).

 > *Developed for* **Windows** *and* **OSX**.

## Download

To download the latest stable version, [click here](https://github.com/NikitaBuyevich/Gold-Quest/archive/master.zip) or use the following command:
```bash
git clone https://github.com/NikitaBuyevich/Gold-Quest.git
```
 
 
## Installation

If you want to mess around with the files you will need to:

* Download [GameMaker Studio](http://www.yoyogames.com/studio/download) (it's free)
* [Download](https://github.com/NikitaBuyevich/Gold-Quest/archive/master.zip) or clone the latest stable build with:
```bash
git clone https://github.com/NikitaBuyevich/Gold-Quest.git
```
* Import the project into GameMaker Studio


## Debug Commands
To open the debug console hit the **tilde (~)** key.
> **1/0** means input either **1** or **0**. **1 is true** and **0 is false**.

> **i** stands for **integer**, so input **any number**.

| Command | Description |
| --- | --- |
| **debug**, *1/0* | Enables the debug view which shows masks around objects and the states of the objects.|
| **origin_player** | Sets the coordinates of the player to 50,50. |
| **move_player**, *x*, *y* *(or to mouse location if unspecified)*| Teleports the player to specified coordinates x and y or if left blank, teleports them to where the mouse cursor is at. |
| **player_speed**, *i*| Changes the maximum speed of the player to the specified number. (The default maximum speed is 1). |
| **player_jump**, *i* | Changes the maximum jump height of the player to the specified number. (The default maximum jump height is 2). |
| **room_next** | Goes to the next room that exists (goes to all of the rooms created)  |
| **room_leap** | Goes to the next room that's picked out (one that is developed). |
| **room**, *i* | Goes to the specified room (rooms start at 1 and increment). |



## Features

- Sword attacks
- Rolling
- Climbing on ladders
- Ledge Grabbing
- Slopes
- Customizable Controls
- Debug Console
- Interactive Menus 
- Pause screen
- Gamepad support

## Instructions
- Move with Arrow Keys
- Press E to get on ladders
- Press X to attack with sword
- Press C to roll