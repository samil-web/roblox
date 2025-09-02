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
-- INTERACTIVE DIALOG SYSTEM
-- =============================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

-- Create dialog GUI for each player
local function createDialogGUI(player)
    local playerGui = player:WaitForChild("PlayerGui")
    
    -- Main dialog frame
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "DetectiveDialog"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui
    
    local dialogFrame = Instance.new("Frame")
    dialogFrame.Name = "DialogFrame"
    dialogFrame.Size = UDim2.new(0.6, 0, 0.4, 0)
    dialogFrame.Position = UDim2.new(0.2, 0, 0.3, 0)
    dialogFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    dialogFrame.BorderSizePixel = 0
    dialogFrame.Visible = false
    dialogFrame.Parent = screenGui
    
    -- Add rounded corners
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = dialogFrame
    
    -- Character portrait
    local portrait = Instance.new("ImageLabel")
    portrait.Name = "Portrait"
    portrait.Size = UDim2.new(0.2, 0, 0.6, 0)
    portrait.Position = UDim2.new(0.05, 0, 0.1, 0)
    portrait.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    portrait.BorderSizePixel = 0
    portrait.Image = "rbxassetid://0" -- Default empty image
    portrait.Parent = dialogFrame
    
    local portraitCorner = Instance.new("UICorner")
    portraitCorner.CornerRadius = UDim.new(0, 8)
    portraitCorner.Parent = portrait
    
    -- Character name label
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "CharacterName"
    nameLabel.Size = UDim2.new(0.65, 0, 0.15, 0)
    nameLabel.Position = UDim2.new(0.3, 0, 0.05, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = "Detective Martinez"
    nameLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    nameLabel.TextScaled = true
    nameLabel.Font = Enum.Font.SourceSansBold
    nameLabel.Parent = dialogFrame
    
    -- Dialog text
    local dialogText = Instance.new("TextLabel")
    dialogText.Name = "DialogText"
    dialogText.Size = UDim2.new(0.65, 0, 0.5, 0)
    dialogText.Position = UDim2.new(0.3, 0, 0.2, 0)
    dialogText.BackgroundTransparency = 1
    dialogText.Text = ""
    dialogText.TextColor3 = Color3.fromRGB(255, 255, 255)
    dialogText.TextScaled = true
    dialogText.Font = Enum.Font.SourceSans
    dialogText.TextWrapped = true
    dialogText.TextXAlignment = Enum.TextXAlignment.Left
    dialogText.TextYAlignment = Enum.TextYAlignment.Top
    dialogText.Parent = dialogFrame
    
    -- OK Button
    local okButton = Instance.new("TextButton")
    okButton.Name = "OKButton"
    okButton.Size = UDim2.new(0.2, 0, 0.15, 0)
    okButton.Position = UDim2.new(0.75, 0, 0.8, 0)
    okButton.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    okButton.BorderSizePixel = 0
    okButton.Text = "OK"
    okButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    okButton.TextScaled = true
    okButton.Font = Enum.Font.SourceSansBold
    okButton.Parent = dialogFrame
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = okButton
    
    -- Task indicator
    local taskFrame = Instance.new("Frame")
    taskFrame.Name = "TaskFrame"
    taskFrame.Size = UDim2.new(0.9, 0, 0.15, 0)
    taskFrame.Position = UDim2.new(0.05, 0, 0.75, 0)
    taskFrame.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    taskFrame.BorderSizePixel = 0
    taskFrame.Visible = false
    taskFrame.Parent = dialogFrame
    
    local taskCorner = Instance.new("UICorner")
    taskCorner.CornerRadius = UDim.new(0, 6)
    taskCorner.Parent = taskFrame
    
    local taskText = Instance.new("TextLabel")
    taskText.Name = "TaskText"
    taskText.Size = UDim2.new(1, 0, 1, 0)
    taskText.BackgroundTransparency = 1
    taskText.Text = "🎯 TASK: Complete the challenge to continue!"
    taskText.TextColor3 = Color3.fromRGB(0, 0, 0)
    taskText.TextScaled = true
    taskText.Font = Enum.Font.SourceSansBold
    taskText.Parent = taskFrame
    
    return screenGui
end

-- Show dialog to all players
local function showDialog(characterName, message, hasTask, taskDescription)
    for _, player in pairs(Players:GetPlayers()) do
        local playerGui = player:WaitForChild("PlayerGui")
        local dialogGui = playerGui:FindFirstChild("DetectiveDialog")
        
        if not dialogGui then
            dialogGui = createDialogGUI(player)
        end
        
        local dialogFrame = dialogGui.DialogFrame
        local nameLabel = dialogFrame.CharacterName
        local dialogText = dialogFrame.DialogText
        local taskFrame = dialogFrame.TaskFrame
        local taskText = taskFrame.TaskText
        
        -- Update dialog content
        nameLabel.Text = characterName
        dialogText.Text = message
        
        -- Show/hide task indicator
        if hasTask then
            taskFrame.Visible = true
            taskText.Text = "🎯 TASK: " .. taskDescription
        else
            taskFrame.Visible = false
        end
        
        -- Show dialog
        dialogFrame.Visible = true
    end
end

-- Hide dialog for all players
local function hideDialog()
    for _, player in pairs(Players:GetPlayers()) do
        local playerGui = player:WaitForChild("PlayerGui")
        local dialogGui = playerGui:FindFirstChild("DetectiveDialog")
        
        if dialogGui then
            dialogGui.DialogFrame.Visible = false
        end
    end
end

-- Wait for any player to click OK
local function waitForOKClick()
    local clicked = false
    local connections = {}
    
    for _, player in pairs(Players:GetPlayers()) do
        local playerGui = player:WaitForChild("PlayerGui")
        local dialogGui = playerGui:FindFirstChild("DetectiveDialog")
        
        if dialogGui then
            local okButton = dialogGui.DialogFrame.OKButton
            local connection = okButton.MouseButton1Click:Connect(function()
                clicked = true
            end)
            table.insert(connections, connection)
        end
    end
    
    -- Wait for click
    while not clicked do
        wait(0.1)
    end
    
    -- Disconnect all connections
    for _, connection in pairs(connections) do
        connection:Disconnect()
    end
    
    hideDialog()
    wait(0.5) -- Brief pause between dialogs
end

-- =============================================
-- STORY INTRODUCTION WITH INTERACTIVE DIALOGS
-- =============================================

local function startDay1Story()
    -- Dialog 1: Welcome
    showDialog(
        "Detective Chief Martinez",
        "Welcome to your first day at the Digital Detective Academy! I'm Chief Martinez.\n\nWe have an urgent situation that requires your help.",
        false,
        ""
    )
    waitForOKClick()
    
    -- Dialog 2: The Problem
    showDialog(
        "Detective Chief Martinez",
        "Someone has broken into our main computer system and stolen the code to our evidence vault!\n\nWe need junior detectives like you to help solve this case.",
        false,
        ""
    )
    waitForOKClick()
    
    -- Dialog 3: Learning Variables
    showDialog(
        "Detective Chief Martinez",
        "But first, every good detective needs to learn how to organize information properly.\n\nThat's where VARIABLES come in!",
        false,
        ""
    )
    waitForOKClick()
    
    -- Dialog 4: Officer Binary Introduction
    showDialog(
        "Officer Binary",
        "Beep boop! Variables are like labeled boxes where we store important information!\n\nThey're the foundation of all detective work... I mean, programming!",
        false,
        ""
    )
    waitForOKClick()
    
    -- Dialog 5: First Task
    showDialog(
        "Detective Chief Martinez",
        "Let's start with your first assignment. We need to create your detective profile using variables.\n\nAre you ready to begin?",
        true,
        "Create your detective profile using variables"
    )
    waitForOKClick()
end

-- =============================================
-- INTERACTIVE TASK SYSTEM
-- =============================================

-- Create task completion GUI
local function createTaskGUI(player, taskTitle, instructions, exampleCode, targetVariables)
    local playerGui = player:WaitForChild("PlayerGui")
    
    -- Task GUI
    local taskGui = Instance.new("ScreenGui")
    taskGui.Name = "DetectiveTask"
    taskGui.ResetOnSpawn = false
    taskGui.Parent = playerGui
    
    -- Main task frame
    local taskFrame = Instance.new("Frame")
    taskFrame.Name = "TaskFrame"
    taskFrame.Size = UDim2.new(0.8, 0, 0.8, 0)
    taskFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
    taskFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    taskFrame.BorderSizePixel = 0
    taskFrame.Parent = taskGui
    
    local taskCorner = Instance.new("UICorner")
    taskCorner.CornerRadius = UDim.new(0, 15)
    taskCorner.Parent = taskFrame
    
    -- Task title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0.1, 0)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    titleLabel.BorderSizePixel = 0
    titleLabel.Text = "🎯 " .. taskTitle
    titleLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    titleLabel.TextScaled = true
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.Parent = taskFrame
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 15)
    titleCorner.Parent = titleLabel
    
    -- Instructions
    local instructionsLabel = Instance.new("TextLabel")
    instructionsLabel.Size = UDim2.new(0.95, 0, 0.15, 0)
    instructionsLabel.Position = UDim2.new(0.025, 0, 0.12, 0)
    instructionsLabel.BackgroundTransparency = 1
    instructionsLabel.Text = instructions
    instructionsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    instructionsLabel.TextScaled = true
    instructionsLabel.Font = Enum.Font.SourceSans
    instructionsLabel.TextWrapped = true
    instructionsLabel.TextXAlignment = Enum.TextXAlignment.Left
    instructionsLabel.Parent = taskFrame
    
    -- Example code section
    local exampleFrame = Instance.new("Frame")
    exampleFrame.Size = UDim2.new(0.45, 0, 0.5, 0)
    exampleFrame.Position = UDim2.new(0.025, 0, 0.28, 0)
    exampleFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    exampleFrame.BorderSizePixel = 0
    exampleFrame.Parent = taskFrame
    
    local exampleCorner = Instance.new("UICorner")
    exampleCorner.CornerRadius = UDim.new(0, 10)
    exampleCorner.Parent = exampleFrame
    
    local exampleTitle = Instance.new("TextLabel")
    exampleTitle.Size = UDim2.new(1, 0, 0.1, 0)
    exampleTitle.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    exampleTitle.BorderSizePixel = 0
    exampleTitle.Text = "📖 EXAMPLE CODE"
    exampleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    exampleTitle.TextScaled = true
    exampleTitle.Font = Enum.Font.SourceSansBold
    exampleTitle.Parent = exampleFrame
    
    local exampleTitleCorner = Instance.new("UICorner")
    exampleTitleCorner.CornerRadius = UDim.new(0, 10)
    exampleTitleCorner.Parent = exampleTitle
    
    local exampleCode = Instance.new("TextLabel")
    exampleCode.Size = UDim2.new(0.95, 0, 0.85, 0)
    exampleCode.Position = UDim2.new(0.025, 0, 0.12, 0)
    exampleCode.BackgroundTransparency = 1
    exampleCode.Text = exampleCode

    exampleCode.TextColor3 = Color3.fromRGB(0, 255, 0)
    exampleCode.TextScaled = true
    exampleCode.Font = Enum.Font.Code
    exampleCode.TextWrapped = true
    exampleCode.TextXAlignment = Enum.TextXAlignment.Left
    exampleCode.TextYAlignment = Enum.TextYAlignment.Top
    exampleCode.Parent = exampleFrame
    
    -- Student work area
    local workFrame = Instance.new("Frame")
    workFrame.Size = UDim2.new(0.45, 0, 0.5, 0)
    workFrame.Position = UDim2.new(0.525, 0, 0.28, 0)
    workFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    workFrame.BorderSizePixel = 0
    workFrame.Parent = taskFrame
    
    local workCorner = Instance.new("UICorner")
    workCorner.CornerRadius = UDim.new(0, 10)
    workCorner.Parent = workFrame
    
    local workTitle = Instance.new("TextLabel")
    workTitle.Size = UDim2.new(1, 0, 0.1, 0)
    workTitle.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
    workTitle.BorderSizePixel = 0
    workTitle.Text = "✏️ YOUR CODE"
    workTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    workTitle.TextScaled = true
    workTitle.Font = Enum.Font.SourceSansBold
    workTitle.Parent = workFrame
    
    local workTitleCorner = Instance.new("UICorner")
    workTitleCorner.CornerRadius = UDim.new(0, 10)
    workTitleCorner.Parent = workTitle
    
    local codeInput = Instance.new("TextBox")
    codeInput.Name = "CodeInput"
    codeInput.Size = UDim2.new(0.95, 0, 0.85, 0)
    codeInput.Position = UDim2.new(0.025, 0, 0.12, 0)
    codeInput.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    codeInput.BorderSizePixel = 0
    codeInput.Text = "-- Type your variable code here!\n-- Example: local myName = \"Detective Smith\""
    codeInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    codeInput.TextScaled = false
    codeInput.TextSize = 14
    codeInput.Font = Enum.Font.Code
    codeInput.TextWrapped = true
    codeInput.TextXAlignment = Enum.TextXAlignment.Left
    codeInput.TextYAlignment = Enum.TextYAlignment.Top
    codeInput.MultiLine = true
    codeInput.ClearTextOnFocus = false
    codeInput.Parent = workFrame
    
    local inputCorner = Instance.new("UICorner")
    inputCorner.CornerRadius = UDim.new(0, 8)
    inputCorner.Parent = codeInput
    
    -- Buttons
    local buttonFrame = Instance.new("Frame")
    buttonFrame.Size = UDim2.new(1, 0, 0.12, 0)
    buttonFrame.Position = UDim2.new(0, 0, 0.85, 0)
    buttonFrame.BackgroundTransparency = 1
    buttonFrame.Parent = taskFrame
    
    local testButton = Instance.new("TextButton")
    testButton.Name = "TestButton"
    testButton.Size = UDim2.new(0.2, 0, 0.8, 0)
    testButton.Position = UDim2.new(0.3, 0, 0.1, 0)
    testButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    testButton.BorderSizePixel = 0
    testButton.Text = "🧪 TEST CODE"
    testButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    testButton.TextScaled = true
    testButton.Font = Enum.Font.SourceSansBold
    testButton.Parent = buttonFrame
    
    local testCorner = Instance.new("UICorner")
    testCorner.CornerRadius = UDim.new(0, 8)
    testCorner.Parent = testButton
    
    local submitButton = Instance.new("TextButton")
    submitButton.Name = "SubmitButton"
    submitButton.Size = UDim2.new(0.2, 0, 0.8, 0)
    submitButton.Position = UDim2.new(0.55, 0, 0.1, 0)
    submitButton.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    submitButton.BorderSizePixel = 0
    submitButton.Text = "✅ SUBMIT"
    submitButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    submitButton.TextScaled = true
    submitButton.Font = Enum.Font.SourceSansBold
    submitButton.Parent = buttonFrame
    
    local submitCorner = Instance.new("UICorner")
    submitCorner.CornerRadius = UDim.new(0, 8)
    submitCorner.Parent = submitButton
    
    -- Results area
    local resultsLabel = Instance.new("TextLabel")
    resultsLabel.Name = "ResultsLabel"
    resultsLabel.Size = UDim2.new(0.95, 0, 0.08, 0)
    resultsLabel.Position = UDim2.new(0.025, 0, 0.79, 0)
    resultsLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    resultsLabel.BorderSizePixel = 0
    resultsLabel.Text = "💡 Write your variables and click TEST CODE to see if they work!"
    resultsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    resultsLabel.TextScaled = true
    resultsLabel.Font = Enum.Font.SourceSans
    resultsLabel.TextWrapped = true
    resultsLabel.Parent = taskFrame
    
    local resultsCorner = Instance.new("UICorner")
    resultsCorner.CornerRadius = UDim.new(0, 8)
    resultsCorner.Parent = resultsLabel
    
    return taskGui, codeInput, testButton, submitButton, resultsLabel, exampleCode
