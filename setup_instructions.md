# Detective Mystery Story-Based Learning - Setup Instructions

## 🚀 Getting Started with Roblox Studio

### **Step 1: Roblox Studio Setup**
1. **Open Roblox Studio**
2. **Create a new place** or open an existing one
3. **Save your place** with a descriptive name like "Detective Academy - Day 1"

### **Step 2: Script Placement**
1. **Open the Explorer panel** (View → Explorer if not visible)
2. **Find ServerScriptService** in the Explorer
3. **Right-click on ServerScriptService**
4. **Select "Insert Object" → "Script"**
5. **Rename the script** to "Day1_Variables_Lesson"

### **Step 3: Copy the Code**
1. **Open the script** you just created (double-click it)
2. **Delete the default print("Hello World!")** line
3. **Copy ALL the code** from `day1_variables_lesson.lua`
4. **Paste it** into your new script in Roblox Studio

### **Step 4: Activate the Lesson**
1. **Scroll to the bottom** of the script (around line 580)
2. **Find this line:**
   ```lua
   -- Uncomment to run Day 1 lesson:
   -- runDay1Lesson()
   ```
3. **Remove the `--` to uncomment it:**
   ```lua
   -- Uncomment to run Day 1 lesson:
   runDay1Lesson()
   ```

### **Step 5: Test the Experience**
1. **Click the "Play" button** (▶️) in Roblox Studio
2. **Wait for the environment to build** (about 3-5 seconds)
3. **Explore the Detective Academy** that appears
4. **Read the clue signs** around the area
5. **Watch the lesson unfold** in the output window

---

## 📁 **File Organization Structure**

### **Recommended Folder Structure:**
```
ServerScriptService/
├── DetectiveMystery/
│   ├── Day1_Variables_Lesson      (Main Day 1 script)
│   ├── Day2_Conditionals_Lesson   (Future lesson)
│   ├── Day3_Loops_Lesson          (Future lesson)
│   ├── Day4_Functions_Lesson      (Future lesson)
│   ├── Day5_Integration_Lesson    (Future lesson)
│   └── SingleSession_Mystery      (Complete single session)
└── Utilities/
    ├── StoryHelpers               (Shared story functions)
    └── BuildingHelpers            (Shared building functions)
```

### **How to Create This Structure:**
1. **Right-click ServerScriptService**
2. **Insert Object → Folder**
3. **Name it "DetectiveMystery"**
4. **Right-click the DetectiveMystery folder**
5. **Insert Object → Script** for each lesson

---

## 🎯 **Quick Start Options**

### **Option A: Single Day Lesson**
**Use this for:** Testing or single class period
1. **Copy:** `day1_variables_lesson.lua` → New Script in ServerScriptService
2. **Uncomment:** `runDay1Lesson()` at the bottom
3. **Play** and explore!

### **Option B: Complete Single Session**
**Use this for:** 1-2 hour complete mystery experience
1. **Copy:** `single_session_detective_mystery.lua` → New Script
2. **Uncomment:** `runDetectiveMystery()` at the bottom
3. **Play** for full adventure!

### **Option C: Week-Long Curriculum**
**Use this for:** Full 5-day programming course
1. **Create folder structure** as shown above
2. **Add Day 1 script** first to test
3. **Add additional days** as you progress through the week

---

## 🔧 **Troubleshooting**

### **Common Issues:**

**❌ "Script doesn't run"**
- ✅ Make sure script is in **ServerScriptService** (not Workspace)
- ✅ Check that you **uncommented** the main function call
- ✅ Look for **red error messages** in the Output window

**❌ "Nothing appears in the game"**
- ✅ Wait 3-5 seconds for building to complete
- ✅ Check the **Output window** for progress messages
- ✅ Make sure you're in **Play mode** (not Edit mode)

**❌ "Can't see the signs clearly"**
- ✅ Move your camera closer to the signs
- ✅ The signs are positioned around the academy building
- ✅ Look for colorful rectangular signs with text

**❌ "Students can't find the academy"**
- ✅ Students spawn on a **blue platform**
- ✅ The academy building is **directly in front** of spawn
- ✅ Signs are positioned around the main building

### **Getting Help:**
1. **Check the Output window** for error messages
2. **Look for print statements** showing progress
3. **Verify script placement** in ServerScriptService
4. **Test in Play mode** before bringing in students

---

## 👥 **Classroom Management Tips**

### **Before Class:**
1. **Test the experience** yourself first
2. **Have backup plans** ready
3. **Prepare discussion questions** about variables
4. **Set up student Roblox accounts** if needed

### **During Class:**
1. **Let students explore** the signs for 2-3 minutes
2. **Ask what they think** they'll learn today
3. **Guide discussion** toward variables and organization
4. **Watch the lesson together** as it unfolds

### **After Class:**
1. **Discuss what variables are** and why they're useful
2. **Ask students to explain** the detective connection
3. **Preview tomorrow's lesson** (conditionals/lie detector)
4. **Save student work** if they modified anything

---

## 🎓 **Assessment Ideas**

### **Quick Checks:**
- Can students explain what a variable is?
- Do they understand the "labeled container" analogy?
- Can they give examples of different variable types?

### **Extension Activities:**
- Have students design their own evidence organization system
- Ask them to create variables for their favorite detective character
- Challenge them to think of real-world examples of "variables"

---

## 📞 **Support Resources**

### **If You Need Help:**
1. **Roblox Developer Hub:** https://developer.roblox.com/
2. **Roblox Studio Tutorials:** Built into Roblox Studio (Help menu)
3. **Community Forums:** Roblox Developer Forum
4. **YouTube Tutorials:** Search "Roblox Studio Basics"

### **Next Steps:**
- Once Day 1 works well, you can add the other daily lessons
- Each day builds on the previous day's concepts
- The complete week tells one continuous detective story
- Students will be excited to see how the mystery unfolds!

---

**🎉 You're ready to start your detective mystery programming adventure!**
