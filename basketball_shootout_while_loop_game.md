# 🏀 Basketball Shootout Game with While Loop (Roblox)

## Game Overview
In this game, you have 30 seconds to score as many baskets as you can! Each time you throw a ball into the hoop, you get a point. The game uses a **while loop** to keep track of the timer and the score.

---

## Step 1: Set Up the Game in Roblox Studio

1. **Open Roblox Studio** and create a new Baseplate project.
2. **Add a Hoop:**
   - Go to the Toolbox, search for "basketball hoop" or build your own using Parts.
   - Place the hoop at one end of the baseplate.
3. **Add Balls:**
   - In the Toolbox, search for "basketball" or use a Sphere Part.
   - Place a few balls near the player spawn area.
   - Make sure the balls are anchored (uncheck "Anchored" in Properties) so they can be picked up.
4. **Add a Court:**
   - Use Parts to make a simple court or play area.
5. **Add a Spawn Location:**
   - Insert a SpawnLocation near the balls.
6. **(Optional) Add Decorations:**
   - Add lines, benches, or a scoreboard for fun!

---

## Step 2: Add a Leaderboard for the Score

1. In the Explorer, right-click on `StarterGui` and insert a **ScreenGui**.
2. Inside the ScreenGui, insert a **TextLabel** for the timer and another for the score (name them `TimerLabel` and `ScoreLabel`).
3. Style the labels so they are easy to see.

---

## Step 3: Script the Timer and Score (Using a While Loop)

1. In the Explorer, right-click on **StarterPlayer > StarterPlayerScripts** and insert a **LocalScript**.
2. Copy and paste this code into the LocalScript:

```lua
-- Basketball Shootout Game Script
local timeLeft = 30
local score = 0

local player = game.Players.LocalPlayer
local gui = player.PlayerGui.ScreenGui
local timerLabel = gui.TimerLabel
local scoreLabel = gui.ScoreLabel

timerLabel.Text = "Time Left: " .. timeLeft
scoreLabel.Text = "Score: " .. score

-- Function to update the score when a basket is made
function onBasketScored()
    score = score + 1
    scoreLabel.Text = "Score: " .. score
end

-- Connect this function to your hoop's Touched event! (see below)

-- Main game loop (using while loop)
while timeLeft > 0 do
    wait(1) -- Wait for 1 second
    timeLeft = timeLeft - 1
    timerLabel.Text = "Time Left: " .. timeLeft
end

-- Game over
scoreLabel.Text = "Final Score: " .. score

-- Show a message
local msg = Instance.new("Message", gui)
msg.Text = "Time's up! You scored " .. score .. " points!"
wait(3)
msg:Destroy()
```

---

## Step 4: Make the Hoop Count Scores

1. Select your hoop (the rim part where the ball goes in).
2. In the Explorer, right-click the hoop and insert a **Script**.
3. Use this script to detect when a ball touches the hoop:

```lua
-- Place this in the hoop part
local hoop = script.Parent

hoop.Touched:Connect(function(hit)
    if hit.Name == "Basketball" then
        -- Fire a RemoteEvent to tell the LocalScript to add a point
        local event = game.ReplicatedStorage:FindFirstChild("BasketScored")
        if event then
            event:FireClient(game.Players:GetPlayers()[1])
        end
    end
end)
```

4. In **ReplicatedStorage**, insert a **RemoteEvent** and name it `BasketScored`.
5. In your LocalScript (from Step 3), add this at the top:

```lua
local basketEvent = game.ReplicatedStorage.BasketScored
basketEvent.OnClientEvent:Connect(onBasketScored)
```

---

## Step 5: Test and Play!

- Click Play and try to score as many baskets as you can in 30 seconds!
- Try moving the hoop, making it bigger or smaller, or adding more balls.

---

## Extra Challenges
- Add sound effects or confetti when you score.
- Show a "Play Again" button when the game ends.
- Make the hoop move for extra challenge!

---

**Have fun coding and playing your Basketball Shootout game!**
