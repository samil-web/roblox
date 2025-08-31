# Super Simple Data Types in Roblox
## For 10-Year-Old Beginners

## What Are Data Types?
- **Boolean**: True/False values (like a light switch)
- **String**: Text values (like your name)
- **Number**: Numeric values (like your age)

## Mini-Challenge 1: Magic Color Button
**What you'll learn**: How to use a **boolean** to toggle between two states

### Building Steps:
1. Insert a Part into your game (make it look like a button)
2. Change its color to bright yellow
3. Add a Script inside the part

### The Code (only 7 lines!):
```lua
local button = script.Parent
local isOn = true  -- This is a BOOLEAN (true/false)

local function onButtonClicked()
    isOn = not isOn  -- Flip the boolean (true becomes false, false becomes true)
    button.BrickColor = isOn and BrickColor.new("Bright yellow") or BrickColor.new("Really blue")
end
button.ClickDetector.MouseClick:Connect(onButtonClicked)
```

### What to Explain:
- The boolean `isOn` is like a light switch - it's either ON (true) or OFF (false)
- When we click, we flip the switch using `not isOn`
- We use the boolean to decide which color to show

### Setup Tip:
- Don't forget to add a ClickDetector to your part before running the script!

## Mini-Challenge 2: Name Tag
**What you'll learn**: How to use a **string** to display text

### Building Steps:
1. Insert a Part into your game (make it flat like a sign)
2. Insert a SurfaceGui into the part
3. Insert a TextLabel into the SurfaceGui
4. Add a Script inside the part

### The Code (only 9 lines!):
```lua
local sign = script.Parent
local label = sign.SurfaceGui.TextLabel
local playerName = "Super Builder"  -- This is a STRING (text)

label.TextScaled = true
label.Text = "Hi! I am " .. playerName  -- Join strings with ..

local function onSignClicked()
    playerName = "Master " .. playerName  -- Change the string
    label.Text = "Hi! I am " .. playerName  -- Update the display
end
sign.ClickDetector.MouseClick:Connect(onSignClicked)
```

### What to Explain:
- The string `playerName` holds text
- We use `..` to join strings together
- When clicked, we change the string by adding "Master" to the front

### Setup Tip:
- Make sure the TextLabel fills the whole SurfaceGui
- Don't forget to add a ClickDetector to your part!

## Mini-Challenge 3: Score Counter
**What you'll learn**: How to use a **number** to keep track of values

### Building Steps:
1. Insert a Part into your game (make it look like a target)
2. Insert another Part to be your scoreboard
3. Insert a SurfaceGui into the scoreboard
4. Insert a TextLabel into the SurfaceGui
5. Add a Script inside the target part

### The Code (only 10 lines!):
```lua
local target = script.Parent
local scoreboard = workspace.Scoreboard  -- Change this to your scoreboard's name
local scoreLabel = scoreboard.SurfaceGui.TextLabel
local score = 0  -- This is a NUMBER

scoreLabel.TextScaled = true
scoreLabel.Text = "Score: " .. score  -- Convert number to string for display

local function onTargetClicked()
    score = score + 10  -- Add to the number
    scoreLabel.Text = "Score: " .. score  -- Update the display
end
target.ClickDetector.MouseClick:Connect(onTargetClicked)
```

### What to Explain:
- The number `score` keeps track of points
- We can add to numbers using `+`
- When displaying a number, we convert it to text automatically

### Setup Tip:
- Name your scoreboard "Scoreboard" or change the code to match your name
- Don't forget to add a ClickDetector to your target!

## Mini-Challenge 4: All-In-One Pet
**What you'll learn**: How to use all three data types together

### Building Steps:
1. Insert a Part into your game (this will be your pet)
2. Make it look like a cute animal (color it, resize it)
3. Insert a BillboardGui into the part
4. Insert a TextLabel into the BillboardGui
5. Add a Script inside the part

### The Code (exactly 15 lines!):
```lua
local pet = script.Parent
local nameTag = pet.BillboardGui.TextLabel
local petName = "Fluffy"           -- STRING
local petAge = 1                   -- NUMBER
local isHappy = true               -- BOOLEAN

nameTag.TextScaled = true

local function updatePetDisplay()
    nameTag.Text = petName .. " (Age: " .. petAge .. ")"
    pet.BrickColor = isHappy and BrickColor.new("Bright green") or BrickColor.new("Bright red")
end

local function onPetClicked()
    petAge = petAge + 1            -- Add to NUMBER
    petName = petName .. "!"       -- Change STRING
    isHappy = not isHappy          -- Flip BOOLEAN
    updatePetDisplay()
end
pet.ClickDetector.MouseClick:Connect(onPetClicked)
updatePetDisplay()
```

### What to Explain:
- We use all three data types together:
  - STRING for the pet's name
  - NUMBER for the pet's age
  - BOOLEAN for whether the pet is happy
- Each click changes all three variables
- The pet's color shows its mood (green=happy, red=sad)

### Setup Tip:
- Make the BillboardGui face the camera
- Set the TextLabel to fill the whole BillboardGui
- Don't forget to add a ClickDetector to your pet!

## Teaching This Lesson

### Classroom Setup
1. Prepare a basic Roblox place with parts already inserted
2. Have the challenges written on a board or handout
3. Demonstrate each challenge before students try it

### Step-by-Step Teaching
1. **Introduction (5 minutes):**
   - Show real examples of each data type in popular games
   - Explain what each data type is used for

2. **Demonstration (10 minutes):**
   - Build one challenge while students watch
   - Explain each line as you type it
   - Show how changing values affects the game

3. **Guided Practice (15 minutes):**
   - Have students build their first challenge
   - Walk around and help as needed
   - Celebrate when students get it working

4. **Independent Practice (20 minutes):**
   - Let students try the other challenges
   - Encourage them to customize their projects
   - Have early finishers help others

5. **Wrap-Up (10 minutes):**
   - Have students share what they built
   - Review what each data type is used for
   - Preview what they'll learn next time

### Simple Extensions
For students who finish early:
- Change colors, messages, or values
- Add sounds when clicking
- Combine multiple parts to make a game
