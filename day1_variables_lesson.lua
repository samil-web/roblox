--[[
    DAY 1: VARIABLES - THE EVIDENCE LOCKER
    Detective Mystery Story-Based Learning
    
    Learning Objectives:
    - Understand what variables are and why they're useful
    - Learn to store and retrieve information
    - Practice naming conventions
    
    Story: Students set up their detective workspace and learn to organize information
]]

-- =============================================
-- PRE-BUILT DISCOVERY ENVIRONMENT
-- =============================================

local function createDiscoveryEnvironment()
    print("🏗️ Setting up Detective Academy environment...")
    
    -- Create main academy building
    local academy = Instance.new("Folder")
    academy.Name = "DetectiveAcademy"
    academy.Parent = workspace
    
    -- Academy entrance
    local entrance = Instance.new("Part")
    entrance.Name = "AcademyEntrance"
    entrance.Size = Vector3.new(20, 12, 4)
    entrance.Position = Vector3.new(0, 6, -15)
    entrance.Color = Color3.fromRGB(139, 69, 19) -- Brown building
    entrance.Anchored = true
    entrance.Parent = academy
    
    -- Academy sign
    local academySign = Instance.new("Part")
    academySign.Name = "AcademySign"
    academySign.Size = Vector3.new(12, 3, 0.5)
    academySign.Position = Vector3.new(0, 10, -12.5)
    academySign.Color = Color3.fromRGB(0, 0, 0)
    academySign.Anchored = true
    academySign.Parent = academy
    
    local academyGui = Instance.new("SurfaceGui")
    academyGui.Face = Enum.NormalId.Front
    academyGui.Parent = academySign
    
    local academyText = Instance.new("TextLabel")
    academyText.Size = UDim2.new(1, 0, 1, 0)
    academyText.BackgroundTransparency = 1
    academyText.Text = "🕵️ DIGITAL DETECTIVE ACADEMY 🕵️"
    academyText.TextColor3 = Color3.fromRGB(255, 215, 0)
    academyText.TextScaled = true
    academyText.Font = Enum.Font.SourceSansBold
    academyText.Parent = academyGui
    
    -- Mystery clue signs around the area
    local function createClueSign(position, title, hint, color)
        local sign = Instance.new("Part")
        sign.Name = "ClueSign_" .. title
        sign.Size = Vector3.new(4, 6, 0.5)
        sign.Position = position
        sign.Color = color
        sign.Anchored = true
        sign.Parent = academy
        
        local gui = Instance.new("SurfaceGui")
        gui.Face = Enum.NormalId.Front
        gui.Parent = sign
        
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        frame.BorderSizePixel = 0
        frame.Parent = gui
        
        local titleLabel = Instance.new("TextLabel")
        titleLabel.Size = UDim2.new(1, 0, 0.3, 0)
        titleLabel.Position = UDim2.new(0, 0, 0, 0)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = title
        titleLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        titleLabel.TextScaled = true
        titleLabel.Font = Enum.Font.SourceSansBold
        titleLabel.Parent = frame
        
        local hintLabel = Instance.new("TextLabel")
        hintLabel.Size = UDim2.new(0.9, 0, 0.6, 0)
        hintLabel.Position = UDim2.new(0.05, 0, 0.35, 0)
        hintLabel.BackgroundTransparency = 1
        hintLabel.Text = hint
        hintLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
        hintLabel.TextScaled = true
        hintLabel.Font = Enum.Font.SourceSans
        hintLabel.TextWrapped = true
        hintLabel.Parent = frame
        
        return sign
    end
    
    -- Create discovery signs with hints about variables
    createClueSign(
        Vector3.new(-12, 3, -5),
        "🔍 MISSING!",
        "The evidence vault code has vanished!\n\nDetectives need to organize information...\n\nWhat are those labeled boxes called?",
        Color3.fromRGB(255, 255, 0)
    )
    
    createClueSign(
        Vector3.new(12, 3, -5),
        "📋 WANTED",
        "Seeking: Information Storage Experts\n\nMust know how to:\n• Label important data\n• Store different types of info\n• Organize like a pro detective",
        Color3.fromRGB(255, 100, 100)
    )
    
    createClueSign(
        Vector3.new(-8, 3, 8),
        "🎯 DETECTIVE TOOLS",
        "Every detective needs:\n\n📝 Name tags for evidence\n🔢 Number tracking systems\n✅ True/False checkers\n\nWhat programming concept does this?",
        Color3.fromRGB(100, 255, 100)
    )
    
    createClueSign(
        Vector3.new(8, 3, 8),
        "🏆 TODAY'S MISSION",
        "Learn the SECRET of information storage!\n\nHint: Starts with 'V'\nHint: Like labeled containers\nHint: Foundation of all programming",
        Color3.fromRGB(100, 100, 255)
    )
    
    -- Create mysterious evidence boxes (empty, waiting to be filled)
    local function createMysteryBox(position, label, color)
        local box = Instance.new("Part")
        box.Name = "MysteryBox_" .. label
        box.Size = Vector3.new(2, 2, 2)
        box.Position = position
        box.Color = color
        box.Transparency = 0.5 -- Semi-transparent to show they're "empty"
        box.Anchored = true
        box.Parent = academy
        
        local gui = Instance.new("BillboardGui")
        gui.Size = UDim2.new(2, 0, 1, 0)
        gui.Parent = box
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = "???"
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextScaled = true
        label.Font = Enum.Font.SourceSansBold
        label.Parent = gui
        
        return box
    end
    
    -- Create mystery boxes that will later become evidence storage
    createMysteryBox(Vector3.new(-4, 1, 12), "Mystery1", Color3.fromRGB(139, 69, 19))
    createMysteryBox(Vector3.new(0, 1, 12), "Mystery2", Color3.fromRGB(0, 255, 0))
    createMysteryBox(Vector3.new(4, 1, 12), "Mystery3", Color3.fromRGB(101, 67, 33))
    
    -- Create a "Coming Soon" evidence locker area
    local comingSoon = Instance.new("Part")
    comingSoon.Name = "ComingSoonLocker"
    comingSoon.Size = Vector3.new(12, 8, 6)
    comingSoon.Position = Vector3.new(0, 4, 15)
    comingSoon.Color = Color3.fromRGB(70, 70, 70)
    comingSoon.Transparency = 0.7
    comingSoon.Anchored = true
    comingSoon.Parent = academy
    
    local comingSoonGui = Instance.new("BillboardGui")
    comingSoonGui.Size = UDim2.new(2, 0, 1, 0)
    comingSoonGui.Parent = comingSoon
    
    local comingSoonText = Instance.new("TextLabel")
    comingSoonText.Size = UDim2.new(1, 0, 1, 0)
    comingSoonText.BackgroundTransparency = 1
    comingSoonText.Text = "EVIDENCE LOCKER\n(Under Construction)\n\nLearn today's lesson to unlock!"
    comingSoonText.TextColor3 = Color3.fromRGB(255, 255, 0)
    comingSoonText.TextScaled = true
    comingSoonText.Font = Enum.Font.SourceSansBold
    comingSoonText.TextWrapped = true
    comingSoonText.Parent = comingSoonGui
    
    -- Create spawn platform for students
    local spawnPlatform = Instance.new("Part")
    spawnPlatform.Name = "StudentSpawn"
    spawnPlatform.Size = Vector3.new(10, 1, 10)
    spawnPlatform.Position = Vector3.new(0, 0.5, -25)
    spawnPlatform.Color = Color3.fromRGB(0, 162, 255) -- Blue platform
    spawnPlatform.Anchored = true
    spawnPlatform.Parent = academy
    
    local welcomeSign = Instance.new("Part")
    welcomeSign.Name = "WelcomeSign"
    welcomeSign.Size = Vector3.new(8, 4, 0.5)
    welcomeSign.Position = Vector3.new(0, 3, -20)
    welcomeSign.Color = Color3.fromRGB(0, 0, 0)
    welcomeSign.Anchored = true
    welcomeSign.Parent = academy
    
    local welcomeGui = Instance.new("SurfaceGui")
    welcomeGui.Face = Enum.NormalId.Front
    welcomeGui.Parent = welcomeSign
    
    local welcomeText = Instance.new("TextLabel")
    welcomeText.Size = UDim2.new(1, 0, 1, 0)
    welcomeText.BackgroundTransparency = 1
    welcomeText.Text = "Welcome Junior Detectives!\n\nExplore the clues around you...\nWhat will you learn today?"
    welcomeText.TextColor3 = Color3.fromRGB(255, 255, 255)
    welcomeText.TextScaled = true
    welcomeText.Font = Enum.Font.SourceSans
    welcomeText.TextWrapped = true
    welcomeText.Parent = welcomeGui
    
    print("🎯 Discovery environment created! Students can now explore and discover clues about variables!")
