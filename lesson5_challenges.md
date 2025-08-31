# Roblox Coding Challenges: Loops & Timers
## For 10-11 Year Old Beginners

These challenges will help students practice using loops and timers in their Roblox games. Each challenge includes a starter template and extension ideas.

## Challenge Set 1: "Loop Explorer" Challenges

These challenges focus on different types of loops and how to use them effectively.

### Challenge 1: Stairway Builder

**Objective:** Create a script that builds a staircase automatically.

**Setup:**
1. Create a base part that will be the starting point
2. Add a script to the part

**Code Template:**
```lua
local startBlock = script.Parent
local numberOfSteps = 10  -- Try changing this number!

-- CHALLENGE: Use a loop to create a staircase
for i = 1, numberOfSteps do
    -- Create a new step
    local step = Instance.new("Part")
    step.Size = Vector3.new(5, 1, 5)  -- Width, Height, Depth
    step.Position = startBlock.Position + Vector3.new(0, i * 2, i * 5)
    step.Anchored = true
    step.Material = Enum.Material.Concrete
    step.BrickColor = BrickColor.new("Medium stone grey")
    step.Parent = workspace
    
    -- Add the step number as a label
    local stepLabel = Instance.new("SurfaceGui", step)
    local textLabel = Instance.new("TextLabel", stepLabel)
    stepLabel.Face = Enum.NormalId.Top
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextScaled = true
    textLabel.Text = i
end

print("Staircase with " .. numberOfSteps .. " steps created!")
```

**Extensions:**
- Create a spiral staircase using math.sin and math.cos
- Add railings to the sides of the stairs
- Make each step a different color based on its position

### Challenge 2: Gem Collector

**Objective:** Create a gem collection game with a countdown timer.

**Setup:**
1. Create a platform for the player to walk on
2. Add a script to the workspace

**Code Template:**
```lua
local gameTime = 30  -- Game lasts 30 seconds
local totalGems = 15  -- Number of gems to spawn
local score = 0

-- Create a scoreboard
local scoreboard = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
local scoreLabel = Instance.new("TextLabel", scoreboard)
local timeLabel = Instance.new("TextLabel", scoreboard)

scoreLabel.Size = UDim2.new(0, 200, 0, 50)
scoreLabel.Position = UDim2.new(0, 10, 0, 10)
scoreLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
scoreLabel.BackgroundTransparency = 0.5
scoreLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
scoreLabel.TextScaled = true
scoreLabel.Text = "Score: 0"

timeLabel.Size = UDim2.new(0, 200, 0, 50)
timeLabel.Position = UDim2.new(0, 10, 0, 70)
timeLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
timeLabel.BackgroundTransparency = 0.5
timeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
timeLabel.TextScaled = true
timeLabel.Text = "Time: 30"

-- CHALLENGE: Use a loop to create gems around the map
for i = 1, totalGems do
    -- Create a gem
    local gem = Instance.new("Part")
    gem.Name = "Gem"
    gem.Shape = Enum.PartType.Ball
    gem.Size = Vector3.new(1, 1, 1)
    gem.Material = Enum.Material.Neon
    
    -- Random color for each gem
    local colors = {
        Color3.fromRGB(255, 0, 0),    -- Red
        Color3.fromRGB(0, 255, 0),    -- Green
        Color3.fromRGB(0, 0, 255),    -- Blue
        Color3.fromRGB(255, 255, 0),  -- Yellow
        Color3.fromRGB(255, 0, 255)   -- Purple
    }
    gem.Color = colors[math.random(1, #colors)]
    
    -- Random position on the platform
    local platform = workspace.Platform  -- Make sure to name your platform "Platform"
    local platformSize = platform.Size
    local x = platform.Position.X + math.random(-platformSize.X/2, platformSize.X/2)
    local z = platform.Position.Z + math.random(-platformSize.Z/2, platformSize.Z/2)
    gem.Position = Vector3.new(x, platform.Position.Y + 3, z)
    
    gem.Anchored = true
    gem.CanCollide = false
    
    -- Add a click detector to collect the gem
    local clickDetector = Instance.new("ClickDetector", gem)
    clickDetector.MouseClick:Connect(function()
        score = score + 1
        scoreLabel.Text = "Score: " .. score
        gem:Destroy()
    end)
    
    gem.Parent = workspace
end

-- CHALLENGE: Create a countdown timer
local timeLeft = gameTime
local function updateTimer()
    timeLeft = timeLeft - 1
    timeLabel.Text = "Time: " .. timeLeft
    
    if timeLeft <= 0 then
        timeLabel.Text = "TIME'S UP!"
        timeLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        
        -- Remove all remaining gems
        for _, gem in pairs(workspace:GetChildren()) do
            if gem.Name == "Gem" then
                gem:Destroy()
            end
        end
        
        -- Show final score
        scoreLabel.Text = "FINAL SCORE: " .. score
        return
    end
    
    wait(1)
    updateTimer()
end

-- Start the timer
updateTimer()
```