end

-- Validate student code for variables
local function validateVariableCode(code, requiredVariables)
    local results = {}
    local success = true
    
    -- Check for each required variable
    for _, varName in pairs(requiredVariables) do
        if string.find(code, "local " .. varName) or string.find(code, varName .. " =") then
            table.insert(results, "✅ Found variable: " .. varName)
        else
            table.insert(results, "❌ Missing variable: " .. varName)
            success = false
        end
    end
    
    -- Check for basic syntax
    if string.find(code, "local") then
        table.insert(results, "✅ Using 'local' keyword correctly")
    else
        table.insert(results, "💡 Tip: Use 'local' before variable names")
    end
    
    return success, table.concat(results, "\n")
end

-- Wait for task completion
local function waitForTaskCompletion(player, requiredVariables)
    local playerGui = player:WaitForChild("PlayerGui")
    local taskGui = playerGui:FindFirstChild("DetectiveTask")
    
    if not taskGui then return false end
    
    local codeInput = taskGui.TaskFrame.CodeInput
    local testButton = taskGui.TaskFrame.TestButton
    local submitButton = taskGui.TaskFrame.SubmitButton
    local resultsLabel = taskGui.TaskFrame.ResultsLabel
    
    local completed = false
    local validated = false
    
    -- Test button functionality
    local testConnection = testButton.MouseButton1Click:Connect(function()
        local code = codeInput.Text
        local success, feedback = validateVariableCode(code, requiredVariables)
        
        if success then
            resultsLabel.Text = "🎉 EXCELLENT! " .. feedback
            resultsLabel.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
            validated = true
        else
            resultsLabel.Text = "🔧 NEEDS WORK: " .. feedback
            resultsLabel.BackgroundColor3 = Color3.fromRGB(150, 150, 0)
            validated = false
        end
    end)
    
    -- Submit button functionality
    local submitConnection = submitButton.MouseButton1Click:Connect(function()
        if validated then
            completed = true
            resultsLabel.Text = "✅ TASK COMPLETED! Great detective work!"
            resultsLabel.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        else
            resultsLabel.Text = "⚠️ Please test your code first and fix any issues!"
            resultsLabel.BackgroundColor3 = Color3.fromRGB(200, 100, 0)
        end
    end)
    
    -- Wait for completion
    while not completed do
        wait(0.5)
    end
    
    -- Cleanup
    testConnection:Disconnect()
    submitConnection:Disconnect()
    taskGui:Destroy()
    
    return true
