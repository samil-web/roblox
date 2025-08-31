# Week 4: Fun with Loops in Roblox! 🎮

## For Ages 10-11 What We'll Learn Today

- How to make things repeat in our game
- How to create cool patterns
- How to make things happen over and over

### Challenge 1: Rainbow Blocks! 🌈

Make colorful blocks appear in a line. Change the numbers to see what happens!

```lua
-- Rainbow Blocks Maker
-- Change these numbers to make it YOUR way!
local howManyBlocks = 5  -- Try different numbers!
local spaceBetweenBlocks = 5  -- Make them closer or farther apart!

-- Fun colors to choose from
local colors = {
    "Really red",
    "Really blue",
    "Really yellow",
    "Really green"
}

-- This is our loop! It makes blocks for us
for i = 1, howManyBlocks do
    -- Make a new block
    local block = Instance.new("Part")
  
    -- Make it colorful!
    -- Try changing the math to get different patterns:
    local whichColor = (i % #colors) + 1
    block.BrickColor = BrickColor.new(colors[whichColor])
  
    -- Set the block's position
    block.Position = Vector3.new(i * spaceBetweenBlocks, 0, 0)
    block.Size = Vector3.new(2, 2, 2)
    block.Anchored = true
  
    block.Parent = workspace
end
```

### Challenge 2: Jumping Blocks! 🦘

Make blocks that jump up and down. Try changing the numbers!

```lua
-- Jumping Block Maker
local numberOfBlocks = 3  -- How many blocks do you want?

-- Make our blocks
for i = 1, numberOfBlocks do
    local block = Instance.new("Part")
    block.Size = Vector3.new(2, 2, 2)
    block.Position = Vector3.new(i * 5, 5, 0)
    block.Anchored = true
    block.BrickColor = BrickColor.new("Really blue")
    block.Parent = workspace
  
    -- Make it jump!
    spawn(function()
        while true do
            -- Try changing these numbers:
            local jumpHeight = 3  -- How high should it jump?
            local jumpSpeed = 0.1  -- How fast should it jump?
          
            -- Jump up
            for height = 0, jumpHeight, 0.1 do
                block.Position = Vector3.new(i * 5, 5 + height, 0)
                wait(jumpSpeed)
            end
          
            -- Fall down
            for height = jumpHeight, 0, -0.1 do
                block.Position = Vector3.new(i * 5, 5 + height, 0)
                wait(jumpSpeed)
            end
        end
    end)
end
```

### Challenge 3: Simple Timer! ⏰

Make a countdown timer. Change how long it counts!

```lua
-- Simple Timer
local timeLeft = 10  -- How many seconds? Try different numbers!

while timeLeft > 0 do
    -- Show the time
    print("Time left:", timeLeft)
  
    wait(1)  -- Wait for 1 second
    timeLeft = timeLeft - 1  -- Count down
end

print("Time's up! 🎉")
```

### Fun Things to Try! 🎯

1. **Rainbow Blocks**:

   - Make more or fewer blocks
   - Change the space between blocks
   - Try different colors
2. **Jumping Blocks**:

   - Make them jump higher or lower
   - Make them jump faster or slower
   - Change how many blocks there are
3. **Timer**:

   - Make it count for longer
   - Make it count faster or slower
   - Add a message at the end

### Remember! 🌟

- If something breaks, that's okay! Just try again
- There are no wrong answers
- Have fun experimenting with the numbers
- Share what you make with your friends!
