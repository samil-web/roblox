# Roblox Coding Lesson 2: Variables & Properties

## "Day/Night Cycle Button" Mini-Project

### Lesson Overview

This second lesson builds on the students' experience with the Magic Click Detector from lesson 1, introducing variables to track state and exploring more Roblox properties to create environmental changes.

---

### Learning Objectives

- Understand how variables store and track information
- Learn to use conditional statements to create toggle functionality
- Explore Roblox lighting properties to create visual effects
- Apply event-based programming to create interactive experiences

---

### Materials Needed

- Computers/iPads with Roblox Studio installed
- Student accounts with proper permissions
- Prepared base place with a simple environment (grass, sky, one building)
- Lesson handouts with code snippets and challenges

---

### Lesson Structure (1 hour)

#### 1. Visual Connection & Review (10 minutes)

- **Start with demonstration**: Show popular Roblox games that use day/night cycles (e.g., Bloxburg, Adopt Me)
- **Review last week's concepts**:
  - Quick recap of the Magic Clicker project
  - Review how events work in Roblox
  - Student Q&A about homework challenges

#### 2. Introduce Variables & Properties (15 minutes)

- **Define variables**: "Variables are like labeled boxes that store information"
  - Compare to Minecraft score variables and command blocks that track state
- **Guided example**: Create a simple variable that tracks state
  ```lua
  local isDay = true  -- This is our variable that tracks if it's day or night
  print("Is it daytime? " .. tostring(isDay))
  ```
- **Explore Lighting properties**: Show Roblox Lighting service in Explorer
  - Demonstrate changing time of day manually in properties panel
  - Show how ClockTime property affects the game's appearance

#### 3. Guided Coding: Day/Night Button (20 minutes)

- **Step 1**: Create a button part and add appearance

  ```lua
  -- Make the button look nice
  local button = script.Parent
  button.BrickColor = BrickColor.new("Bright yellow")
  button.Material = Enum.Material.Neon
  ```
- **Step 2**: Add the click detector

  ```lua
  -- Add click detector just like our Magic Clicker
  local clickDetector = Instance.new("ClickDetector", button)
  ```
- **Step 3**: Create variable and toggle function

  ```lua
  -- Our variable to remember the current state
  local isDay = true

  -- Get the lighting service to control day/night
  local lighting = game:GetService("Lighting")

  local function toggleDayNight()
      -- Flip our variable to the opposite (toggle)
      isDay = not isDay

      -- Change the game based on our variable
      if isDay then
          -- It's day time!
          lighting.ClockTime = 12  -- Noon
          button.BrickColor = BrickColor.new("Bright yellow")
          lighting.Brightness = 2
          print("It's now daytime!")
      else
          -- It's night time!
          lighting.ClockTime = 0  -- Midnight
          button.BrickColor = BrickColor.new("Navy blue")
          lighting.Brightness = 0.5
          print("It's now nighttime!")
      end
  end

  -- Connect button click to our function
  clickDetector.MouseClick:Connect(toggleDayNight)
  ```
- **Step 4**: Add sound effects to enhance the experience

  ```lua
  -- Add day/night sounds
  local daySound = Instance.new("Sound", button)
  daySound.SoundId = "rbxassetid://170642155"  -- Bird chirping sound

  local nightSound = Instance.new("Sound", button)
  nightSound.SoundId = "rbxassetid://169486841"  -- Cricket sound

  -- Update our function to play sounds
  local function toggleDayNight()
      isDay = not isDay

      if isDay then
          lighting.ClockTime = 12
          button.BrickColor = BrickColor.new("Bright yellow")
          lighting.Brightness = 2
          daySound:Play()
          nightSound:Stop()
          print("It's now daytime!")
      else
          lighting.ClockTime = 0
          button.BrickColor = BrickColor.new("Navy blue")
          lighting.Brightness = 0.5
          nightSound:Play()
          daySound:Stop()
          print("It's now nighttime!")
      end
  end
  ```

#### 4. Pair Experimentation (20 minutes)

- **Challenge 1: Weather Effects**

  - Add fog or rain when it becomes night
  - Hint: Look at the `Atmosphere` object in Lighting
- **Challenge 2: Multi-State Button**

  - Modify the code to cycle through three states: Dawn → Day → Night
  - Use an integer variable instead of boolean
- **Challenge 3: Time Progression**

  - Make the time change gradually when button is clicked
  - Use a loop or RunService to increment time slowly

#### 5. Share & Celebrate (10 minutes)

- Have each pair demonstrate their day/night button
- Discuss creative variations and solutions
- Vote on the most impressive effects
- Preview next week's lesson: Functions & Events with Teleporting Door

---

### Homework Assignment: Mood Lighting System

*Extend today's project to create a "mood lighting" system for a house:*

1. Create a simple house with rooms
2. Make at least 3 buttons that change the lighting in different ways:

   - A day/night button (from class)
   - A "party mode" button (colorful, flashing lights)
   - A "spooky" button (dark with fog)
3. **Code Template to Start:**

```lua
local button = script.Parent
local clickDetector = Instance.new("ClickDetector", button)
local lighting = game:GetService("Lighting")

-- CHALLENGE: Create a variable to track the current mode
local currentMode = "normal"

local function changeMode()
    -- CHALLENGE: Write code to change the lighting based on mode
    -- and update your variable to the new mode
  
    if currentMode == "normal" then
        -- Change to next mode
        currentMode = "party"
        -- Add party lighting effects
    elseif currentMode == "party" then
        -- Change to next mode
        currentMode = "spooky"
        -- Add spooky lighting effects
    else
        -- Change back to normal
        currentMode = "normal"
        -- Reset lighting to normal
    end
  
    -- Print the current mode
    print("Current mode: " .. currentMode)
end

clickDetector.MouseClick:Connect(changeMode)
```

---

### Roblox Code Glossary

- **local variable** - A container that stores information (like `local isDay = true`)
- **if/else statements** - Code that makes decisions based on conditions
- **not operator** - Flips a true/false value to its opposite (`not isDay`)
- **Lighting service** - Controls the game's environment (sky, time, brightness)
- **ClockTime** - Property that sets the time of day (0-24, like hours on a clock)
- **Sound Instance** - Object that plays audio in the game

---

### Teaching Notes

- Emphasize the connection between variables in Minecraft and Roblox
- Watch for confusion around the `not` operator and boolean logic
- Make sure students understand that the variable is tracking state between clicks
- Have the complete code ready as a backup if students get stuck
- Encourage creative modifications to the lighting properties
