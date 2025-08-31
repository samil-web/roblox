--[[
    THE CASE OF THE MISSING CODE - SINGLE SESSION
    Detective Mystery Story-Based Learning Experience
    
    Students become Junior Code Detectives solving their first case!
    Learning Focus: While Loops, Variables, Basic Conditionals
    Duration: 1-2 hours
    Age: 10+ years
]]

-- =============================================
-- STORY SETUP AND CHARACTERS
-- =============================================

local function displayStoryIntro()
    print("🕵️ WELCOME TO THE DIGITAL DETECTIVE ACADEMY 🕵️")
    print("=" .. string.rep("=", 50))
    print()
    print("Detective Chief Martinez: 'Welcome, Junior Detective!'")
    print("'We have an urgent case. Someone broke into our academy")
    print("and stole the secret code to our evidence vault!'")
    print()
    print("'Your mission: Use your programming skills to:")
    print("1. Scan security footage with WHILE LOOPS")
    print("2. Organize evidence with VARIABLES") 
    print("3. Question suspects with IF STATEMENTS")
    print("4. Catch the Code Thief!'")
    print()
    print("Officer Binary: 'Beep boop! Let's solve this case!'")
    print("=" .. string.rep("=", 50))
    wait(3)
end

-- =============================================
-- CHAPTER 1: SECURITY FOOTAGE SCANNER
-- Learning: While Loops + Variables
-- =============================================

local function securityFootageChallenge()
    print("\n🎥 CHAPTER 1: THE SECURITY FOOTAGE SCANNER")
    print("=" .. string.rep("-", 40))
    print()
    print("Detective Martinez: 'We need to scan through 10 hours")
    print("of security footage. Let's build an automatic scanner!'")
    print()
    
    -- Create the security room
    local securityRoom = Instance.new("Folder")
    securityRoom.Name = "SecurityRoom"
    securityRoom.Parent = workspace
    
    -- Create security monitors
    local function createMonitor(position, monitorNumber)
        local monitor = Instance.new("Part")
        monitor.Name = "Monitor_" .. monitorNumber
        monitor.Size = Vector3.new(4, 3, 0.2)
        monitor.Position = position
        monitor.Color = Color3.fromRGB(20, 20, 20) -- Dark screen
        monitor.Anchored = true
        monitor.Parent = securityRoom
        
        -- Add screen effect
        local screenGui = Instance.new("SurfaceGui")
        screenGui.Face = Enum.NormalId.Front
        screenGui.Parent = monitor
        
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundColor3 = Color3.fromRGB(0, 50, 0) -- Green screen
        frame.Parent = screenGui
        
        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = "SCANNING..."
        textLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        textLabel.TextScaled = true
        textLabel.Font = Enum.Font.Code
        textLabel.Parent = frame
        
        return monitor, textLabel
    end
    
    -- Create 3 monitors
    local monitor1, screen1 = createMonitor(Vector3.new(-6, 5, 0), 1)
    local monitor2, screen2 = createMonitor(Vector3.new(0, 5, 0), 2)  
    local monitor3, screen3 = createMonitor(Vector3.new(6, 5, 0), 3)
    
    -- Variables for our investigation
    local hoursScanned = 0
    local totalHours = 10
    local cluesFound = 0
    local suspiciousActivity = {2, 5, 8} -- Hours where clues appear
    
    print("🔍 DETECTIVE CHALLENGE:")
    print("Use a WHILE LOOP to scan through security footage!")
    print("We need to check each hour until we've scanned all " .. totalHours .. " hours.")
    print()
    
    -- The main while loop challenge
    while hoursScanned < totalHours do
        hoursScanned = hoursScanned + 1
        
        -- Update all screens
        screen1.Text = "HOUR " .. hoursScanned .. "/" .. totalHours
        screen2.Text = "SCANNING..."
        screen3.Text = "CLUES: " .. cluesFound
        
        print("🕐 Scanning hour " .. hoursScanned .. " of " .. totalHours)
        
        -- Check if this hour has suspicious activity
        local foundClue = false
        for i = 1, #suspiciousActivity do
            if hoursScanned == suspiciousActivity[i] then
                foundClue = true
                cluesFound = cluesFound + 1
                
                -- Create a clue object in the world
                local clue = Instance.new("Part")
                clue.Name = "Clue_Hour_" .. hoursScanned
                clue.Size = Vector3.new(1, 1, 1)
                clue.Position = Vector3.new(math.random(-10, 10), 1, math.random(-5, 5))
                clue.Color = Color3.fromRGB(255, 255, 0) -- Yellow clue
                clue.Shape = Enum.PartType.Ball
                clue.Anchored = true
                clue.Parent = securityRoom
                
                -- Add clue label
                local billboardGui = Instance.new("BillboardGui")
                billboardGui.Size = UDim2.new(2, 0, 1, 0)
                billboardGui.Parent = clue
                
                local clueLabel = Instance.new("TextLabel")
                clueLabel.Size = UDim2.new(1, 0, 1, 0)
                clueLabel.BackgroundTransparency = 1
                clueLabel.Text = "CLUE!"
                clueLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
                clueLabel.TextScaled = true
                clueLabel.Font = Enum.Font.SourceSansBold
                clueLabel.Parent = billboardGui
                
                print("🚨 SUSPICIOUS ACTIVITY DETECTED in hour " .. hoursScanned .. "!")
                print("📋 Clue found and added to evidence!")
                break
            end
        end
        
        if not foundClue then
            print("   Nothing suspicious this hour...")
        end
        
        wait(1) -- Pause to see the scanning process
    end
    
    -- Update final screen
    screen1.Text = "SCAN COMPLETE"
    screen2.Text = "ANALYSIS DONE"
    screen3.Text = "CLUES: " .. cluesFound
    
    print()
    print("🎉 CHAPTER 1 COMPLETE!")
    print("Detective Martinez: 'Excellent work! You found " .. cluesFound .. " clues")
    print("using a while loop to scan through all the footage!'")
    print("Officer Binary: 'Beep! While loops are perfect for repetitive tasks!'")
    print()
    
    return cluesFound