**Extensions:**
- Add different gem types worth different point values
- Create power-ups that extend the timer
- Add a high score system

### Challenge 3: Moving Platform Course

**Objective:** Create a parkour course with moving platforms.

**Setup:**
1. Create a starting platform and ending platform
2. Add a script to the workspace

**Code Template:**
```lua
local numberOfPlatforms = 5
local platformSpeed = 2  -- Seconds for a complete movement cycle

-- Create a function to make a moving platform
local function createMovingPlatform(position, moveDirection, moveDistance)
    local platform = Instance.new("Part")
    platform.Size = Vector3.new(6, 1, 6)
    platform.Position = position
    platform.Anchored = true
    platform.BrickColor = BrickColor.new("Bright blue")
    platform.Material = Enum.Material.Plastic
    platform.Parent = workspace
    
    -- CHALLENGE: Create a loop that moves the platform back and forth forever
    spawn(function()
        local startPos = platform.Position
        local endPos = startPos + moveDirection * moveDistance
        
        while true do
            -- Move to end position
            for i = 0, 1, 0.01 do
                platform.Position = startPos:Lerp(endPos, i)
                wait(platformSpeed / 100)
            end
            
            -- Move back to start position
            for i = 0, 1, 0.01 do
                platform.Position = endPos:Lerp(startPos, i)
                wait(platformSpeed / 100)
            end
        end
    end)
    
    return platform
end

-- CHALLENGE: Use a loop to create multiple moving platforms
local startPos = Vector3.new(0, 5, 0)
local directions = {
    Vector3.new(1, 0, 0),   -- X direction
    Vector3.new(0, 1, 0),   -- Y direction
    Vector3.new(0, 0, 1),   -- Z direction
    Vector3.new(1, 0, 1),   -- Diagonal XZ
    Vector3.new(1, 1, 0)    -- Diagonal XY
}

for i = 1, numberOfPlatforms do
    local position = startPos + Vector3.new(0, 0, i * 15)
    local direction = directions[(i % #directions) + 1]
    local distance = 10 + i  -- Platforms move further as they go
    
    createMovingPlatform(position, direction, distance)
end

-- Create finish platform
local finishPlatform = Instance.new("Part")
finishPlatform.Size = Vector3.new(10, 1, 10)
finishPlatform.Position = startPos + Vector3.new(0, 0, (numberOfPlatforms + 1) * 15)
finishPlatform.Anchored = true
finishPlatform.BrickColor = BrickColor.new("Bright green")
finishPlatform.Material = Enum.Material.Neon
finishPlatform.Parent = workspace

-- Add finish detection
local function onTouch(hit)
    local player = game.Players:GetPlayerFromCharacter(hit.Parent)
    if player then
        print(player.Name .. " finished the course!")
    end
end

finishPlatform.Touched:Connect(onTouch)
```

**Extensions:**
- Add a timer that tracks how long it takes to complete the course
- Create platforms that disappear after being touched
- Add obstacles that knock players off the platforms

## Challenge Set 2: "Timer Master" Challenges

These challenges focus on using timers for different game mechanics.

### Challenge 1: Bomb Defuser

**Objective:** Create a bomb with a countdown timer that players must defuse.

