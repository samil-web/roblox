# Roblox Coding Lesson 5: Loops & Timers

## For 10-11 Year Old Beginners

## What Are Loops & Timers?

Loops and timers are powerful tools that let us:
- Repeat code multiple times without copying and pasting
- Create things that happen over and over again
- Make games that keep track of time
- Build obstacles and patterns easily

## Simple While Loop Example
**What you'll learn**: How to use a `while` loop to repeat code until a condition ends

### The Code (only 8 lines!):
```lua
-- Simple while loop that counts from 1 to 5
local count = 1

while count <= 5 do
    print('Count is: ' .. count)
    count = count + 1
    wait(1)  -- wait 1 second so you can see each number
end

print('Done!')
```

### What to Explain:
- We start with `count = 1`
- `while count <= 5` repeats the code as long as `count` is 5 or less
- Inside, we print the current `count` and then add 1
- `wait(1)` pauses the loop for 1 second so we can see each print
- When `count` becomes 6, the loop stops and we print 'Done!'

## Mini-Challenge 1: Coin Generator

**What you'll learn**: How to use loops to create multiple objects

### Building Steps:

1. Create a new part to serve as your "Coin Generator"
2. Add a Script inside the part
3. Change the part's color to gold or yellow

### The Code (only 15 lines!):

```lua
-- Create a variable to store the part that this script is inside
local generator = script.Parent
-- Set how many coins we want to create
local totalCoins = 10  

-- for i = [starting number], [ending number] do
--     [code to repeat]
-- end
for i = 1, totalCoins do
    -- Create a new coin
    -- Instance.new("[ClassName]") creates a new object
    local coin = Instance.new("Part")
    -- Set properties for our coin
    -- Shape = Enum.PartType.[ShapeType]
    coin.Shape = Enum.PartType.Cylinder
    -- Size = Vector3.new([X], [Y], [Z])
    coin.Size = Vector3.new(0.5, 2, 2)
    -- Orientation = Vector3.new([X rotation], [Y rotation], [Z rotation])
    coin.Orientation = Vector3.new(0, 0, 90)  -- Make it flat like a coin
    -- Material = Enum.Material.[MaterialType]
    coin.Material = Enum.Material.Metal
    -- BrickColor = BrickColor.new("[ColorName]")
    coin.BrickColor = BrickColor.new("Bright yellow")
  
    -- Position each coin in a line with some space between them
    -- Position = [BasePosition] + Vector3.new([X offset], [Y offset], [Z offset])
    coin.Position = generator.Position + Vector3.new(i * 4, 0, 0)
    coin.Anchored = true
    
    -- [Object].Parent = [Container] adds the object to the game
    coin.Parent = workspace
end
```

### What to Explain:

- The `for` loop counts from 1 to 10 using the variable `i`
- Each time through the loop, we create a new coin
- We use the loop variable `i` to position each coin
- Without loops, we would need to copy and paste the same code 10 times!

### Extension Challenge:

- Change the loop to create coins in a circle pattern
- Add a ClickDetector to each coin that gives points when clicked

## Mini-Challenge 2: Obstacle Course Timer

**What you'll learn**: How to create a timer that counts up

### Building Steps:

1. Create a "Start Line" part and a "Finish Line" part
2. Add a Script to the Start Line
3. Create a BillboardGui to display the timer

### The Code (only 25 lines!):

