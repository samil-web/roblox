// Initialize highlight.js for code syntax highlighting
document.addEventListener('DOMContentLoaded', function() {
    hljs.highlightAll();
    initializeVisualization();
});

// Visualization States
const STATES = {
    INITIAL: 'initial',
    SETUP_COMPLETE: 'setup_complete',
    CLICK_DETECTED: 'click_detected',
    FUNCTION_ACTIVATED: 'function_activated',
    PART_GROWING: 'part_growing'
};

// Global variables
let currentState = STATES.INITIAL;
let currentStep = 0;
const totalSteps = 5;

// DOM Elements
const codeDisplay = document.getElementById('code-display');
const nextButton = document.getElementById('next-button');
const resetButton = document.getElementById('reset-button');
const gamePart = document.getElementById('game-part');
const characterArm = document.getElementById('character-arm');
const brainConnection = document.getElementById('brain-connection');
const messageBox = document.getElementById('message-box');
const stepIndicator = document.getElementById('step-indicator');
const clickMagic = document.querySelector('.click-magic');
const stepDescription = document.getElementById('step-description');
const gameScene = document.getElementById('game-scene');

// Step information
const steps = [
    {
        title: "Game Start: Setup Code",
        message: "When the game starts, it runs all the setup code (lines 1-4 and 10). This happens only ONCE!",
        description: "The setup code runs first and prepares everything",
        codeHighlight: 'setup',
        state: STATES.INITIAL
    },
    {
        title: "Player Clicks the Part",
        message: "You clicked the part! The ClickDetector notices this and gets excited!",
        description: "The ClickDetector feels your click and gets ready to do something",
        codeHighlight: 'none',
        state: STATES.SETUP_COMPLETE
    },
    {
        title: "ClickDetector Activates",
        message: "The ClickDetector remembers which function it's connected to (the growPart function).",
        description: "The ClickDetector remembers the function it needs to call",
        codeHighlight: 'connect',
        state: STATES.CLICK_DETECTED
    },
    {
        title: "Jump to Function",
        message: "The code jumps directly to the growPart function (lines 6-8). It doesn't run the setup code again!",
        description: "The code jumps straight to the growPart function!",
        codeHighlight: 'function',
        state: STATES.FUNCTION_ACTIVATED
    },
    {
        title: "Part Grows Bigger",
        message: "The part grows bigger! The line 'part.Size = part.Size + Vector3.new(1, 1, 1)' makes this happen!",
        description: "The part's size increases because of the Vector3 line",
        codeHighlight: 'grow',
        state: STATES.PART_GROWING
    }
];

// Initialize the visualization
function initializeVisualization() {
    // Format the code with line numbers
    formatCodeWithLineNumbers();
    
    // Set up event listeners
    nextButton.addEventListener('click', goToNextStep);
    resetButton.addEventListener('click', resetVisualization);
    gamePart.addEventListener('click', handlePartClick);
    
    // Set initial state
    updateState(STATES.INITIAL);
    updateMessageBox("Click the blue part to begin!");
}

// Format code with line numbers
function formatCodeWithLineNumbers() {
    const codeLines = codeDisplay.innerHTML.split('\n');
    let formattedCode = '';
    
    codeLines.forEach((line, index) => {
        formattedCode += `<div class="code-line" data-line="${index + 1}">${line}</div>`;
    });
    
    codeDisplay.innerHTML = formattedCode;
}

// Handle clicking on the part
function handlePartClick() {
    if (currentState === STATES.INITIAL) {
        currentStep = 0;
        goToNextStep();
    } else if (currentState === STATES.SETUP_COMPLETE) {
        gamePart.classList.add('clicked');
        characterArm.classList.add('clicking');
        
        setTimeout(() => {
            goToNextStep();
            characterArm.classList.remove('clicking');
        }, 500);
    }
}

// Go to next step
function goToNextStep() {
    if (currentStep < totalSteps) {
        currentStep++;
        applyStep(currentStep);
    }
}