end

-- =============================================
-- CHAPTER 2: EVIDENCE ORGANIZATION
-- Learning: Variables + Conditionals
-- =============================================

local function evidenceOrganizationChallenge(cluesFound)
    print("\n📋 CHAPTER 2: THE EVIDENCE LOCKER")
    print("=" .. string.rep("-", 40))
    print()
    print("Detective Martinez: 'Now we need to organize our evidence")
    print("and figure out what each clue tells us!'")
    print()
    
    -- Create evidence locker
    local evidenceLocker = Instance.new("Folder")
    evidenceLocker.Name = "EvidenceLocker"
    evidenceLocker.Parent = workspace
    
    -- Evidence storage variables
    local fingerprints = 0
    local footprints = 0
    local codeFragments = 0
    local suspectName = "Unknown"
    
    -- Create evidence locker building
    local locker = Instance.new("Part")
    locker.Name = "EvidenceLocker"
    locker.Size = Vector3.new(10, 8, 6)
    locker.Position = Vector3.new(15, 4, 0)
    locker.Color = Color3.fromRGB(100, 100, 100)
    locker.Anchored = true
    locker.Parent = evidenceLocker
    
    print("🔍 DETECTIVE CHALLENGE:")
    print("Use VARIABLES to store different types of evidence!")
    print("Use IF STATEMENTS to analyze what we found!")
    print()
    
    -- Analyze each clue using variables and conditionals
    local clueNumber = 0
    while clueNumber < cluesFound do
        clueNumber = clueNumber + 1
        
        print("🔎 Analyzing clue #" .. clueNumber .. "...")
        
        -- Each clue contains different evidence (random)
        local evidenceType = math.random(1, 3)
        
        if evidenceType == 1 then
            fingerprints = fingerprints + 1
            print("   Found: Fingerprint evidence!")
            
            -- Create fingerprint visual
            local evidence = Instance.new("Part")
            evidence.Name = "Fingerprint_" .. fingerprints
            evidence.Size = Vector3.new(0.5, 0.1, 0.5)
            evidence.Position = Vector3.new(12 + fingerprints, 2, -2)
            evidence.Color = Color3.fromRGB(139, 69, 19) -- Brown
            evidence.Anchored = true
            evidence.Parent = evidenceLocker
            
        elseif evidenceType == 2 then
            footprints = footprints + 1
            print("   Found: Footprint evidence!")
            
            -- Create footprint visual
            local evidence = Instance.new("Part")
            evidence.Name = "Footprint_" .. footprints
            evidence.Size = Vector3.new(1, 0.1, 2)
            evidence.Position = Vector3.new(15, 1, footprints * 2)
            evidence.Color = Color3.fromRGB(101, 67, 33) -- Dark brown
            evidence.Anchored = true
            evidence.Parent = evidenceLocker
            
        else
            codeFragments = codeFragments + 1
            print("   Found: Code fragment!")
            
            -- Create code fragment visual
            local evidence = Instance.new("Part")
            evidence.Name = "CodeFragment_" .. codeFragments
            evidence.Size = Vector3.new(2, 0.1, 1)
            evidence.Position = Vector3.new(18 - codeFragments, 2, 2)
            evidence.Color = Color3.fromRGB(0, 255, 0) -- Green like code
            evidence.Anchored = true
            evidence.Parent = evidenceLocker
        end
        
        wait(1)
    end
    
    -- Analyze the evidence using conditionals
    print()
    print("📊 EVIDENCE ANALYSIS:")
    print("Fingerprints found: " .. fingerprints)
    print("Footprints found: " .. footprints)
    print("Code fragments found: " .. codeFragments)
    print()
    
    -- Use conditionals to determine the suspect
    if fingerprints >= 2 and codeFragments >= 1 then
        suspectName = "Dr. Syntax"
        print("🎯 SUSPECT IDENTIFIED: Dr. Syntax")
        print("   Evidence: Multiple fingerprints + code knowledge")
    elseif footprints >= 2 then
        suspectName = "Sneaky Pete"
        print("🎯 SUSPECT IDENTIFIED: Sneaky Pete")
        print("   Evidence: Multiple footprints suggest sneaking around")
    else
        suspectName = "The Ghost Hacker"
        print("🎯 SUSPECT IDENTIFIED: The Ghost Hacker")
        print("   Evidence: Limited physical evidence suggests digital-only crime")
    end
    
    print()
    print("🎉 CHAPTER 2 COMPLETE!")
    print("Detective Martinez: 'Great detective work! You used variables")
    print("to organize evidence and conditionals to identify our suspect!'")
    print("Officer Binary: 'Variables store data, conditionals make decisions!'")
    print()
    
    return suspectName