```lua
-- Create a variable to store the part that this script is inside
local startLine = script.Parent
-- Find the finish line in the workspace
local finishLine = workspace.FinishLine  

-- Create a timer display
-- BillboardGui is a 2D interface that always faces the camera
-- Instance.new("[GuiType]", [Parent])
local timerGui = Instance.new("BillboardGui")
-- Size = UDim2.new([Scale X], [Offset X], [Scale Y], [Offset Y])
timerGui.Size = UDim2.new(0, 100, 0, 40)
-- StudsOffset = Vector3.new([X], [Y], [Z]) positions GUI relative to part
timerGui.StudsOffset = Vector3.new(0, 3, 0)
timerGui.Parent = startLine

-- TextLabel is used to display text in a GUI
local timerLabel = Instance.new("TextLabel")
timerLabel.Size = UDim2.new(1, 0, 1, 0)
timerLabel.BackgroundTransparency = 0.5
-- Color3.fromRGB([Red 0-255], [Green 0-255], [Blue 0-255])
timerLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
timerLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
timerLabel.TextScaled = true
timerLabel.Text = "Touch to start!"
timerLabel.Parent = timerGui

-- Variables for our timer
-- Boolean to track if race is in progress
local isRacing = false  
-- Will store the time when race starts
local startTime = 0     
-- Will store our timer connection
local timerConnection = nil  

-- Function to start the race
-- local function [FunctionName]([Parameters])
--     [code]
-- end
local function startRace(player)
    -- if [condition] then
    --     [code]
    -- end
    if not isRacing then
        isRacing = true
        -- tick() returns the current time in seconds
        startTime = tick()  -- Get the current time
        timerLabel.Text = "GO!"
      
        -- Start our timer loop
        -- [Service]:Connect(function()
        --     [code to run every frame]
        -- end)
        timerConnection = game:GetService("RunService").Heartbeat:Connect(function()
            local elapsedTime = tick() - startTime
            -- string.format("%.2f", [number]) formats to 2 decimal places
            timerLabel.Text = string.format("%.2f", elapsedTime)
        end)
      
        print(player.Name .. " started the race!")
    end
end

-- Function to end the race
local function endRace(player)
    if isRacing then
        local finalTime = tick() - startTime
        -- [Connection]:Disconnect() stops the loop
        timerConnection:Disconnect()  -- Stop the timer
        timerLabel.Text = string.format("%.2f - FINISH!", finalTime)
        isRacing = false
      
        print(player.Name .. " finished in " .. string.format("%.2f", finalTime) .. " seconds!")
    end
end

-- Connect our functions to the start and finish lines
-- [Part].Touched:Connect(function(hit)
--     [code to run when part is touched]
-- end)
startLine.Touched:Connect(function(hit)
    -- game.Players:GetPlayerFromCharacter([character]) finds the player
    local player = game.Players:GetPlayerFromCharacter(hit.Parent)
    if player then
        startRace(player)
    end
end)

finishLine.Touched:Connect(function(hit)
    local player = game.Players:GetPlayerFromCharacter(hit.Parent)
    if player then
        endRace(player)
    end
end)
```

### What to Explain:

- We use `tick()` to get the current time when the race starts
- The Heartbeat event is a special kind of loop that runs every frame
- We calculate the elapsed time by subtracting the start time from the current time
- We format the time to show only two decimal places

### Extension Challenge:

- Add a leaderboard that shows the best times
- Create checkpoints that must be touched in order
- Add a countdown before the race starts

## Mini-Challenge 3: Blinking Lights

**What you'll learn**: How to use timers to create repeating effects

### Building Steps:

1. Create several parts to serve as lights
2. Change their colors to different bright colors
3. Add a Script to one of the lights

### The Code (only 20 lines!):

```lua
-- Table to store all our lights
local lights = {}  

-- Find all the lights in the workspace
-- for [key], [value] in pairs([table/container]) do
--     [code]
-- end
for _, object in pairs(workspace:GetChildren()) do
    -- [object]:IsA("[ClassName]") checks the type of object
    -- [object].Name == "[Name]" checks the name
    if object:IsA("Part") and object.Name == "Light" then
        -- table.insert([table], [value]) adds to the end of a table
        table.insert(lights, object)
        -- Turn all lights off to start
        object.Material = Enum.Material.SmoothPlastic
    end
end

-- Function to make a light blink
-- local function [FunctionName]([Parameters])
--     [code]
-- end
local function blinkLight(light, duration)
    light.Material = Enum.Material.Neon  -- Turn on
    -- wait([seconds]) pauses the script
    wait(duration)  -- Wait for the specified time
    light.Material = Enum.Material.SmoothPlastic  -- Turn off
end

-- Main loop that keeps running forever
-- while [condition] do
--     [code]
-- end
while true do
    -- Loop through each light
    -- for [index], [value] in ipairs([table]) do
    --     [code]
    -- end
    for i, light in ipairs(lights) do
        -- spawn(function()
        --     [code to run in parallel]
        -- end)
        spawn(function()
            blinkLight(light, 0.5)  -- Blink for half a second
        end)
        wait(0.2)  -- Wait before starting the next light
    end
  
    wait(1)  -- Wait before starting the pattern again
end
```

