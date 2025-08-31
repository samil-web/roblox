local CameraFlashChallenge = {}

-- Dependencies
local CapacitorSimulation = require(script.Parent.CapacitorSimulation)

-- Challenge configuration
local REQUIRED_CHARGE = 80 -- Minimum charge percentage needed for flash
local FLASH_DURATION = 0.5 -- How long the flash stays on

-- Challenge state
local challengeState = {
    isComplete = false,
    attempts = 0,
    bestTime = math.huge
}

function CameraFlashChallenge.init(flashModel)
    local flashLight = flashModel:WaitForChild("FlashLight")
    local chargeButton = flashModel:WaitForChild("ChargeButton")
    local flashButton = flashModel:WaitForChild("FlashButton")
    
    -- Initialize capacitor simulation
    CapacitorSimulation.init(flashModel)
    
    -- Handle charging button
    chargeButton.Activated:Connect(function()
        CapacitorSimulation.startCharging()
    end)
    
    chargeButton.Deactivated:Connect(function()
        CapacitorSimulation.stopCharging()
    end)
    
    -- Handle flash button
    flashButton.Activated:Connect(function()
        local chargeLevel = CapacitorSimulation.getChargeLevel()
        
        if chargeLevel >= REQUIRED_CHARGE then
            -- Trigger flash
            flashLight.Enabled = true
            challengeState.attempts = challengeState.attempts + 1
            
            -- Record completion time
            if not challengeState.isComplete then
                challengeState.isComplete = true
                challengeState.bestTime = os.time()
            end
            
            -- Turn off flash after duration
            wait(FLASH_DURATION)
            flashLight.Enabled = false
            CapacitorSimulation.setCapacity(0) -- Discharge completely
        else
            -- Show feedback that more charge is needed
            local feedback = Instance.new("Message")
            feedback.Text = "Not enough charge! Need at least " .. REQUIRED_CHARGE .. "%"
            wait(2)
            feedback:Destroy()
        end
    end)
end

-- Get challenge status
function CameraFlashChallenge.getStatus()
    return {
        completed = challengeState.isComplete,
        attempts = challengeState.attempts,
        bestTime = challengeState.bestTime
    }
end

return CameraFlashChallenge