end

-- =============================================
-- STORY INTRODUCTION
-- =============================================

local function startDay1Story()
    print("🕵️ DAY 1: THE EVIDENCE LOCKER")
    print("=" .. string.rep("=", 40))
    print()
    print("Detective Chief Martinez: 'Welcome to your first day at the")
    print("Digital Detective Academy! I'm Chief Martinez.'")
    print()
    print("'Someone has broken into our main computer system and")
    print("stolen the code to our evidence vault. We need your help!'")
    print()
    print("'But first, every good detective needs to learn how to")
    print("organize information. That's where VARIABLES come in!'")
    print()
    print("Officer Binary: 'Beep boop! Variables are like labeled")
    print("boxes where we store important information!'")
    print()
    wait(3)
end

-- =============================================
-- LESSON 1: BASIC VARIABLES
-- =============================================

local function basicVariablesLesson()
    print("\n📝 LESSON 1: CREATING YOUR DETECTIVE PROFILE")
    print("=" .. string.rep("-", 35))
    print()
    print("Detective Martinez: 'Let's start by creating your detective profile.")
    print("We'll use variables to store information about you!'")
    print()
    
    -- Demonstrate variable creation
    print("🔍 CREATING VARIABLES:")
    print("Variables are like name tags for information!")
    print()
    
    -- Student detective profile variables
    local detectiveName = "Junior Detective Smith"
    local badgeNumber = 1001
    local specialization = "Code Analysis"
    local yearsExperience = 0
    local isActive = true
    
    print("✅ Your Detective Profile:")
    print("Name: " .. detectiveName)
    print("Badge Number: " .. badgeNumber)
    print("Specialization: " .. specialization)
    print("Years Experience: " .. yearsExperience)
    print("Active Status: " .. tostring(isActive))
    print()
    
    print("Officer Binary: 'Notice how each variable has:")
    print("• A NAME (like detectiveName)")
    print("• A VALUE (like \"Junior Detective Smith\")")
    print("• A TYPE (text, number, or true/false)'")
    print()
    
    wait(2)