### What to Explain:

- The `while true do` loop runs forever, creating a continuous pattern
- We use `spawn()` to create separate threads so lights can blink at the same time
- The `wait()` function pauses the script for a specified number of seconds
- We use a table to store all the lights so we can loop through them

### Extension Challenge:

- Create different blinking patterns (alternating, random, wave)
- Make the lights change color as they blink
- Add a button that changes the pattern when clicked

## Mini-Challenge 4: Spawning Enemies

**What you'll learn**: How to use loops and timers to create game challenges

### Building Steps:

1. Create a "Spawner" part
2. Add a Script to the spawner
3. Create a simple arena area for the enemies to appear in

### The Code (only 30 lines!):

```lua
-- Create a variable to store the part that this script is inside
local spawner = script.Parent
-- Set how often enemies spawn
local spawnRate = 2  
-- Set the maximum number of enemies
local maxEnemies = 5  
-- Table to keep track of enemies
local enemies = {}  

-- Function to create a new enemy
-- local function [FunctionName]()
--     [code]
-- end
local function createEnemy()
    local enemy = Instance.new("Part")
    enemy.Size = Vector3.new(2, 2, 2)
    enemy.BrickColor = BrickColor.new("Really red")
    enemy.Material = Enum.Material.Neon
  
    -- Position randomly around the spawner
    -- math.random() generates a random number
    -- math.pi * 2 is a full circle in radians
    local angle = math.random() * math.pi * 2  -- Random angle
    local distance = math.random(5, 15)  -- Random distance
    -- math.cos/sin([angle]) calculate positions on a circle
    local x = math.cos(angle) * distance
    local z = math.sin(angle) * distance
    enemy.Position = spawner.Position + Vector3.new(x, 2, z)
  
    -- Add a ClickDetector to defeat the enemy
    -- ClickDetector lets players click on objects
    local clickDetector = Instance.new("ClickDetector", enemy)
    -- [Detector].MouseClick:Connect(function()
    --     [code to run when clicked]
    -- end)
    clickDetector.MouseClick:Connect(function()
        print("Enemy defeated!")
        -- table.remove([table], [index]) removes an item from a table
        -- table.find([table], [value]) finds the position of a value
        table.remove(enemies, table.find(enemies, enemy))
        enemy:Destroy()
    end)
  
    enemy.Anchored = true
    enemy.Parent = workspace
    table.insert(enemies, enemy)
  
    -- Make the enemy disappear after 10 seconds if not clicked
    spawn(function()
        wait(10)
        -- [object].Parent checks if object still exists
        if enemy.Parent then
            table.remove(enemies, table.find(enemies, enemy))
            enemy:Destroy()
        end
    end)
end

-- Main spawn loop
while true do
    -- Only spawn if we haven't reached the maximum
    -- #[table] gives the count of items in a table
    if #enemies < maxEnemies then
        createEnemy()
        print("Enemy spawned! Total: " .. #enemies)
    end
  
    wait(spawnRate)  -- Wait before spawning the next enemy
end
```

### What to Explain:

- We use a `while true` loop to keep spawning enemies
- The `#enemies` gives us the count of enemies in our table
- We use `math.random()` to create random positions
- The `spawn()` function lets us run a timer for each enemy separately

### Extension Challenge:

- Add different types of enemies with different properties
- Make enemies move toward the player
- Add a scoring system for defeating enemies

## Teaching This Lesson

### Classroom Setup (5 minutes)

1. Prepare a basic Roblox place with parts already inserted
2. Have the challenges written on a board or handout
3. Make sure all students have Roblox Studio open

### Introduction (5 minutes)

- Show examples of loops and timers in popular Roblox games:
  - Enemies that spawn continuously
  - Race tracks with timers
  - Blinking lights and effects
- Connect to previous lesson: "Last time we learned about variables. Today we'll learn how to repeat code and track time!"

### Demonstration (10 minutes)

- Build the Coin Generator challenge while students watch
- Explain each line as you type it:
  - "First we set up how many coins we want to create"
  - "Then we use a loop to count from 1 to that number"
  - "Inside, we create a new coin each time"
- Show how changing the loop values affects the game

### Guided Practice (15 minutes)

- Have students build their first challenge (Coin Generator)
- Walk around and help as needed
- Ask questions like:
  - "What happens if you change the total number of coins?"
  - "How could you arrange the coins in a different pattern?"
  - "What other objects could you create with a loop?"