end

-- =============================================
-- CHAPTER 3: THE FINAL CONFRONTATION
-- Learning: Combining all concepts
-- =============================================

local function finalConfrontation(suspectName)
    print("\n⚔️ CHAPTER 3: CATCHING THE CODE THIEF")
    print("=" .. string.rep("-", 40))
    print()
    print("Detective Martinez: 'Time for the final confrontation!")
    print("We need to build a trap to catch " .. suspectName .. "!'")
    print()
    
    -- Create confrontation scene
    local trapRoom = Instance.new("Folder")
    trapRoom.Name = "TrapRoom"
    trapRoom.Parent = workspace
    
    -- Create the trap mechanism
    local trap = Instance.new("Part")
    trap.Name = "CodeTrap"
    trap.Size = Vector3.new(8, 1, 8)
    trap.Position = Vector3.new(-15, 0.5, 0)
    trap.Color = Color3.fromRGB(255, 0, 0) -- Red trap
    trap.Anchored = true
    trap.Parent = trapRoom
    
    -- Create suspect
    local suspect = Instance.new("Part")
    suspect.Name = suspectName
    suspect.Size = Vector3.new(2, 4, 1)
    suspect.Position = Vector3.new(-15, 3, 0)
    suspect.Color = Color3.fromRGB(50, 50, 50) -- Dark figure
    suspect.Anchored = true
    suspect.Parent = trapRoom
    
    -- Add suspect label
    local suspectGui = Instance.new("BillboardGui")
    suspectGui.Size = UDim2.new(3, 0, 1, 0)
    suspectGui.Parent = suspect
    
    local suspectLabel = Instance.new("TextLabel")
    suspectLabel.Size = UDim2.new(1, 0, 1, 0)
    suspectLabel.BackgroundTransparency = 1
    suspectLabel.Text = suspectName
    suspectLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    suspectLabel.TextScaled = true
    suspectLabel.Font = Enum.Font.SourceSansBold
    suspectLabel.Parent = suspectGui
    
    print("🎯 FINAL CHALLENGE:")
    print("Use a while loop to activate the trap sequence!")
    print("We need to run through a 5-step security protocol.")
    print()
    
    -- Variables for the trap sequence
    local trapStep = 0
    local maxSteps = 5
    local trapActivated = false
    
    -- The final while loop challenge
    while trapStep < maxSteps and not trapActivated do
        trapStep = trapStep + 1
        
        print("🔧 Activating trap step " .. trapStep .. " of " .. maxSteps)
        
        if trapStep == 1 then
            print("   Scanning for intruder...")
            trap.Color = Color3.fromRGB(255, 255, 0) -- Yellow
        elseif trapStep == 2 then
            print("   Locking all exits...")
            trap.Color = Color3.fromRGB(255, 127, 0) -- Orange
        elseif trapStep == 3 then
            print("   Activating force field...")
            trap.Color = Color3.fromRGB(0, 255, 255) -- Cyan
        elseif trapStep == 4 then
            print("   Deploying capture net...")
            trap.Color = Color3.fromRGB(0, 255, 0) -- Green
        else
            print("   TRAP ACTIVATED!")
            trap.Color = Color3.fromRGB(255, 0, 255) -- Magenta
            trapActivated = true
        end
        
        wait(1)
    end
    
    -- Success!
    suspect.Color = Color3.fromRGB(255, 255, 255) -- Caught!
    suspectLabel.Text = suspectName .. " - CAUGHT!"
    suspectLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    
    print()
    print("🎉 CASE SOLVED!")
    print("=" .. string.rep("=", 30))
    print()
    print("Detective Martinez: 'Outstanding work, Junior Detective!")
    print("You successfully used programming to solve the case!'")
    print()
    print("Officer Binary: 'Beep boop! You learned:")
    print("• WHILE LOOPS for repetitive tasks")
    print("• VARIABLES to store information") 
    print("• CONDITIONALS to make decisions")
    print("• How to combine them all together!'")
    print()
    print("🏆 CONGRATULATIONS! You are now a certified Code Detective!")
    print("The academy is safe thanks to your programming skills!")