// Apply specific step
function applyStep(stepNum) {
    // Clear previous highlights
    clearHighlights();
    
    const step = steps[stepNum - 1];
    
    // Update step indicator
    stepIndicator.querySelector('.step-number').textContent = stepNum;
    stepIndicator.querySelector('.step-title').textContent = step.title;
    stepIndicator.classList.remove('hidden');
    
    // Update the state
    updateState(step.state);
    
    // Update message box
    updateMessageBox(step.message);
    
    // Update step description
    stepDescription.textContent = step.description;
    
    // Highlight code based on step
    highlightCode(step.codeHighlight);
    
    // Activate overview steps
    updateOverviewSteps(stepNum);
    
    // Show code explanation if needed
    if (stepNum >= 2) {
        clickMagic.classList.remove('hidden');
    }
    
    // Visual effects for specific steps
    applyStepVisualEffects(stepNum);
}

// Clear code highlights
function clearHighlights() {
    document.querySelectorAll('.code-line').forEach(line => {
        line.classList.remove('highlight-setup', 'highlight-click');
    });
}

// Highlight different parts of the code
function highlightCode(highlightType) {
    const codeLines = document.querySelectorAll('.code-line');
    
    switch (highlightType) {
        case 'setup':
            // Highlight setup code (lines 1-4 and 10)
            highlightLineRange(codeLines, 1, 4, 'highlight-setup');
            highlightLine(codeLines, 10, 'highlight-setup');
            break;
        case 'connect':
            // Highlight connection line
            highlightLine(codeLines, 10, 'highlight-click');
            break;
        case 'function':
            // Highlight function definition
            highlightLineRange(codeLines, 6, 8, 'highlight-click');
            break;
        case 'grow':
            // Highlight the growing line
            highlightLine(codeLines, 7, 'highlight-click');
            break;
    }
}

// Highlight a specific line
function highlightLine(codeLines, lineNum, className) {
    const line = findLineByNumber(codeLines, lineNum);
    if (line) line.classList.add(className);
}

// Highlight a range of lines
function highlightLineRange(codeLines, startLine, endLine, className) {
    for (let i = startLine; i <= endLine; i++) {
        highlightLine(codeLines, i, className);
    }
}

// Find a line by its line number
function findLineByNumber(codeLines, lineNum) {
    return Array.from(codeLines).find(line => parseInt(line.dataset.line) === lineNum);
}

// Update the message box
function updateMessageBox(message) {
    messageBox.innerHTML = `<p>${message}</p>`;
}

// Update the current state
function updateState(newState) {
    currentState = newState;
    
    // Apply visual changes based on state
    switch (newState) {
        case STATES.SETUP_COMPLETE:
            // Show the part is ready to be clicked
            gamePart.style.cursor = 'pointer';
            break;
        case STATES.CLICK_DETECTED:
            // Activate the brain connection
            brainConnection.classList.add('active');
            break;
        case STATES.FUNCTION_ACTIVATED:
            // No additional changes needed
            break;
        case STATES.PART_GROWING:
            // Make the part grow
            gamePart.classList.add('growing');
            break;
    }
}

// Apply visual effects for specific steps
function applyStepVisualEffects(stepNum) {
    // Reset any previous visual effects
    if (stepNum === 1) {
        // Reset everything for step 1
        gamePart.classList.remove('growing', 'clicked');
        brainConnection.classList.remove('active');
    }
}

// Update the overview steps section
function updateOverviewSteps(activeStep) {
    document.querySelectorAll('.step').forEach(step => {
        step.classList.remove('active');
    });
    
    const activeStepElement = document.getElementById(`overview-step-${activeStep}`);
    if (activeStepElement) {
        activeStepElement.classList.add('active');
    }
}

// Reset the visualization
function resetVisualization() {
    currentStep = 0;
    currentState = STATES.INITIAL;
    
    // Reset UI elements
    clearHighlights();
    gamePart.classList.remove('growing', 'clicked');
    characterArm.classList.remove('clicking');
    brainConnection.classList.remove('active');
    stepIndicator.classList.add('hidden');
    clickMagic.classList.add('hidden');
    
    // Reset overview steps
    document.querySelectorAll('.step').forEach(step => {
        step.classList.remove('active');
    });
    
    // Reset message
    updateMessageBox("Click the blue part to begin!");
}
