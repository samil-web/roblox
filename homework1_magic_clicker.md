# Homework: Roblox Magic Clicker 🎮

*What we learned today and cool things to try at home!*

## What We Made Today ✨

We created a Roblox part that grows bigger when you click it!

Here's the magic code that makes it work:

```lua
local part = script.Parent
local clickDetector = Instance.new("ClickDetector", part)

local function growPart()
    part.Size = part.Size + Vector3.new(1, 1, 1)
end

clickDetector.MouseClick:Connect(growPart)
```

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

Try these cool projects in Roblox Studio:

### Challenge 1: Color-Changing Block

Make a part that changes color when clicked.

**Hint:** Use this inside your function:

```lua
part.BrickColor = BrickColor.new("Really blue") 
-- Try different colors like "Bright red", "Lime green", "New Yeller"
```

### Challenge 2: Shrinking Block

Make a part that gets smaller when clicked.

**Hint:** Just change the + to - in the size line:

```lua
part.Size = part.Size - Vector3.new(0.5, 0.5, 0.5)
```

### Challenge 3: Teleporting Part

Make a part that moves to a random nearby position when clicked.

**Hint:** Use this inside your function:

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
