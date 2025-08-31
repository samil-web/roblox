local CapacitorSimulation = {}

-- Constants
local CHARGE_RATE = 0.1
local MAX_CHARGE = 100
local DISCHARGE_RATE = 0.15

-- Capacitor state
local capacitorState = {
    charge = 0,
    capacity = MAX_CHARGE,
    isCharging = false
}

-- Initialize the simulation
function CapacitorSimulation.init(model)
    local plates = model:WaitForChild("Plates")
    local indicator = model:WaitForChild("ChargeIndicator")
    
    -- Set up visual feedback
    local function updateVisuals()
        local chargePercent = capacitorState.charge / capacitorState.capacity
        indicator.Size = Vector3.new(1, chargePercent * 5, 1)
        indicator.Color = Color3.fromRGB(255 * chargePercent, 255 * (1-chargePercent), 0)
    end
    
    -- Update loop
    game:GetService("RunService").Heartbeat:Connect(function(dt)
        if capacitorState.isCharging then
            capacitorState.charge = math.min(capacitorState.charge + CHARGE_RATE, capacitorState.capacity)
        else
            capacitorState.charge = math.max(capacitorState.charge - DISCHARGE_RATE, 0)
        end
        updateVisuals()
    end)
end

-- Start charging the capacitor
function CapacitorSimulation.startCharging()
    capacitorState.isCharging = true
end

-- Stop charging and allow discharge
function CapacitorSimulation.stopCharging()
    capacitorState.isCharging = false
end

-- Get current charge level (0-100)
function CapacitorSimulation.getChargeLevel()
    return (capacitorState.charge / capacitorState.capacity) * 100
end

-- Set capacitor capacity (for different challenges)
function CapacitorSimulation.setCapacity(newCapacity)
    capacitorState.capacity = newCapacity
    capacitorState.charge = math.min(capacitorState.charge, newCapacity)
end

return CapacitorSimulation
