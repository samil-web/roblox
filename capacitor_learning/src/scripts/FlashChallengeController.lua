local FlashChallengeController = {}

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- UI Elements
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local challengeGui = playerGui:WaitForChild("FlashChallengeGui")

-- Challenge variables
local currentCapacitance = 500 -- Default value (microfarads)
local isCharging = false
local chargeStartTime = 0
local lastChargeTime = 0

-- Initialize challenge
function FlashChallengeController.init()
    local chargeButton = challengeGui:WaitForChild("ChargeButton")
    local flashButton = challengeGui:WaitForChild("FlashButton")
    local capacitorSlider = challengeGui:WaitForChild("CapacitorSlider")
    local chargeDisplay = challengeGui:WaitForChild("ChargeDisplay")
    
    -- Update capacitor size
    capacitorSlider.Changed:Connect(function(property)
        if property == "Value" then
            currentCapacitance = capacitorSlider.Value
            -- Update visual size of capacitor plates
            updateCapacitorVisuals()
        end
    end)
    
    -- Handle charging
    chargeButton.MouseButton1Down:Connect(function()
        isCharging = true
        chargeStartTime = tick()
        ReplicatedStorage.Events.StartCharging:FireServer()
    end)
    
    chargeButton.MouseButton1Up:Connect(function()
        isCharging = false
        lastChargeTime = tick() - chargeStartTime
        ReplicatedStorage.Events.StopCharging:FireServer()
        
        -- Update charge time display
        chargeDisplay.Text = string.format("Charge Time: %.2f seconds", lastChargeTime)
    end)
    
    -- Handle flash trigger
    flashButton.MouseButton1Click:Connect(function()
        ReplicatedStorage.Events.TriggerFlash:FireServer()
    end)
end

-- Update capacitor visual representation
function updateCapacitorVisuals()
    local capacitorModel = workspace.FlashChallenge.CapacitorModel
    local scale = math.log10(currentCapacitance/100) + 1
    
    -- Scale plates based on capacitance
    capacitorModel.Plate1.Size = Vector3.new(2 * scale, 0.2, 2 * scale)
    capacitorModel.Plate2.Size = Vector3.new(2 * scale, 0.2, 2 * scale)
    
    -- Update plate positions
    capacitorModel.Plate1.Position = Vector3.new(0, scale/2, 0)
    capacitorModel.Plate2.Position = Vector3.new(0, -scale/2, 0)
end

-- Calculate flash intensity based on charge time and capacitance
function FlashChallengeController.getFlashIntensity()
    return math.min(1, (lastChargeTime * currentCapacitance) / 5000)
end

-- Start the controller
FlashChallengeController.init()

return FlashChallengeController