**Setup:**
1. Create a part to represent the bomb
2. Add a script to the bomb

**Code Template:**
```lua
local bomb = script.Parent
local initialTime = 30  -- Seconds until explosion
local wireCount = 3     -- Number of wires to cut

-- Make the bomb look dangerous
bomb.BrickColor = BrickColor.new("Really black")
bomb.Material = Enum.Material.Metal

-- Create a timer display
local timerGui = Instance.new("BillboardGui", bomb)
local timerLabel = Instance.new("TextLabel", timerGui)
timerGui.Size = UDim2.new(0, 100, 0, 50)
timerGui.StudsOffset = Vector3.new(0, 2, 0)
timerLabel.Size = UDim2.new(1, 0, 1, 0)
timerLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
timerLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
timerLabel.TextScaled = true
timerLabel.Text = tostring(initialTime)

-- Create wires to cut
local wires = {}
local wireColors = {
    Color3.fromRGB(255, 0, 0),   -- Red
    Color3.fromRGB(0, 0, 255),   -- Blue
    Color3.fromRGB(0, 255, 0),   -- Green
    Color3.fromRGB(255, 255, 0), -- Yellow
    Color3.fromRGB(255, 0, 255)  -- Purple
}

-- CHALLENGE: Use a loop to create wires
for i = 1, wireCount do
    local wire = Instance.new("Part")
    wire.Name = "Wire" .. i
    wire.Size = Vector3.new(0.2, 0.2, 4)
    wire.Position = bomb.Position + Vector3.new(0, 1, 0) + Vector3.new((i - (wireCount/2)) * 0.5, 0, 0)
    wire.Color = wireColors[i]
    wire.Anchored = true
    wire.Parent = workspace
    
    -- Add a click detector to cut the wire
    local clickDetector = Instance.new("ClickDetector", wire)
    clickDetector.MouseClick:Connect(function()
        print("Wire " .. i .. " cut!")
        wire.Transparency = 0.8
        wire.ClickDetector.MaxActivationDistance = 0  -- Disable further clicks
        
        -- Check if this is the correct wire
        if i == math.random(1, wireCount) then
            -- Correct wire!
            timerLabel.Text = "DEFUSED!"
            timerLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            isBombActive = false
        else
            -- Wrong wire - reduce time!
            timeLeft = timeLeft - 5
            timerLabel.Text = tostring(timeLeft)
        end
    end)
    
    table.insert(wires, wire)
end

-- CHALLENGE: Create a countdown timer
local timeLeft = initialTime
local isBombActive = true

-- Timer loop
spawn(function()
    while timeLeft > 0 and isBombActive do
        timerLabel.Text = tostring(timeLeft)
        
        -- Make the timer flash faster as time runs out
        if timeLeft <= 5 then
            timerLabel.Visible = not timerLabel.Visible
        end
        
        wait(1)
        timeLeft = timeLeft - 1
    end
    
    -- Time's up - explode!
    if isBombActive then
        timerLabel.Text = "BOOM!"
        bomb.Color = Color3.fromRGB(255, 0, 0)
        
        -- Create explosion effect
        local explosion = Instance.new("Explosion")
        explosion.Position = bomb.Position
        explosion.BlastRadius = 10
        explosion.BlastPressure = 500000
        explosion.Parent = workspace
    end
end)
```

**Extensions:**
- Add a hint system that reveals the correct wire after a certain time
- Create multiple difficulty levels with different timer durations
- Add a multiplayer mode where players must work together

### Challenge 2: Day/Night Cycle

**Objective:** Create a realistic day/night cycle with changing lighting.

**Setup:**
1. Add a script to the workspace