end

-- =============================================
-- LESSON 2: EVIDENCE ORGANIZATION
-- =============================================

local function evidenceOrganizationLesson()
    print("\n🗃️ LESSON 2: ORGANIZING EVIDENCE WITH VARIABLES")
    print("=" .. string.rep("-", 40))
    print()
    print("Detective Martinez: 'Now let's organize some evidence from")
    print("our first case. Each piece of evidence needs proper labeling!'")
    print()
    
    -- Create evidence locker building
    local evidenceRoom = Instance.new("Folder")
    evidenceRoom.Name = "EvidenceRoom_Day1"
    evidenceRoom.Parent = workspace
    
    -- Main evidence locker
    local locker = Instance.new("Part")
    locker.Name = "MainEvidenceLocker"
    locker.Size = Vector3.new(12, 8, 6)
    locker.Position = Vector3.new(0, 4, 0)
    locker.Color = Color3.fromRGB(70, 70, 70) -- Dark gray
    locker.Anchored = true
    locker.Parent = evidenceRoom
    
    -- Evidence variables - different types
    local evidenceCount = 0
    local caseNumber = "CASE-2024-001"
    local leadDetective = "Detective Martinez"
    local evidenceSecure = true
    local lastUpdated = "Day 1"
    
    print("📋 CASE EVIDENCE VARIABLES:")
    print("Case Number: " .. caseNumber)
    print("Lead Detective: " .. leadDetective)
    print("Evidence Count: " .. evidenceCount)
    print("Secure Status: " .. tostring(evidenceSecure))
    print("Last Updated: " .. lastUpdated)
    print()
    
    -- Create evidence storage compartments
    local function createEvidenceBox(position, label, color)
        local box = Instance.new("Part")
        box.Name = "EvidenceBox_" .. label
        box.Size = Vector3.new(2, 2, 2)
        box.Position = position
        box.Color = color
        box.Anchored = true
        box.Parent = evidenceRoom
        
        -- Add label
        local gui = Instance.new("BillboardGui")
        gui.Size = UDim2.new(2, 0, 1, 0)
        gui.Parent = box
        
        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = label
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        textLabel.TextScaled = true
        textLabel.Font = Enum.Font.SourceSansBold
        textLabel.Parent = gui
        
        return box
    end
    
    -- Create different evidence storage boxes
    createEvidenceBox(Vector3.new(-4, 2, 3), "FINGERPRINTS", Color3.fromRGB(139, 69, 19))
    createEvidenceBox(Vector3.new(0, 2, 3), "CODE FRAGMENTS", Color3.fromRGB(0, 255, 0))
    createEvidenceBox(Vector3.new(4, 2, 3), "FOOTPRINTS", Color3.fromRGB(101, 67, 33))
    
    print("🏗️ BUILDING CHALLENGE COMPLETED!")
    print("You've created an evidence locker with labeled compartments!")
    print()
    
    wait(2)
