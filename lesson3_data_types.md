# Roblox Coding Lesson 3: Data Types
## "Message Board" Mini-Project

### Lesson Overview
This third lesson builds on the students' experience with variables from lesson 2, introducing the three fundamental data types in programming: booleans, strings, and numbers. Students will create an interactive message board that displays different types of information.

---

### Learning Objectives
- Understand the three primary data types: boolean, string, and number
- Learn how to convert between different data types
- Practice using variables with specific data types
- Apply data types to create interactive game elements

---

### Materials Needed
- Computers/iPads with Roblox Studio installed
- Student accounts with proper permissions
- Prepared base place with a simple environment and message board parts
- Lesson handouts with code snippets and challenges

---

### Lesson Structure (1 hour)

#### 1. Visual Connection & Review (10 minutes)
- **Start with demonstration**: Show examples of data types in popular Roblox games
  - Player names (strings)
  - Health/score counters (numbers)
  - On/off switches (booleans)
- **Review last week's concepts**:
  - Quick recap of variables and how they store information
  - Review how the day/night cycle toggle used a boolean variable
  - Student Q&A about homework challenges

#### 2. Introduce Data Types (15 minutes)
- **Define data types**: "Data types are categories for different kinds of information"
  - Compare to different types of containers for different materials
- **Guided examples of each data type**:
  ```lua
  -- Boolean: true or false values
  local isPlayerAlive = true
  local isGameOver = false
  
  -- String: text values (always in quotes)
  local playerName = "RobloxExplorer123"
  local welcomeMessage = "Welcome to my game!"
  
  -- Number: numeric values
  local playerScore = 100
  local playerHealth = 50.5  -- Can be whole numbers or decimals
  
  -- Printing different data types
  print(isPlayerAlive)  -- Prints: true
  print(playerName)     -- Prints: RobloxExplorer123
  print(playerScore)    -- Prints: 100
  ```
- **Converting between data types**:
  ```lua
  -- Converting to string
  local scoreAsString = tostring(playerScore)
  print("Your score is: " .. scoreAsString)
  
  -- Converting to number
  local numberFromString = tonumber("42")
  print(numberFromString + 8)  -- Prints: 50
  
  -- Converting to boolean
  print(not isGameOver)  -- Prints: true (opposite of false)
  ```

#### 3. Guided Coding: Message Board (20 minutes)
- **Step 1**: Set up the message board parts
  ```lua
  -- Get references to our message board parts
  local messageBoard = script.Parent
  local titleLabel = messageBoard.TitleLabel
  local messageLabel = messageBoard.MessageLabel
  local toggleButton = messageBoard.ToggleButton
  
  -- Add click detector to the button
  local clickDetector = Instance.new("ClickDetector", toggleButton)
  ```

- **Step 2**: Create variables of different data types
  ```lua
  -- Boolean variable to track if board is on
  local isBoardOn = false
  
  -- String variables for messages
  local welcomeMessage = "Welcome to our amazing game!"
  local offMessage = "The message board is currently off."
  
  -- Number variables for tracking
  local clickCount = 0
  local maxClicks = 10
  ```

- **Step 3**: Create toggle function using our data types
  ```lua
  local function toggleBoard()
      -- Increment our number variable
      clickCount = clickCount + 1
      
      -- Toggle our boolean variable
      isBoardOn = not isBoardOn
      
      -- Use string concatenation to create messages
      local clickCountMessage = "Button has been clicked " .. tostring(clickCount) .. " times."
      local clicksLeftMessage = "Clicks remaining: " .. tostring(maxClicks - clickCount)
      
      -- Use our boolean in a conditional statement
      if isBoardOn then
          -- Board is on - show welcome message
          titleLabel.Text = "MESSAGE BOARD: ON"
          messageLabel.Text = welcomeMessage .. "\n\n" .. clickCountMessage
          toggleButton.BrickColor = BrickColor.new("Bright green")
      else
          -- Board is off - show off message
          titleLabel.Text = "MESSAGE BOARD: OFF"
          messageLabel.Text = offMessage .. "\n\n" .. clicksLeftMessage
          toggleButton.BrickColor = BrickColor.new("Really red")
      end
      
      -- Check if we've reached max clicks
      if clickCount >= maxClicks then
          messageLabel.Text = "MAXIMUM CLICKS REACHED!"
          clickDetector.MaxActivationDistance = 0  -- Disable the button
      end
  end
  
  -- Connect button click to our function
  clickDetector.MouseClick:Connect(toggleBoard)
  
  -- Initialize the board in off state
  toggleBoard()
  ```

