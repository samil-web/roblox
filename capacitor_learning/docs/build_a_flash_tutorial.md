# Build-a-Flash Challenge Tutorial

## Setup in Roblox Studio

### 1. Create the Workspace Structure
```
WorkspaceName: CapacitorLab
└── FlashChallenge (Model)
    ├── CircuitBoard (Part)
    ├── CapacitorModel (Model)
    │   ├── Plate1 (Part)
    │   ├── Plate2 (Part)
    │   └── Dielectric (Part)
    ├── FlashLight (PointLight)
    ├── UI
    │   ├── ChargeButton
    │   ├── FlashButton
    │   └── CapacitorSizeSlider
    └── StatusDisplay
```

### 2. Create Basic Components

1. **Circuit Board**
   - Create a baseplate (Part)
   - Size: 20x1x20 studs
   - Color: Light gray
   - Anchored: True

2. **Capacitor Model**
   - Create two plates:
     - Size: 2x0.2x2 studs each
     - Color: Metallic
     - Position them 1 stud apart
   - Create dielectric (insulator):
     - Size: 1.8x0.8x1.8 studs
     - Transparency: 0.5
     - Color: Light blue

3. **Flash Light**
   - Add a PointLight
   - Brightness: 0
   - Range: 16
   - Color: Bright white

### 3. Create the UI

1. **In StarterGui**
   - Create a ScreenGui
   - Add Frame for control panel
   - Position: Bottom right

2. **Add UI Components**
   ```lua
   -- Create buttons
   local chargeButton = Instance.new("TextButton")
   chargeButton.Text = "Charge Capacitor"
   chargeButton.Position = UDim2.new(0.8, 0, 0.8, 0)
   
   local flashButton = Instance.new("TextButton")
   flashButton.Text = "Trigger Flash"
   flashButton.Position = UDim2.new(0.8, 0, 0.9, 0)
   
   -- Create slider
   local capacitorSlider = Instance.new("SliderGui")
   capacitorSlider.Min = 100
   capacitorSlider.Max = 1000
   capacitorSlider.Value = 500
   ```

### 4. Script Implementation

1. **Create LocalScript in StarterPlayerScripts**
   - Name: FlashChallengeController.lua
   - This will handle player interactions

2. **Create Script in ServerScriptService**
   - Name: FlashChallengeServer.lua
   - This will manage game state and verification

### 5. Add the Following New Script:
