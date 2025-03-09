# Homework: Roblox Magic Clicker 🎮

*What we learned today and cool things to try at home!*

## What We Made Today ✨

We created a Roblox part that grows bigger when you click it!

*Here's the magic code that makes it work:

```lua
local part = script.Parent
local clickDetector = Instance.new("ClickDetector", part)

local function growPart()
    part.Size = part.Size + Vector3.new(1, 1, 1)
end

clickDetector.MouseClick:Connect(growPart)
```

## Understanding Events in Roblox 🔔

**Events** are one of the most important things in Roblox scripting! Think of them like special signals that happen when something occurs in your game:

- When a player clicks something ➡️ MouseClick event happens
- When a player touches something ➡️ Touched event happens
- When a player presses a key ➡️ KeyPressed event happens

The really cool thing about events is that they let your code **wait and listen** for something to happen. This is different from code that just runs from top to bottom once.

In our growing part example:

1. The game sets up a **ClickDetector** that listens for clicks
2. The **MouseClick event** waits patiently until someone clicks
3. When clicked, the event **connects** to our function
4. Our code jumps directly to the function, without restarting

It's like setting up a doorbell - the code waits until someone presses it, then runs only the specific code for what should happen.

## Roblox Code Dictionary 📚

* **script.Parent** - The object that contains our script (like a backpack holding something)
* **ClickDetector** - A special power that lets parts detect when they're clicked
* **function** - A set of instructions with a name (like a recipe)
* **Vector3** - Three numbers that tell Roblox about width, height, and depth (like XYZ coordinates)
* **Connect** - Linking an event to a function (like connecting a doorbell to a light)

## How It Works (Simple Version) 🧠

1. Game starts → Creates ClickDetector
2. Player clicks part → ClickDetector activates
3. Activation → Runs growPart function
4. Function runs → Part gets bigger

**Important:** The code doesn't restart when you click! It JUMPS to the function.

## Your Challenges 🏆

For each challenge below, start with our original code and **ONLY change what's INSIDE the function**. Keep all the other code exactly the same!

```lua
local part = script.Parent
local clickDetector = Instance.new("ClickDetector", part)

local function growPart()
    -- THIS IS THE ONLY PART YOU NEED TO CHANGE
    part.Size = part.Size + Vector3.new(1, 1, 1)
end

clickDetector.MouseClick:Connect(growPart)
```

### Challenge 1: Color-Changing Block

Make a part that changes color when clicked.

**Hint:** Only change the code inside the function - replace the size line with:

```lua
part.BrickColor = BrickColor.new("Really blue") 
-- Try different colors like "Bright red", "Lime green", "New Yeller"
```

### Challenge 2: Shrinking Block

Make a part that gets smaller when clicked.

**Hint:** Only change the code inside the function - just change the + to - in the size line:

```lua
part.Size = part.Size - Vector3.new(0.5, 0.5, 0.5)
```

### Challenge 3: Teleporting Part

Make a part that moves to a random nearby position when clicked.

**Hint:** Only change the code inside the function - replace the size line with:

```lua
part.Position = part.Position + Vector3.new(
    math.random(-10, 10),
    math.random(0, 5),
    math.random(-10, 10)
)
```

## SUPER Challenge: Magic Block Collection 🌟

Create THREE different parts that each do something unique when clicked:

- One that changes color
- One that changes size
- One that plays a sound or moves

For each part, use the same basic code structure (with the ClickDetector), but change what happens inside the function to make each part do something different!

## Need Help? 🤔

If you get stuck, check:

1. Is your script inside the part?
2. Did you spell everything correctly? (Lua is picky about spelling)
3. Try printing a message to see if your function is working:

```lua
local function myFunction()
    print("My function is running!")
    -- Rest of your code
end
```

Have fun and see you next week for more Roblox coding adventures!
