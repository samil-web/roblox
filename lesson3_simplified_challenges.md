# Roblox Data Types: Simple Challenges for Kids

## What Are Data Types?

In Roblox, we use three main types of data:

1. **Booleans** - True or False values (like light switches - ON or OFF)
2. **Strings** - Text values (like your name or messages)
3. **Numbers** - Numeric values (like your age or score)

## Challenge 1: Color-Changing Sign

### What You'll Build
A sign that changes color and message when clicked!

### Roblox Studio Setup
1. Open Roblox Studio and create a new place
2. Insert a Part (this will be our sign)
   - Make it flat like a sign (change Size to 10, 6, 1)
   - Position it where players can see it
3. Insert a "SurfaceGui" into the Part
4. Insert a "TextLabel" into the SurfaceGui
5. Add a Script inside the Part

### The Code (Copy This!)
```lua
local sign = script.Parent
local textLabel = sign.SurfaceGui.TextLabel

-- STEP 1: Create our variables (different data types!)
local isHappy = true                -- Boolean (true/false)
local happyMessage = "HELLO! 😊"     -- String (text)
local clickCount = 0                -- Number

-- STEP 2: Add a click detector
local clickDetector = Instance.new("ClickDetector", sign)

-- STEP 3: Create our function that runs when clicked
local function changeSign()
    -- Add 1 to our click counter
    clickCount = clickCount + 1
    
    -- Flip our boolean (change true to false or false to true)
    isHappy = not isHappy
    
    -- Use our boolean to decide what to show
    if isHappy then
        -- Happy mode!
        textLabel.Text = happyMessage .. "\nClicks: " .. clickCount
        textLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- Green
        sign.BrickColor = BrickColor.new("Bright yellow")
    else
        -- Sad mode!
        textLabel.Text = "GOODBYE! 😢\nClicks: " .. clickCount
        textLabel.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red
        sign.BrickColor = BrickColor.new("Really blue")
    end
end

-- STEP 4: Connect our function to the click
clickDetector.MouseClick:Connect(changeSign)

-- STEP 5: Set up the sign when the game starts
textLabel.TextScaled = true
changeSign() -- Run once to set up
```

### What to Explain to Kids
- The **boolean** (isHappy) is like a light switch - it's either ON or OFF
- The **string** (happyMessage) is just text - we can change what it says
- The **number** (clickCount) keeps track of how many times we click
- We use `..` to join strings and numbers together
- We use `not` to flip a boolean (true becomes false, false becomes true)

## Challenge 2: Pet Stat Card

### What You'll Build
A card that shows information about a virtual pet!

### Roblox Studio Setup
1. Insert a Part (this will be our pet card)
   - Make it flat like a card (change Size to 8, 10, 1)
2. Insert a "SurfaceGui" into the Part
3. Insert 3 "TextLabel" objects into the SurfaceGui
   - Name the first one "NameLabel"
   - Name the second one "AgeLabel"
   - Name the third one "HappyLabel"
4. Add a Script inside the Part

