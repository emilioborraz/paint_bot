# README

Given the following directions:
```
Design an application that allows a robot to move around a square grid and paint the spaces it
passes over.
Requirements
• Grid: The application should have a square grid that is 10 x 10.
• Robot Movement: The robot should be able to move in four directions: up, down, left,
and right. The movement can be controlled by the user through interactive controls or
automated in different ways, such as predefined sequences of movements.
• Painting Spaces: As the robot moves over the spaces in the grid, it should paint each
space it passes over.
• User Interface: After the robot finishes moving, the program should display the following
information:
o The final location of the robot on the grid.
o The number of spaces painted by the robot.
• Bonus: Incorporate historical data with math into the application for statistical analysis.

```

I decided to implement a rake task that prints the grid of configurable size. When running the task the user can press a key and the program will recognize if it's a valid input. You may download the demo video from [here](https://github.com/emilioborraz/paint_bot/blob/main/public/demo.mov) that shows the functionality described below. 

* Moving the bot: The program allows to move the bot in the 4 different directions (w for moving up, s for moving down, a for moving left and d for moving right). Grid boundaries validation are in place.

* Displaying historical data: Pressing the `h` key and then `enter` will display the historical data of Bot moves and program~task runs.

* Exiting the task: Pressing the `e` key will exit the task and prints the final location of the robot and the number of spaces ~ moves painted by it.

* Database: The BotMove model was created to record moves of the bot. The model was created using the Rails `rails generate model BotMove guid:string direction:string && bundle exec rails db:migrate` generator.

* How to run the task: `bundle exec rake "paint_bot:play[10]"` where 10 can be any number greater than 0.
