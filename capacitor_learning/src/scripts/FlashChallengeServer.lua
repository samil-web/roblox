-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Create events folder in ReplicatedStorage
local Events = Instance.new("Folder")
Events.Name = "Events"
Events.Parent = ReplicatedStorage

-- Create remote events
local StartCharging = Instance.new("RemoteEvent")
StartCharging.Name = "StartCharging"
StartCharging.Parent = Events

local StopCharging = Instance.new("RemoteEvent")
StopCharging.Name = "StopCharging"
StopCharging.Parent = Events

local TriggerFlash = Instance.new("RemoteEvent")
TriggerFlash.Name = "TriggerFlash"
TriggerFlash.Parent = Events

-- Challenge state
local playerStates = {}

-- Initialize player state
local function initPlayerState(player)
    playerStates[player.UserId] = {
        isCharging = false,
        chargeLevel = 0,
        lastFlashTime = 0
    }
end

-- Handle player joining
game.Players.PlayerAdded:Connect(initPlayerState)

-- Handle player leaving
game.Players.PlayerRemoving:Connect(function(player)
    playerStates[player.UserId] = nil
end)

-- Handle charging start
StartCharging.OnServerEvent:Connect(function(player)
    local state = playerStates[player.UserId]
    if state then
        state.isCharging = true
    end
end)

-- Handle charging stop
StopCharging.OnServerEvent:Connect(function(player)
    local state = playerStates[player.UserId]
    if state then
        state.isCharging = false
    end
end)

-- Handle flash trigger
TriggerFlash.OnServerEvent:Connect(function(player)
    local state = playerStates[player.UserId]
    if not state then return end
    
    -- Get flash model
    local flashChallenge = workspace:FindFirstChild("FlashChallenge")
    if not flashChallenge then return end
    
    local flashLight = flashChallenge:FindFirstChild("FlashLight")
    if not flashLight then return end
    
    -- Check cooldown (prevent spam)
    local currentTime = tick()
    if currentTime - state.lastFlashTime < 1 then return end
    
    -- Trigger flash effect
    flashLight.Brightness = 5
    wait(0.1)
    flashLight.Brightness = 0
    
    state.lastFlashTime = currentTime
end)

-- Update loop
game:GetService("RunService").Heartbeat:Connect(function(dt)
    for _, player in pairs(game.Players:GetPlayers()) do
        local state = playerStates[player.UserId]
        if state and state.isCharging then
            -- Simulate capacitor charging
            state.chargeLevel = math.min(1, state.chargeLevel + dt * 0.5)
        else
            -- Simulate capacitor discharging
            state.chargeLevel = math.max(0, state.chargeLevel - dt * 0.1)
        end
    end
end)