### The Code (Copy This!)
```lua
local card = script.Parent
local nameLabel = card.SurfaceGui.NameLabel
local ageLabel = card.SurfaceGui.AgeLabel
local happyLabel = card.SurfaceGui.HappyLabel

-- STEP 1: Set up our labels
nameLabel.Position = UDim2.new(0, 0, 0, 0)
nameLabel.Size = UDim2.new(1, 0, 0.3, 0)
nameLabel.TextScaled = true

ageLabel.Position = UDim2.new(0, 0, 0.3, 0)
ageLabel.Size = UDim2.new(1, 0, 0.3, 0)
ageLabel.TextScaled = true

happyLabel.Position = UDim2.new(0, 0, 0.6, 0)
happyLabel.Size = UDim2.new(1, 0, 0.4, 0)
happyLabel.TextScaled = true

-- STEP 2: Create our pet variables (different data types!)
local petName = "Fluffy"           -- String (text)
local petAge = 3                   -- Number
local isHappy = true               -- Boolean (true/false)

-- STEP 3: Create a function to update the card
local function updatePetCard()
    -- Update the name (string)
    nameLabel.Text = "Name: " .. petName
    
    -- Update the age (number)
    ageLabel.Text = "Age: " .. tostring(petAge) .. " years"
    
    -- Update happiness based on boolean
    if isHappy then
        happyLabel.Text = "Status: Happy! 😊"
        happyLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- Green
    else
        happyLabel.Text = "Status: Sad 😢"
        happyLabel.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red
    end
end

-- STEP 4: Add buttons to change pet stats
local feedButton = Instance.new("Part", workspace)
feedButton.Size = Vector3.new(4, 1, 1)
feedButton.Position = card.Position + Vector3.new(0, -6, 0)
feedButton.BrickColor = BrickColor.new("Bright green")
feedButton.Name = "FeedButton"

local clickDetector = Instance.new("ClickDetector", feedButton)

-- STEP 5: Make the button work
clickDetector.MouseClick:Connect(function()
    -- Make pet happy (change boolean)
    isHappy = true
    
    -- Add to age (change number)
    petAge = petAge + 1
    
    -- Update the card
    updatePetCard()
    
    -- Print message
    print("You fed " .. petName .. "!")
end)

-- STEP 6: Update the card when the game starts
updatePetCard()
```

### What to Explain to Kids
- The **string** (petName) is the pet's name - it's text
- The **number** (petAge) is how old the pet is - we can add to it
- The **boolean** (isHappy) tells us if the pet is happy or sad
- We use `tostring()` to convert a number to text so we can show it
- We use `if` statements to do different things based on a boolean

## Challenge 3: Simple Quiz Game

### What You'll Build
A quiz game with true/false questions!

### Roblox Studio Setup
1. Insert a Part (this will be our question display)
   - Make it flat like a sign (change Size to 16, 8, 1)
2. Insert a "SurfaceGui" into the Part
3. Insert a "TextLabel" into the SurfaceGui
4. Create two more Parts for "True" and "False" buttons
   - Position them below the question display
   - Make the True button green and False button red
5. Add a Script inside the question display Part