end

-- =============================================
-- LESSON 3: VARIABLE TYPES AND OPERATIONS
-- =============================================

local function variableTypesLesson()
    print("\n🔢 LESSON 3: DIFFERENT TYPES OF VARIABLES")
    print("=" .. string.rep("-", 35))
    print()
    print("Officer Binary: 'Beep! Let's learn about different types")
    print("of information we can store in variables!'")
    print()
    
    -- String variables (text)
    local suspectName = "Dr. Syntax"
    local evidenceDescription = "Suspicious code fragment"
    local location = "Computer Lab"
    
    print("📝 STRING VARIABLES (Text):")
    print("Suspect Name: " .. suspectName)
    print("Evidence: " .. evidenceDescription)
    print("Location: " .. location)
    print()
    
    -- Number variables
    local evidenceCount = 5
    local timeOfCrime = 1430  -- 2:30 PM in 24-hour format
    local suspectHeight = 175  -- centimeters
    
    print("🔢 NUMBER VARIABLES:")
    print("Evidence Count: " .. evidenceCount)
    print("Time of Crime: " .. timeOfCrime)
    print("Suspect Height: " .. suspectHeight .. " cm")
    print()
    
    -- Boolean variables (true/false)
    local caseOpen = true
    local suspectArrested = false
    local evidenceSecure = true
    
    print("✅ BOOLEAN VARIABLES (True/False):")
    print("Case Open: " .. tostring(caseOpen))
    print("Suspect Arrested: " .. tostring(suspectArrested))
    print("Evidence Secure: " .. tostring(evidenceSecure))
    print()
    
    -- Demonstrate variable operations
    print("🔧 VARIABLE OPERATIONS:")
    evidenceCount = evidenceCount + 2  -- Add more evidence
    print("Found 2 more pieces of evidence!")
    print("New Evidence Count: " .. evidenceCount)
    print()
    
    suspectName = suspectName .. " (Prime Suspect)"  -- Add to string
    print("Updated Suspect: " .. suspectName)
    print()
    
    wait(2)
end

-- =============================================
-- INTERACTIVE CHALLENGE
-- =============================================