end

-- =============================================
-- MAIN STORY FUNCTION
-- =============================================

local function runDetectiveMystery()
    -- Display story introduction
    displayStoryIntro()
    
    -- Chapter 1: Security footage scanning (while loops)
    local cluesFound = securityFootageChallenge()
    wait(2)
    
    -- Chapter 2: Evidence organization (variables + conditionals)
    local suspectName = evidenceOrganizationChallenge(cluesFound)
    wait(2)
    
    -- Chapter 3: Final confrontation (combining concepts)
    finalConfrontation(suspectName)
    
    print()
    print("🎓 LEARNING SUMMARY:")
    print("You completed your first detective case using:")
    print("• While loops to scan security footage")
    print("• Variables to organize evidence")
    print("• Conditionals to identify the suspect")
    print("• Problem-solving skills to catch the thief!")
    print()
    print("Ready for your next case, Detective?")
end

-- =============================================
-- INSTRUCTIONS FOR TEACHERS/STUDENTS
-- =============================================

--[[
    HOW TO USE THIS DETECTIVE MYSTERY:
    
    1. Copy this script into Roblox Studio
    2. Place it in ServerScriptService
    3. Uncomment the line below to start the mystery
    4. Run the game and follow the story!
    
    LEARNING OBJECTIVES:
    - Understanding while loops through security scanning
    - Using variables to store and organize data
    - Making decisions with conditional statements
    - Combining programming concepts to solve problems
    
    DISCUSSION QUESTIONS AFTER COMPLETION:
    - How did while loops help us scan the footage?
    - Why are variables useful for organizing evidence?
    - How do conditionals help us make decisions?
    - What other detective tasks could we automate with code?
]]

-- Uncomment this line to start the detective mystery:
-- runDetectiveMystery()

print("Detective Mystery loaded! Uncomment the last line to start the case!")
