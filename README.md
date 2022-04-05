# Tictactoe game

Tic-tac-toe is a game in which two players take turns in drawing either an ' O' or an ' X' in one square of a grid consisting of nine squares.

# Architecture

I tried to follow closely the SOLID / DRY principles with a MVP like approach. This means every feature is split in at least 3 files. 
- A view
- A controller 
- A presenter (called ViewModel in my case)

The business logic is in separate modules called: *GameEngine* and *GameState* to keep code well separated from the UI logic.

Each unit of code has a single responsibility and every module implement a protocol in order to be able to mock them and to replace them anytime by another module that will (must) extend the protocol.

# Execution

- [ ] Install [CocoaPods] (https://cocoapods.org)
- [ ] Open TicTacToe_kata.xcworkspace with XCode 13.x
- [ ] Pick a simulator (iPhone 11/12/13 are prefered)

# Testing

I did my best to use an TDD approach during this development, this is not a subject I masterise and I would be more than happy to be able to add this arrow to my professional quiver.

###### Side note 1

The UI was not important so because of lack of time I used a storyboard but in a real world app. I would used the atomic design principle while separating the "grid" into a component, in this scenario the controller would only display the "grid view" and wouldn't be responsible of the interaction.
Lastly I would used a thid party library such as [Snapkit](https://github.com/SnapKit/SnapKit) to make the layout with the code instead storyboard/xib file.

###### Side note 2

I wanted to use SwiftLint, so cocoapods is present for this unique purpose.