#### 4. Pair Experimentation (20 minutes)
- **Challenge 1: Personal Info Display**
  - Create variables for player information (name, age, favorite color)
  - Display this information on the message board
  - Hint: Use string variables and concatenation

- **Challenge 2: Counter System**
  - Add buttons that increase and decrease a counter
  - Display the current count on the message board
  - Hint: Use number variables and addition/subtraction

- **Challenge 3: True/False Quiz**
  - Create a simple quiz with true/false questions
  - Track correct answers using boolean variables
  - Hint: Use boolean variables and conditional statements

#### 5. Share & Celebrate (10 minutes)
- Have each pair demonstrate their message board
- Discuss creative variations and solutions
- Vote on the most impressive implementations
- Preview next week's lesson: Functions & Events with Teleporting Door

---

### Homework Assignment: Interactive Character Stats
*Create a system that displays and updates character statistics:*

1. Create a character stats board with:
   - Character name (string)
   - Health points (number)
   - Is character powered-up (boolean)

2. Add buttons to:
   - Change character name
   - Increase/decrease health
   - Toggle powered-up status

3. **Code Template to Start:**
```lua
-- Get references to our UI elements
local statsBoard = script.Parent
local nameLabel = statsBoard.NameLabel
local healthLabel = statsBoard.HealthLabel
local powerLabel = statsBoard.PowerLabel

-- CHALLENGE: Create variables for each stat type
local characterName = "Hero"  -- String
local healthPoints = 100      -- Number
local isPoweredUp = false     -- Boolean

-- Function to update the display
local function updateStatsDisplay()
    -- CHALLENGE: Update the text labels with current stats
    -- Don't forget to convert numbers to strings!
    
    nameLabel.Text = "Name: " .. characterName
    healthLabel.Text = "Health: " .. tostring(healthPoints)
    
    -- Use the boolean to change what's displayed
    if isPoweredUp then
        powerLabel.Text = "POWERED UP!"
        powerLabel.TextColor3 = Color3.fromRGB(255, 215, 0)  -- Gold color
    else
        powerLabel.Text = "Normal Mode"
        powerLabel.TextColor3 = Color3.fromRGB(200, 200, 200)  -- Gray color
    end
end

-- CHALLENGE: Create functions for each button
-- Example for the power toggle button:
local function togglePowerUp()
    isPoweredUp = not isPoweredUp
    
    -- If powered up, increase health
    if isPoweredUp then
        healthPoints = healthPoints + 50
    end
    
    updateStatsDisplay()
end

-- Initialize the display
updateStatsDisplay()
```

---

### Roblox Code Glossary
- **Boolean** - A data type with only two possible values: true or false
- **String** - A data type that represents text (always in quotes)
- **Number** - A data type that represents numeric values (integers or decimals)
- **tostring()** - Function that converts a value to a string
- **tonumber()** - Function that converts a string to a number
- **Concatenation** - Joining strings together using the `..` operator
- **TextLabel** - A Roblox UI element that displays text

---

### Teaching Notes
- Emphasize the different ways data types are used in games
- Encourage students to think about what type of data makes sense for different game elements
- Point out that data types can be converted between each other when needed
- Connect to their Minecraft experience: scores are numbers, player names are strings, etc.