### Independent Practice (15 minutes)

- Have students choose another challenge to try
- Encourage them to modify the code and experiment
- Challenge advanced students to combine multiple concepts

### Wrap-Up (5 minutes)

- Have students share what they created
- Discuss what was easy/difficult
- Preview next week's lesson on conditional statements

## Challenge Solutions

### Coin Generator Circle Pattern:

```lua
-- Create a variable to store the part that this script is inside
local generator = script.Parent
-- Set how many coins we want to create
local totalCoins = 12  
-- Set the size of the circle
local radius = 10     

-- for i = [starting number], [ending number] do
--     [code to repeat]
-- end
for i = 1, totalCoins do
    -- Create a new coin
    -- Instance.new("[ClassName]") creates a new object
    local coin = Instance.new("Part")
    coin.Shape = Enum.PartType.Cylinder
    coin.Size = Vector3.new(0.5, 2, 2)
    coin.Orientation = Vector3.new(0, 0, 90)  -- Make it flat like a coin
    coin.Material = Enum.Material.Metal
    coin.BrickColor = BrickColor.new("Bright yellow")
  
    -- Calculate position in a circle
    -- (i / totalCoins) gives a value from 0 to 1 as we go around
    -- * math.pi * 2 converts to radians for a full circle
    local angle = (i / totalCoins) * math.pi * 2  -- Divide the circle evenly
    -- math.cos/sin([angle]) calculate positions on a circle
    -- * radius determines how big the circle is
    local x = math.cos(angle) * radius
    local z = math.sin(angle) * radius
  
    coin.Position = generator.Position + Vector3.new(x, 0, z)
    coin.Anchored = true
  
    -- Add a ClickDetector to collect the coin
    local clickDetector = Instance.new("ClickDetector", coin)
    clickDetector.MouseClick:Connect(function()
        print("Coin collected!")
        coin:Destroy()
    end)
  
    coin.Parent = workspace
end
```

### Alternating Light Pattern:

```lua
-- Table to store all our lights
local lights = {}  
-- Table of functions for different patterns
-- [TableName] = {
--     ["KeyName"] = function()
--         [code]
--     end,
-- }
local patterns = {
    ["Alternating"] = function()
        -- for [start], [end], [step] do
        --     [code]
        -- end
        for i = 1, #lights, 2 do  -- Skip every other light
            spawn(function()
                lights[i].Material = Enum.Material.Neon
                wait(0.5)
                lights[i].Material = Enum.Material.SmoothPlastic
            end)
        end
        wait(0.5)
        for i = 2, #lights, 2 do  -- Do the other set of lights
            spawn(function()
                lights[i].Material = Enum.Material.Neon
                wait(0.5)
                lights[i].Material = Enum.Material.SmoothPlastic
            end)
        end
        wait(0.5)
    end,
  
    ["Wave"] = function()
        for i = 1, #lights do
            spawn(function()
                lights[i].Material = Enum.Material.Neon
                wait(0.3)
                lights[i].Material = Enum.Material.SmoothPlastic
            end)
            wait(0.1)  -- Small delay between each light
        end
        wait(1)
    end,
  
    ["Random"] = function()
        -- for _ = [start], [end] do
        --     [code]
        -- end
        -- (underscore means we don't need the loop variable)
        for _ = 1, 5 do  -- Blink 5 random lights
            -- math.random(1, #lights) picks a random light
            local randomIndex = math.random(1, #lights)
            spawn(function()
                lights[randomIndex].Material = Enum.Material.Neon
                wait(0.2)
                lights[randomIndex].Material = Enum.Material.SmoothPlastic
            end)
            wait(0.1)
        end
        wait(0.5)
    end
}

-- Find all the lights in the workspace
for _, object in pairs(workspace:GetChildren()) do
    if object:IsA("Part") and object.Name == "Light" then
        table.insert(lights, object)
        -- Turn all lights off to start
        object.Material = Enum.Material.SmoothPlastic
    end
end

-- Current pattern
local currentPattern = "Alternating"

-- Main loop that keeps running forever
while true do
    -- Run the current pattern function
    -- [TableName][KeyName]() calls the function stored in the table
    patterns[currentPattern]()
end
