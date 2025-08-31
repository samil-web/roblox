--[[
    ROBLOX WHILE LOOP CHALLENGES
    For 10-year-old students learning Lua programming
    
    These mini-games demonstrate while loops in action
    and provide interactive building experiences
]]

-- =============================================
-- CHALLENGE 1: MAGICAL STAIRCASE BUILDER
-- =============================================
local function magicalStaircaseBuilder()
    print("=== MAGICAL STAIRCASE BUILDER ===")
    print("This script builds a colorful staircase that changes colors!")
    
    -- Create folder to organize our staircase
    local staircase = Instance.new("Folder")
    staircase.Name = "MagicalStaircase"
    staircase.Parent = workspace
    
    -- Variables for our staircase
    local stepsBuilt = 0
    local maxSteps = 10
    local stepSize = 4
    local startPosition = Vector3.new(0, 0, 0)
    
    -- Colors for our staircase (rainbow colors)
    local colors = {
        Color3.fromRGB(255, 0, 0),    -- Red
        Color3.fromRGB(255, 127, 0),  -- Orange
        Color3.fromRGB(255, 255, 0),  -- Yellow
        Color3.fromRGB(0, 255, 0),    -- Green
        Color3.fromRGB(0, 0, 255),    -- Blue
        Color3.fromRGB(75, 0, 130),   -- Indigo
        Color3.fromRGB(148, 0, 211)   -- Violet
    }
    
    -- Use a while loop to build the staircase
    while stepsBuilt < maxSteps do
        -- Create a new step
        local step = Instance.new("Part")
        step.Size = Vector3.new(stepSize, 1, stepSize)
        step.Position = startPosition + Vector3.new(0, stepsBuilt, stepsBuilt * 2)
        
        -- Make each step a different color
        step.Color = colors[(stepsBuilt % #colors) + 1]
        
        -- Make the step not fall
        step.Anchored = true
        
        -- Add the step to our staircase folder
        step.Parent = staircase
        
        -- Add a number to each step
        local stepNumber = Instance.new("StringValue")
        stepNumber.Name = "StepNumber"
        stepNumber.Value = tostring(stepsBuilt + 1)
        stepNumber.Parent = step
        
        -- Increment our counter
        stepsBuilt = stepsBuilt + 1
        
        -- Wait a bit to see the staircase build gradually
        wait(0.5)
        
        print("Built step " .. stepsBuilt .. " of " .. maxSteps)
    end
    
    print("Staircase complete! Try walking up it!")
end

-- =============================================
-- CHALLENGE 2: HUNGRY MONSTER GAME
-- =============================================
local function hungryMonsterGame()
    print("=== HUNGRY MONSTER GAME ===")
    print("Feed the monster until it's full!")
    
    -- Create a monster
    local monster = Instance.new("Part")
    monster.Name = "HungryMonster"
    monster.Size = Vector3.new(5, 5, 5)
    monster.Position = Vector3.new(0, 5, 0)
    monster.Color = Color3.fromRGB(0, 255, 0) -- Green monster
    monster.Anchored = true
    monster.Parent = workspace
    
    -- Create monster's face
    local face = Instance.new("Decal")
    face.Name = "MonsterFace"
    face.Texture = "rbxassetid://7028533"  -- Silly face texture
    face.Face = Enum.NormalId.Front
    face.Parent = monster
    
    -- Monster's hunger stats
    local hunger = 100
    local foodValue = 10
    local foodsEaten = 0
    
    -- Create a platform for the monster
    local platform = Instance.new("Part")
    platform.Name = "Platform"
    platform.Size = Vector3.new(20, 1, 20)
    platform.Position = Vector3.new(0, 0, 0)
    platform.Color = Color3.fromRGB(150, 150, 150)
    platform.Anchored = true
    platform.Parent = workspace
    
    -- Function to create food
    local function createFood()
        local food = Instance.new("Part")
        food.Name = "Food_" .. foodsEaten
        food.Size = Vector3.new(1, 1, 1)
        
        -- Random position near the monster
        local randomX = math.random(-7, 7)
        local randomZ = math.random(-7, 7)
        food.Position = Vector3.new(randomX, 1.5, randomZ)
        
        -- Random food color
        food.Color = Color3.fromRGB(
            math.random(100, 255),
            math.random(100, 255),
            math.random(100, 255)
        )
        
        food.Anchored = false
        food.CanCollide = true
        food.Parent = workspace
        
        -- Make the food move toward the monster
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(1000, 0, 1000)
        bodyVelocity.Velocity = (monster.Position - food.Position).Unit * 5
        bodyVelocity.Parent = food
        
        return food
    end
    
    -- Use a while loop to feed the monster until it's full
    while hunger > 0 do
        -- Create a new piece of food
        local food = createFood()
        foodsEaten = foodsEaten + 1
        
        -- Wait for the food to reach the monster
        wait(2)
        
        -- Remove the food (monster ate it)
        food:Destroy()
        
        -- Reduce hunger
        hunger = hunger - foodValue
        
        -- Make the monster grow a little each time it eats
        monster.Size = monster.Size + Vector3.new(0.2, 0.2, 0.2)
        
        -- Update hunger status
        print("Monster ate food #" .. foodsEaten .. "! Hunger: " .. hunger .. "/100")
        
        -- Wait before next feeding
        wait(0.5)
    end
    
    -- Monster is full!
    monster.Color = Color3.fromRGB(255, 0, 255) -- Change to purple when full
    print("The monster is full after eating " .. foodsEaten .. " pieces of food!")
    print("Game complete!")
end

-- =============================================
-- CHALLENGE 3: TREASURE HUNT ADVENTURE
-- =============================================
local function treasureHuntAdventure()
    print("=== TREASURE HUNT ADVENTURE ===")
    print("Find all the hidden treasures!")
    
    -- Create the game area
    local gameArea = Instance.new("Folder")
    gameArea.Name = "TreasureHuntArea"
    gameArea.Parent = workspace
    
    -- Create the ground
    local ground = Instance.new("Part")
    ground.Name = "Ground"
    ground.Size = Vector3.new(50, 1, 50)
    ground.Position = Vector3.new(0, 0, 0)
    ground.Color = Color3.fromRGB(121, 85, 72) -- Brown ground
    ground.Anchored = true
    ground.Parent = gameArea
    
    -- Variables for our treasure hunt
    local treasuresHidden = 0
    local maxTreasures = 5
    local treasuresFound = 0
    
    -- Use a while loop to hide treasures
    while treasuresHidden < maxTreasures do
        -- Create a treasure chest
        local treasure = Instance.new("Part")
        treasure.Name = "Treasure_" .. treasuresHidden
        treasure.Size = Vector3.new(2, 2, 2)
        
        -- Random position on the ground
        local randomX = math.random(-20, 20)
        local randomZ = math.random(-20, 20)
        treasure.Position = Vector3.new(randomX, 2, randomZ)
        
        -- Make it look like a treasure chest
        treasure.Color = Color3.fromRGB(255, 215, 0) -- Gold color
        treasure.Anchored = true
        treasure.Parent = gameArea
        
        -- Create a hint marker
        local hint = Instance.new("Part")
        hint.Name = "Hint_" .. treasuresHidden
        hint.Size = Vector3.new(1, 10, 1)
        hint.Position = Vector3.new(randomX, 7, randomZ)
        hint.Color = Color3.fromRGB(255, 0, 0) -- Red hint
        hint.Transparency = 0.8
        hint.Anchored = true
        hint.Parent = gameArea
        
        -- Increment our counter
        treasuresHidden = treasuresHidden + 1
        
        print("Hidden treasure " .. treasuresHidden .. " of " .. maxTreasures)
        wait(1)
    end
    
    print("All treasures hidden! Start searching!")
    print("Use another while loop to collect the treasures!")
    
    --[[
    -- Example collecting loop (for students to complete)
    while treasuresFound < maxTreasures do
        -- Code to find and collect treasures
        -- When a player touches a treasure:
        treasuresFound = treasuresFound + 1
        print("Found treasure " .. treasuresFound .. " of " .. maxTreasures)
    end
    ]]
end

-- =============================================
-- CHALLENGE 4: TOWER DEFENSE WAVE GENERATOR
-- =============================================
local function towerDefenseWaveGenerator()
    print("=== TOWER DEFENSE WAVE GENERATOR ===")
    print("Generate waves of enemies using while loops!")
    
    -- Create the game area
    local gameArea = Instance.new("Folder")
    gameArea.Name = "TowerDefenseArea"
    gameArea.Parent = workspace
    
    -- Create the path
    local path = Instance.new("Part")
    path.Name = "Path"
    path.Size = Vector3.new(5, 1, 40)
    path.Position = Vector3.new(0, 0.5, 0)
    path.Color = Color3.fromRGB(200, 200, 200) -- Gray path
    path.Anchored = true
    path.Parent = gameArea
    
    -- Variables for our tower defense
    local currentWave = 1
    local maxWaves = 3
    local enemiesPerWave = 5
    
    -- Use a while loop to generate waves
    while currentWave <= maxWaves do
        print("Starting Wave " .. currentWave .. " of " .. maxWaves)
        
        -- Variables for this wave
        local enemiesSpawned = 0
        
        -- Use a nested while loop to spawn enemies in this wave
        while enemiesSpawned < enemiesPerWave * currentWave do
            -- Create an enemy
            local enemy = Instance.new("Part")
            enemy.Name = "Enemy_Wave" .. currentWave .. "_" .. enemiesSpawned
            enemy.Size = Vector3.new(1, 1, 1)
            enemy.Position = Vector3.new(0, 1.5, -20 + enemiesSpawned)
            
            -- Different colors for different waves
            if currentWave == 1 then
                enemy.Color = Color3.fromRGB(255, 0, 0) -- Red enemies in wave 1
            elseif currentWave == 2 then
                enemy.Color = Color3.fromRGB(0, 0, 255) -- Blue enemies in wave 2
            else
                enemy.Color = Color3.fromRGB(0, 0, 0) -- Black enemies in wave 3
            end
            
            enemy.Anchored = true
            enemy.Parent = gameArea
            
            -- Increment our counter
            enemiesSpawned = enemiesSpawned + 1
            
            -- Wait before spawning next enemy
            wait(0.5)
        end
        
        print("Wave " .. currentWave .. " complete! Spawned " .. enemiesSpawned .. " enemies.")
        
        -- Wait between waves
        wait(3)
        
        -- Move to next wave
        currentWave = currentWave + 1
    end
    
    print("All waves complete! Tower defense game finished!")
end

-- Function to run all challenges
local function runAllChallenges()
    print("STARTING ROBLOX WHILE LOOP CHALLENGES")
    print("======================================")
    
    -- Run each challenge with a pause between them
    magicalStaircaseBuilder()
    wait(3)
    
    hungryMonsterGame()
    wait(3)
    
    treasureHuntAdventure()
    wait(3)
    
    towerDefenseWaveGenerator()
    
    print("======================================")
    print("ALL CHALLENGES COMPLETE!")
end

-- Uncomment the challenge you want to run:
-- magicalStaircaseBuilder()
-- hungryMonsterGame()
-- treasureHuntAdventure()
-- towerDefenseWaveGenerator()
-- runAllChallenges()

-- Instructions for students:
--[[
    HOW TO USE THESE CHALLENGES:
    
    1. Copy this script into a new Script in Roblox Studio
    2. Place the script in ServerScriptService
    3. Uncomment ONE of the function calls at the bottom of the script
    4. Run the game to see the challenge in action
    5. Study the code to understand how while loops work
    6. Try modifying the values to see what happens!
    
    BONUS CHALLENGE:
    Can you combine two or more of these mini-games into one big game?
]]