**Code Template:**
```lua
local cycleDuration = 300  -- Complete day/night cycle in seconds (5 minutes)
local lighting = game:GetService("Lighting")

-- Set up initial lighting properties
lighting.ClockTime = 14  -- Start at 2 PM
lighting.GeographicLatitude = 45  -- Affects sun angle

-- Create a clock display
local screenGui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
local clockFrame = Instance.new("Frame", screenGui)
local clockLabel = Instance.new("TextLabel", clockFrame)

clockFrame.Size = UDim2.new(0, 150, 0, 50)
clockFrame.Position = UDim2.new(1, -160, 0, 10)
clockFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
clockFrame.BackgroundTransparency = 0.5

clockLabel.Size = UDim2.new(1, 0, 1, 0)
clockLabel.BackgroundTransparency = 1
clockLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
clockLabel.TextScaled = true
clockLabel.Text = "14:00"

-- CHALLENGE: Create a function to convert 24-hour time to 12-hour format with AM/PM
local function formatTimeString(clockTime)
    local hour = math.floor(clockTime)
    local minute = math.floor((clockTime - hour) * 60)
    
    local period = "AM"
    if hour >= 12 then
        period = "PM"
        if hour > 12 then
            hour = hour - 12
        end
    end
    
    if hour == 0 then
        hour = 12
    end
    
    return string.format("%d:%02d %s", hour, minute, period)
end

-- CHALLENGE: Create a loop that continuously updates the time
while true do
    -- Calculate the new clock time
    local currentTime = lighting.ClockTime
    local newTime = currentTime + (24 / cycleDuration)
    
    -- Reset to 0 if we go past 24
    if newTime >= 24 then
        newTime = newTime - 24
    end
    
    -- Update the lighting
    lighting.ClockTime = newTime
    
    -- Update the clock display
    clockLabel.Text = formatTimeString(newTime)
    
    -- Change sky color based on time
    if newTime >= 6 and newTime < 18 then
        -- Daytime - blue sky
        lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
        lighting.Ambient = Color3.fromRGB(127, 127, 127)
    elseif newTime >= 5 and newTime < 6 then
        -- Sunrise - orange tint
        lighting.OutdoorAmbient = Color3.fromRGB(255, 200, 150)
        lighting.Ambient = Color3.fromRGB(255, 200, 150)
    elseif newTime >= 18 and newTime < 19 then
        -- Sunset - orange tint
        lighting.OutdoorAmbient = Color3.fromRGB(255, 200, 150)
        lighting.Ambient = Color3.fromRGB(255, 200, 150)
    else
        -- Nighttime - dark blue
        lighting.OutdoorAmbient = Color3.fromRGB(20, 20, 50)
        lighting.Ambient = Color3.fromRGB(20, 20, 50)
    end
    
    -- Wait a short time before the next update
    wait(0.1)
end
```

**Extensions:**
- Add weather effects that change based on time (rain at night, clear during day)
- Create a moon that rises at night and a sun that rises during the day
- Add ambient sounds that change with the time of day

### Challenge 3: Wave Survival

**Objective:** Create a game where players must survive waves of enemies.

**Setup:**
1. Create a platform for the player to stand on
2. Add a script to the workspace

