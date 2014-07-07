Robotic Rovers
==============

In this repo you will find my solution to the Mars Robotic Rovers. 

It is written in ruby and tested using rspec.

The Problem
-----------

A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth.

A rover’s position and location is represented by a combination of x and y co- ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.

In order to control a rover, NASA sends a simple string of letters. The possible letters are ‘L’, ‘R’ and ‘M’. ‘L’ and ‘R’ makes the rover spin 90 degrees left or right respectively, without moving from its current spot. ‘M’ means move forward one grid point, and maintain the same heading.

Assume that the square directly North from (x, y) is (x, y+1).

###Input

The first line of input is the upper-right coordinates of the plateau, the lower- left coordinates are assumed to be 0,0.

The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives
the rover’s position, and the second line is a series of instructions telling the rover how to explore the plateau.

The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover’s orientation.

Each rover will be finished sequentially, which means that the second rover won’t start to move until the first one has finished moving.

###Output

The output for each rover should be its final co-ordinates and heading.

###Input and Output

Test Input:

    5 5
    1 2 N
    LMLMLMLMM
    3 3 E
    MMRMMRMRRM

Expected Output: 
    
    1 3 N
    5 1 E

The Solution
------------

###Assumptions

* Rovers can be lost to the void if the go further the plateu boundaries. Be carefull!
* Rovers can share the same position


My solution uses a main Application class that handles the input by instanciating a Parser object. With the parsed data it creates several Navigators, each one containing a Rover,a Plateu and several instructions. It then uses a Composer object to build the expected output.

The Navigator Object has the responsability of executing the given instructions on its rover and watches if the rover have or have not abandoned its plateu. 

The Rover object knows how to move itself and nothing else.

The Plateu object stores its size and checks if a given positions is valid. The Position object is used merely as a data structure and has only getters and setters.

The input and output of the application can be easily modified without affecting the other parts of it by defining new Parsers/Composers in the IOInterface namespace

The application was developed using 	the Test Driven Development approach. For continous testing, I used the [Guard](https://github.com/guard/guard) gem.




Usage
-----

Following rake tasks are available
    
    $ rake -T
    rake run   # Runs the app - optional input can be passed using INPUT variable
    rake spec  # Run RSpec code examples

To run the app using the standard input values provided on the problem descripton, you can:

    $ rake run
    => 
    Deploying rovers...
    __________________________________________

    INPUT
    5 5
    1 2 N
    LMLMLMLMM
    3 3 E
    MMRMMRMRRM
    __________________________________________

    OUTPUT
    1 3 N
    5 1 E


You can give your own input string, using a variable:

    $ rake run INPUT="
    5 6
    1 2 N
    LML
    3 3 E
    MMRM"
    =>
    Deploying rovers...
    __________________________________________

    INPUT

    5 6
    1 2 N
    LML
    3 3 E
    MMRM
    __________________________________________

    OUTPUT
    0 2 S
    5 2 S

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
    



