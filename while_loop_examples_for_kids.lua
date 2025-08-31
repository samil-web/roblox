
--[[
  WHILE LOOPS FOR KIDS
  
  A while loop is like saying:
  "Keep doing something as long as a condition is true"
  
  Structure:
  while [condition] do
      [actions to repeat]
  end
]]--

print("Let's learn about while loops with fun examples!")
print("================================================")

-- Example 1: Counting to 10
print("\nExample 1: Counting to 10")
print("This is like counting before a hide and seek game!")

local count = 1
while count <= 10 do
    print("Counting: " .. count)
    count = count + 1  -- Add 1 to count each time
end
print("Ready or not, here I come!")

-- Example 2: Eating cookies from a jar
print("\nExample 2: Eating cookies from a cookie jar")
print("Imagine you have a jar of cookies and you keep eating until it's empty")

local cookiesInJar = 5
while cookiesInJar > 0 do
    print("Yum! You ate a cookie. There are " .. (cookiesInJar - 1) .. " cookies left.")
    cookiesInJar = cookiesInJar - 1
end
print("The cookie jar is empty now!")

-- Example 3: Waiting for a bus
print("\nExample 3: Waiting for the school bus")
print("You wait at the bus stop until your bus arrives")

local busArrived = false
local minutesWaited = 0

while busArrived == false do
    minutesWaited = minutesWaited + 1
    print("Waiting at the bus stop... " .. minutesWaited .. " minutes passed")
    
    -- After 5 minutes, the bus arrives
    if minutesWaited >= 5 then
        busArrived = true
        print("The bus has arrived! Time to go to school!")
    end
end

-- Example 4: Filling a water balloon
print("\nExample 4: Filling a water balloon")
print("You keep adding water until the balloon is full")

local balloonSize = 0
local fullSize = 10

while balloonSize < fullSize do
    balloonSize = balloonSize + 2
    print("Adding more water... Balloon is now " .. balloonSize .. "/10 full")
    
    if balloonSize >= fullSize then
        print("The water balloon is full and ready for a water fight!")
    end
end

-- Example 5: Playing a guessing game
print("\nExample 5: Guessing the secret number")
print("This is like a guessing game where the computer knows the answer")

local secretNumber = 7
local guess = 3
local attempts = 1

print("The computer is thinking of a number between 1 and 10")
print("Let's pretend we're guessing...")

while guess ~= secretNumber do
    print("Attempt " .. attempts .. ": You guessed " .. guess)
    
    if guess < secretNumber then
        print("Too low! Try a higher number.")
        guess = guess + 1
    else
        print("Too high! Try a lower number.")
        guess = guess - 1
    end
    
    attempts = attempts + 1
end

print("You got it! The secret number was " .. secretNumber)
print("It took you " .. attempts .. " attempts to guess correctly!")

-- Example 6: Brushing teeth
print("\nExample 6: Brushing your teeth")
print("You need to brush each section of your teeth")

local teethSections = 4
local sectionsCleaned = 0

while sectionsCleaned < teethSections do
    sectionsCleaned = sectionsCleaned + 1
    
    if sectionsCleaned == 1 then
        print("Brushing the top right teeth... " .. sectionsCleaned .. "/4 sections done")
    elseif sectionsCleaned == 2 then
        print("Brushing the top left teeth... " .. sectionsCleaned .. "/4 sections done")
    elseif sectionsCleaned == 3 then
        print("Brushing the bottom right teeth... " .. sectionsCleaned .. "/4 sections done")
    else
        print("Brushing the bottom left teeth... " .. sectionsCleaned .. "/4 sections done")
    end
end

print("All done! Your teeth are clean and shiny!")

-- Example 7: Growing a plant
print("\nExample 7: Growing a plant")
print("You water your plant every day until it grows tall")

local plantHeight = 0
local daysOfCare = 0
local fullGrown = 5

while plantHeight < fullGrown do
    daysOfCare = daysOfCare + 1
    print("Day " .. daysOfCare .. ": You water your plant")
    
    plantHeight = plantHeight + 1
    print("Your plant is now " .. plantHeight .. " inches tall!")
    
    if plantHeight >= fullGrown then
        print("Congratulations! Your plant is fully grown!")
    end
end

-- Example 8: Homework problems
print("\nExample 8: Doing homework")
print("You have math problems to solve before you can play")

local mathProblems = 5
local problemsSolved = 0

while problemsSolved < mathProblems do
    problemsSolved = problemsSolved + 1
    print("Solving math problem #" .. problemsSolved)
end

print("All homework is done! Now you can play!")

print("\nThese examples show how while loops work in real life!")
print("A while loop keeps repeating as long as something is true.")
print("Once that something becomes false, the loop stops.")