**Code Template:**
```lua
local totalWaves = 5
local enemiesPerWave = 3
local timeBetweenWaves = 10
local currentWave = 0
local enemiesRemaining = 0

-- Create a wave display
local screenGui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
local waveLabel = Instance.new("TextLabel", screenGui)
local enemyLabel = Instance.new("TextLabel", screenGui)
local timerLabel = Instance.new("TextLabel", screenGui)

waveLabel.Size = UDim2.new(0, 300, 0, 50)
waveLabel.Position = UDim2.new(0.5, -150, 0, 10)
waveLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
waveLabel.BackgroundTransparency = 0.5
waveLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
waveLabel.TextScaled = true
waveLabel.Text = "Wave: 0/" .. totalWaves

enemyLabel.Size = UDim2.new(0, 300, 0, 50)
enemyLabel.Position = UDim2.new(0.5, -150, 0, 70)
enemyLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
enemyLabel.BackgroundTransparency = 0.5
enemyLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
enemyLabel.TextScaled = true
enemyLabel.Text = "Enemies: 0"

timerLabel.Size = UDim2.new(0, 300, 0, 50)
timerLabel.Position = UDim2.new(0.5, -150, 0, 130)
timerLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
timerLabel.BackgroundTransparency = 0.5
timerLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
timerLabel.TextScaled = true
timerLabel.Text = "Next wave in: " .. timeBetweenWaves

-- Function to spawn an enemy
local function spawnEnemy()
    local enemy = Instance.new("Part")
    enemy.Name = "Enemy"
    enemy.Shape = Enum.PartType.Ball
    enemy.Size = Vector3.new(3, 3, 3)
    enemy.Color = Color3.fromRGB(255, 0, 0)
    enemy.Material = Enum.Material.Neon
    
    -- Random position around the arena
    local arena = workspace.Arena  -- Make sure to name your platform "Arena"
    local angle = math.random() * math.pi * 2
    local distance = 30  -- Spawn distance from center
    local x = arena.Position.X + math.cos(angle) * distance
    local z = arena.Position.Z + math.sin(angle) * distance
    enemy.Position = Vector3.new(x, arena.Position.Y + 5, z)
    
    enemy.Anchored = true
    enemy.CanCollide = true
    
    -- Add a click detector to defeat the enemy
    local clickDetector = Instance.new("ClickDetector", enemy)
    clickDetector.MaxActivationDistance = 50  -- Can click from far away
    clickDetector.MouseClick:Connect(function()
        enemy:Destroy()
        enemiesRemaining = enemiesRemaining - 1
        enemyLabel.Text = "Enemies: " .. enemiesRemaining
        
        -- Check if wave is complete
        if enemiesRemaining <= 0 then
            -- Start countdown to next wave
            startWaveCountdown()
        end
    end)
    
    -- Make the enemy move toward the center
    spawn(function()
        while enemy.Parent do
            local direction = (arena.Position - enemy.Position).Unit
            enemy.Position = enemy.Position + direction * 0.2
            wait(0.1)
        end
    end)
    
    enemy.Parent = workspace
end

-- CHALLENGE: Create a function to start a new wave
local function startWave()
    currentWave = currentWave + 1
    waveLabel.Text = "Wave: " .. currentWave .. "/" .. totalWaves
    
    -- Calculate enemies for this wave
    local enemies = enemiesPerWave + math.floor(currentWave * 1.5)
    enemiesRemaining = enemies
    enemyLabel.Text = "Enemies: " .. enemiesRemaining
    
    -- CHALLENGE: Use a loop to spawn enemies with a delay
    for i = 1, enemies do
        spawn(function()
            wait(i * 0.5)  -- Stagger enemy spawns
            spawnEnemy()
        end)
    end
    
    -- Check if this is the final wave
    if currentWave >= totalWaves then
        timerLabel.Text = "FINAL WAVE!"
    end
end

-- Function to start countdown to next wave
function startWaveCountdown()
    -- Skip countdown if all waves complete
    if currentWave >= totalWaves then
        timerLabel.Text = "YOU WIN!"
        return
    end
    
    -- CHALLENGE: Create a countdown timer between waves
    local timeLeft = timeBetweenWaves
    
    spawn(function()
        while timeLeft > 0 do
            timerLabel.Text = "Next wave in: " .. timeLeft
            wait(1)
            timeLeft = timeLeft - 1
        end
        
        timerLabel.Text = "Wave starting!"
        startWave()
    end)
end

-- Start the first wave countdown
startWaveCountdown()
```

**Extensions:**
- Add different types of enemies with unique behaviors
- Create power-ups that appear between waves
- Add a boss enemy for the final wave

## Implementation Guide

To implement these challenges in your Roblox lesson:

1. **Preparation:**
   - Create a base place with the necessary parts for each challenge
   - Set up the basic environment (platforms, starting areas)
   - Provide students with the code templates

2. **Teaching Approach:**
   - Start with the simpler challenges that focus on basic loops
   - Move to timer challenges once students understand loops
   - End with the more complex challenges that combine both concepts

3. **Differentiation:**
   - Basic students: Complete the Stairway Builder challenge
   - Intermediate students: Complete the Gem Collector challenge
   - Advanced students: Attempt the Wave Survival challenge

4. **Assessment:**
   - Can students identify when to use different types of loops?
   - Can students create timers that count up or down?
   - Can students combine loops and timers to create game mechanics?

These challenges provide hands-on practice with loops and timers, which are fundamental concepts in game development.