local function interactiveChallenge()
    print("\n🎯 INTERACTIVE CHALLENGE: BUILD YOUR CASE FILE")
    print("=" .. string.rep("-", 40))
    print()
    print("Detective Martinez: 'Time to put your variable skills to the test!")
    print("Create a complete case file for our investigation!'")
    print()
    
    -- Challenge: Students create their own case file variables
    print("📋 YOUR MISSION:")
    print("Create variables for a new case file. Include:")
    print("• Case information (number, type, priority)")
    print("• Suspect details (name, age, occupation)")
    print("• Evidence tracking (count, types, locations)")
    print("• Investigation status (open/closed, progress)")
    print()
    
    -- Example solution
    print("🔍 EXAMPLE CASE FILE:")
    
    -- Case information
    local newCaseNumber = "CASE-2024-002"
    local caseType = "Digital Theft"
    local casePriority = "High"
    
    -- Suspect information
    local primarySuspect = "Ms. Binary"
    local suspectAge = 34
    local suspectOccupation = "IT Administrator"
    
    -- Evidence tracking
    local totalEvidence = 3
    local evidenceTypes = "Digital, Physical, Witness"
    local evidenceLocation = "Server Room"
    
    -- Investigation status
    local investigationOpen = true
    local progressPercent = 25
    
    print("Case Number: " .. newCaseNumber)
    print("Case Type: " .. caseType)
    print("Priority: " .. casePriority)
    print("Primary Suspect: " .. primarySuspect)
    print("Suspect Age: " .. suspectAge)
    print("Occupation: " .. suspectOccupation)
    print("Total Evidence: " .. totalEvidence)
    print("Evidence Types: " .. evidenceTypes)
    print("Evidence Location: " .. evidenceLocation)
    print("Investigation Open: " .. tostring(investigationOpen))
    print("Progress: " .. progressPercent .. "%")
    print()
    
    -- Create visual case file in the world
    local caseFile = Instance.new("Part")
    caseFile.Name = "CaseFile_" .. newCaseNumber
    caseFile.Size = Vector3.new(3, 0.2, 4)
    caseFile.Position = Vector3.new(8, 2, 0)
    caseFile.Color = Color3.fromRGB(255, 255, 0) -- Yellow folder
    caseFile.Anchored = true
    caseFile.Parent = workspace.EvidenceRoom_Day1
    
    -- Add case file label
    local fileGui = Instance.new("BillboardGui")
    fileGui.Size = UDim2.new(2, 0, 1, 0)
    fileGui.Parent = caseFile
    
    local fileLabel = Instance.new("TextLabel")
    fileLabel.Size = UDim2.new(1, 0, 1, 0)
    fileLabel.BackgroundTransparency = 1
    fileLabel.Text = newCaseNumber
    fileLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    fileLabel.TextScaled = true
    fileLabel.Font = Enum.Font.SourceSansBold
    fileLabel.Parent = fileGui
    
    print("🏗️ CASE FILE CREATED IN EVIDENCE ROOM!")
    print()
    
    wait(2)
end

-- =============================================
-- DAY 1 WRAP-UP
-- =============================================

local function day1WrapUp()
    print("\n🎉 DAY 1 COMPLETE: VARIABLES MASTERED!")
    print("=" .. string.rep("=", 40))
    print()
    print("Detective Martinez: 'Excellent work, Junior Detective!")
    print("You've learned the foundation of programming - variables!'")
    print()
    print("Officer Binary: 'Today you learned:")
    print("• Variables store information with names and values")
    print("• Different types: strings (text), numbers, booleans (true/false)")
    print("• How to organize information like a real detective")
    print("• Building evidence storage systems in Roblox'")
    print()
    print("🔍 DETECTIVE SKILLS GAINED:")
    print("✅ Information Organization")
    print("✅ Data Classification") 
    print("✅ Evidence Management")
    print("✅ Case File Creation")
    print()
    print("📅 TOMORROW: Learn about CONDITIONALS - The Lie Detector!")
    print("We'll use if/then logic to interrogate suspects!")
    print()
    print("🏆 BADGE EARNED: Variable Master Detective!")
end

-- =============================================
-- MAIN DAY 1 FUNCTION
-- =============================================

local function runDay1Lesson()
    createDiscoveryEnvironment()  -- Set up the pre-built environment first
    wait(2)  -- Give students time to explore
    startDay1Story()
    basicVariablesLesson()
    evidenceOrganizationLesson()
    variableTypesLesson()
    interactiveChallenge()
    day1WrapUp()
end

-- =============================================
-- TEACHER INSTRUCTIONS
-- =============================================

--[[
    DAY 1 TEACHER GUIDE:
    
    SETUP (5 minutes):
    1. Load this script in Roblox Studio
    2. Ensure students have access to ServerScriptService
    3. Review variable concepts with class
    
    LESSON FLOW (45-60 minutes):
    1. Story Introduction (5 min)
    2. Basic Variables Lesson (10 min)
    3. Evidence Organization (15 min)
    4. Variable Types (10 min)
    5. Interactive Challenge (10 min)
    6. Wrap-up and Discussion (5 min)
    
    DISCUSSION QUESTIONS:
    - What are variables and why are they useful?
    - How do variables help organize information?
    - What's the difference between strings, numbers, and booleans?
    - How might real detectives use similar organization systems?
    
    ASSESSMENT CHECKLIST:
    □ Student can create variables with appropriate names
    □ Student understands different variable types
    □ Student can retrieve and display variable values
    □ Student completes the case file challenge successfully
    
    EXTENSIONS FOR ADVANCED STUDENTS:
    - Create additional evidence categories
    - Add more complex case file structures
    - Design their own evidence organization system
]]

-- Uncomment to run Day 1 lesson:
-- runDay1Lesson()

print("Day 1: Variables lesson loaded! Uncomment the last line to start.")
