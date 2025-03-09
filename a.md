# Roblox Code Execution Flow Visualization

## Overview

This document visualizes the execution flow of the following Roblox script:

```lua
local part = script.Parent  
-- parent contains the script 

local clickDetector = Instance.new("ClickDetector", part)

local function growPart()
	part.Size = part.Size + Vector3.new(1, 1, 1)  -- Increase size
end

clickDetector.MouseClick:Connect(growPart)
```

## Script Initialization Flow

```mermaid
flowchart TD
    A[Script Starts Execution] --> B[Get Parent Object of Script]
    B --> C[Create ClickDetector Instance]
    C --> D[Attach ClickDetector to Parent Object]
    D --> E[Define growPart Function]
    E --> F[Connect growPart to ClickDetector's MouseClick Event]
    F --> G[Script Initialization Complete]
```

## Runtime Event Flow

```mermaid
sequenceDiagram
    participant User
    participant Part as Object/Part
    participant ClickDetector
    participant EventSystem as Roblox Event System
    participant GrowPart as growPart Function
    
    User->>Part: Clicks on Part
    Part->>ClickDetector: Detects mouse click
    ClickDetector->>EventSystem: Fires MouseClick event
    EventSystem->>GrowPart: Calls connected function
    GrowPart->>Part: Increases Size property by Vector3(1,1,1)
    Part->>User: Visual feedback (part grows larger)
```

## Detailed Component Breakdown

```mermaid
classDiagram
    class Script {
        +Parent: Instance
    }
    
    class Part {
        +Size: Vector3
        +Changed(propertyName)
    }
    
    class ClickDetector {
        +MouseClick: Event
        +MaxActivationDistance: number
    }
    
    class GrowPartFunction {
        +call()
    }
    
    Script --> Part : References
    Part *-- ClickDetector : Contains
    ClickDetector --> GrowPartFunction : Connects via MouseClick
    GrowPartFunction --> Part : Modifies Size
```

## Memory and Property States

The following diagram shows how the part's Size property changes when clicked:

```mermaid
stateDiagram-v2
    [*] --> InitialSize
    InitialSize --> Clicked
    Clicked --> SizeIncreased: growPart() executes
    SizeIncreased --> Clicked: User clicks again
    
    state SizeIncreased {
        Size_X_Increased: X += 1
        Size_Y_Increased: Y += 1
        Size_Z_Increased: Z += 1
    }
```

## Technical Implementation Details

1. **ClickDetector Creation**: The `Instance.new("ClickDetector", part)` call creates a new ClickDetector object and immediately parents it to the part.

2. **Event Connection**: The `Connect` method creates a persistent connection between the MouseClick event and the growPart function.

3. **Vector3 Addition**: When the part grows, the code uses Vector3 addition to increase all three dimensions simultaneously.

## Common Debugging Tips

- If clicking doesn't work, check that:
  - The script is properly parented to the intended part
  - The part is anchored or properly constrained
  - The ClickDetector's MaxActivationDistance is appropriate

- If the part grows unexpectedly:
  - Check for multiple scripts that might be modifying the same part
  - Verify the Vector3 values in the growPart function