### The Code (Copy This!)
```lua
local questionDisplay = script.Parent
local questionLabel = questionDisplay.SurfaceGui.TextLabel

-- Make the label look nice
questionLabel.TextScaled = true
questionLabel.BackgroundTransparency = 1

-- STEP 1: Create our variables (different data types!)
local currentQuestion = "Roblox was created in 2006."  -- String
local correctAnswer = true                            -- Boolean
local score = 0                                       -- Number
local totalQuestions = 3                              -- Number

-- List of questions and answers
local questions = {
    {question = "Roblox was created in 2006.", answer = true},
    {question = "The sky in Roblox is purple.", answer = false},
    {question = "You can make games in Roblox.", answer = true}
}

-- STEP 2: Create our function to show questions
local function showQuestion(questionNumber)
    -- Get the current question from our list
    currentQuestion = questions[questionNumber].question
    correctAnswer = questions[questionNumber].answer
    
    -- Update the display
    questionLabel.Text = "Question " .. questionNumber .. "/" .. totalQuestions .. ":\n\n" .. currentQuestion
end

-- STEP 3: Create true and false buttons
local trueButton = Instance.new("Part", workspace)
trueButton.Size = Vector3.new(4, 2, 1)
trueButton.Position = questionDisplay.Position + Vector3.new(-4, -6, 0)
trueButton.BrickColor = BrickColor.new("Bright green")
trueButton.Name = "TrueButton"

local falseButton = Instance.new("Part", workspace)
falseButton.Size = Vector3.new(4, 2, 1)
falseButton.Position = questionDisplay.Position + Vector3.new(4, -6, 0)
falseButton.BrickColor = BrickColor.new("Really red")
falseButton.Name = "FalseButton"

-- Add text to buttons
local trueGui = Instance.new("SurfaceGui", trueButton)
local trueLabel = Instance.new("TextLabel", trueGui)
trueLabel.Text = "TRUE"
trueLabel.Size = UDim2.new(1, 0, 1, 0)
trueLabel.TextScaled = true
trueLabel.BackgroundTransparency = 1

local falseGui = Instance.new("SurfaceGui", falseButton)
local falseLabel = Instance.new("TextLabel", falseGui)
falseLabel.Text = "FALSE"
falseLabel.Size = UDim2.new(1, 0, 1, 0)
falseLabel.TextScaled = true
falseLabel.BackgroundTransparency = 1

-- STEP 4: Add click detectors to buttons
local trueDetector = Instance.new("ClickDetector", trueButton)
local falseDetector = Instance.new("ClickDetector", falseButton)

-- Current question tracker
local currentQuestionNumber = 1

-- STEP 5: Make the buttons check answers
trueDetector.MouseClick:Connect(function()
    checkAnswer(true)
end)

falseDetector.MouseClick:Connect(function()
    checkAnswer(false)
end)

-- STEP 6: Create function to check answers
function checkAnswer(playerAnswer)
    -- Check if the player's answer matches the correct answer
    if playerAnswer == correctAnswer then
        -- Correct answer!
        score = score + 1
        questionLabel.Text = "CORRECT! 😊\nScore: " .. score
        questionLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- Green
    else
        -- Wrong answer
        questionLabel.Text = "WRONG! 😢\nScore: " .. score
        questionLabel.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red
    end
    
    -- Wait 2 seconds before next question
    wait(2)
    
    -- Move to next question
    currentQuestionNumber = currentQuestionNumber + 1
    
    -- Check if we've finished all questions
    if currentQuestionNumber <= totalQuestions then
        showQuestion(currentQuestionNumber)
        questionLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White
    else
        -- Quiz finished!
        questionLabel.Text = "Quiz complete!\nFinal Score: " .. score .. "/" .. totalQuestions
        
        -- Change color based on score
        if score == totalQuestions then
            questionLabel.TextColor3 = Color3.fromRGB(255, 215, 0) -- Gold
        elseif score >= totalQuestions/2 then
            questionLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- Green
        else
            questionLabel.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red
        end
    end
end

-- STEP 7: Start the quiz with the first question
showQuestion(1)
```

### What to Explain to Kids
- The **strings** are our questions - they're text
- The **booleans** are our answers - they're either true or false
- The **numbers** keep track of our score and which question we're on
- We use `if` statements to check if the answer is correct
- We use tables to store multiple questions and answers together

## Teaching Tips

### How to Teach This to 10-Year-Olds

1. **Start with real-world examples:**
   - Boolean: Light switches (on/off), yes/no questions
   - String: Names, messages, signs
   - Number: Age, score, counting things

2. **Use visual aids:**
   - Draw boxes on the board labeled with each data type
   - Put examples of each type in the correct box
   - Have students suggest more examples

3. **Interactive demonstration:**
   - Show the code working in Roblox Studio
   - Change values and show how the game changes
   - Ask students to predict what will happen when you change something

4. **Step-by-step guidance:**
   - Have students follow along with each step
   - After each step, check that everyone is on track
   - Use a projector or screen sharing to show your screen

5. **Pair programming:**
   - Have students work in pairs
   - One types, one gives directions
   - Switch roles halfway through

### Challenge Extensions (For Fast Finishers)

1. **Color-Changing Sign:**
   - Add more colors and messages
   - Make the sign change size when clicked
   - Add a sound effect when clicked

2. **Pet Stat Card:**
   - Add a "Play" button that makes the pet happy but hungry
   - Add a hunger stat (another number)
   - Make the pet get sad if not fed for a while

3. **Quiz Game:**
   - Add more questions
   - Add a timer for each question
   - Create different categories of questions

Remember to celebrate small victories and make it fun!