end

-- =============================================
-- LESSON 1: INTERACTIVE VARIABLES TASK
-- =============================================

local function basicVariablesLesson()
    -- Show instruction dialog
    showDialog(
        "Detective Martinez",
        "Now let's create your detective profile using variables. I'll show you an example, then you'll create your own!\n\nVariables are like labeled containers that store information.",
        false,
        ""
    )
    waitForOKClick()
    
    -- Show example dialog
    showDialog(
        "Officer Binary",
        "Beep boop! Here's how variables work:\n\nlocal detectiveName = \"Agent Smith\"\nlocal badgeNumber = 1001\nlocal isActive = true\n\nEach variable has a NAME and a VALUE!",
        false,
        ""
    )
    waitForOKClick()
    
    -- Launch interactive task for all players
    for _, player in pairs(Players:GetPlayers()) do
        spawn(function()
            local taskTitle = "Create Your Detective Profile"
            local instructions = "Create variables for your detective character. Include: detectiveName (text), badgeNumber (number), specialization (text), and isActive (true/false)."
            local exampleCode = "-- Example variables:\nlocal detectiveName = \"Agent Smith\"\nlocal badgeNumber = 1001\nlocal specialization = \"Code Analysis\"\nlocal isActive = true\n\n-- Your turn! Create similar variables with your own values."
            local requiredVars = {"detectiveName", "badgeNumber", "specialization", "isActive"}
            
            local taskGui, codeInput, testButton, submitButton, resultsLabel, exampleCodeLabel = createTaskGUI(
                player, taskTitle, instructions, exampleCode, requiredVars
            )
            
            -- Set the example code text
            exampleCodeLabel.Text = exampleCode
            
            -- Wait for completion
            waitForTaskCompletion(player, requiredVars)
        end)
    end
    
    -- Wait for all players to complete (simplified - waits for first completion)
    wait(1)
    while Players:GetPlayers()[1] and Players:GetPlayers()[1].PlayerGui:FindFirstChild("DetectiveTask") do
        wait(1)
    end
    
    -- Success dialog
    showDialog(
        "Detective Martinez",
        "Excellent work! You've successfully created variables to store your detective information.\n\nNow you understand that variables are labeled containers for different types of data!",
        false,
        ""
    )
    waitForOKClick()
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
