Lesson plan for while loop:


What is the while loop:


Let's say you want to iterate in a manner that your iteration will not be interrupted by the defined range

But by the condition.

We learned that for loop is necessary when we have a defined range, period and we know from the beginning this is the amount of times we want to do the project

But what if we didn't know this number but instead we were aware about the condition which would need to stop us

For example if it is raining we will use umbrella 

*But it is not clear until when we will use this umbrella*

So, in this case umbrella will be used until the rain stops


# Lesson 6: Exploring While Loops in Roblox Lua

## 🎯 Objective
By the end of this lesson, you'll understand how a **while** loop repeats actions **until** something changes, and you'll write your own while loops in Roblox Studio.

---
## 1. Warm-up: Loops in Real Life
- Ask the class: “What do you keep doing **while** something is true?”
  - Eating cereal **while** your bowl isn’t empty.
  - Holding an umbrella **while** it rains.

> We know **for** loops when we have a count. While loops are for when we don’t know the count, but we know when to stop.

---
## 2. Real-Life Example: Umbrella and Rain
Imagine it’s raining:
```lua
while isRaining do
    holdUmbrella()
end
```
- You don’t know how many raindrops will fall.
- You stop **only** when `isRaining` becomes `false`.

---
## 3. Lua Syntax: Step by Step
1. **Initialize** a variable if needed (e.g., `local count = 1`).
2. Write the **condition**: `while <condition> do`.
3. Add **body** code that runs each time.
4. **Update** something inside so the loop can end.
5. Close with `end`.

```lua
local count = 1          -- 1. start
while count <= 5 do       -- 2. check
    print("Count is: "..count)  -- 3. action
    count = count + 1    -- 4. update
end                       -- 5. done
```  

---
## 4. Guided Demo
1. Open **Roblox Studio**.
2. Insert a **Script**.
3. Copy the code above.
4. Run and watch the **Output** window.

**Explain** each line as you type it.

---
## 5. Challenges 🎲

### Challenge 1: Jump Race Game 🏃‍♂️
Build a mini game where players jump through **3 floating rings**. Use a while loop to spawn rings and count when the player touches them.
```lua
local ringsPassed = 0
while ringsPassed < 3 do
    spawnRing()                -- clone and place a ring
    ringsPassed = ringsPassed + 1
end
print('You finished the race!')
```
**Instructions:**
1. Put a `Ring` part in `ReplicatedStorage`.
2. Write a `spawnRing()` function to clone `Ring`, position it randomly, and parent to `workspace`.
3. Detect when the player touches the ring and increment `ringsPassed`.

### Challenge 2: Potion Brewing Station 🧪
Create a station that brews **5 potions**. Use a while loop to simulate brewing steps and show a message each time.
```lua
local potions = 0
while potions < 5 do
    brewPotion()               -- clone and brew a potion
    potions = potions + 1
end
print('All potions are ready!')
```
**Instructions:**
1. Place a `Potion` part in `StarterPack`.
2. Write `brewPotion()` to clone `Potion`, place it in `workspace`, and add effects.
3. Run the script and watch potions appear.

### Challenge 3: Tower Builder 🏗️
Use a while loop to **stack 8 bricks** and build a tower.
```lua
local bricksPlaced = 0
local basePos = Vector3.new(0, 1, 0)
while bricksPlaced < 8 do
    local brick = script.Brick:Clone()
    brick.Position = basePos + Vector3.new(0, bricksPlaced * 2, 0)
    brick.Parent = workspace
    bricksPlaced = bricksPlaced + 1
end
```
**Instructions:**
1. Add a `Brick` under the script in Explorer.
2. Run and see the tower build itself.
3. Try changing the loop count or spacing.

### Challenge 4: Spot the Bug 🔍
What’s wrong here, and how do you fix it?
```lua
local x = 1
while x <= 3 do
    print(x)
    -- forgot x = x + 1 causes an infinite loop
end
```
*Discuss:* Why doesn’t this end? Where and how should you update `x` inside the loop?

---
## 6. Quiz Time 📝
What will this print, and why?  
```lua
local n = 4
while n > 0 do
    print(n)
    n = n - 2
end
```  
Write your answer before running the code!

---
## 7. Wrap-Up
- **Review**: A while loop runs **while** a condition stays true.
- **Think** of **two** real-life “while” examples and share with a partner.
- **Try** more loops in your own Roblox game!

---
## Next Lesson: Nested Loops  
Soon we’ll learn how to put loops inside loops to build cool patterns and shapes!
