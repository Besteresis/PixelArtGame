 /// @description Textbox test

var _text
var _startingDialogueIndex
// Create a textbox if NPC is nearby
if (nearbyNPC) {
	if (global.playerControl) {
		currentDialogueBox = noone;
		currentDialogueText = 0;
		currentDialogueLine = 0;
		currentDialogueLength = 0;
		if (nearbyNPC.dialogueProgression == 0) {
			_startingDialogueIndex = 0;	
		} else {
			_startingDialogueIndex = nearbyNPC.dialogueRules[nearbyNPC.dialogueProgression - 1] + 1;
		}
		if (nearbyNPC.dialogueProgression == array_length(nearbyNPC.dialogueRules) - 1) {
			currentDialogueLength = array_length(nearbyNPC.dialogueText) - _startingDialogueIndex;
		} else if (nearbyNPC.dialogueProgression == 0) {
			if (array_length(nearbyNPC.dialogueRules) == 1) {
				currentDialogueLength = array_length(nearbyNPC.dialogueText);
			} else {
				currentDialogueLength = nearbyNPC.dialogueRules[0] + 1;
			}
		} else {
			currentDialogueLength = nearbyNPC.dialogueRules[nearbyNPC.dialogueProgression + 1] - _startingDialogueIndex;
		}
		//array_copy(currentDialogueText, 0, nearbyNPC.dialogueText, _startingDialogueIndex, currentDialogueLength);
		for (i = _startingDialogueIndex; i < _startingDialogueIndex + currentDialogueLength; i++) {
			currentDialogueText[i - _startingDialogueIndex] = nearbyNPC.dialogueText[i];
		}
		///////////////////////////////////////////////////////////////////
		if (!instance_exists(obj_textbox)) {
			_text = currentDialogueText[currentDialogueLine];
			currentDialogueLine++;
			currentDialogueBox = instance_create_depth(x, y, -10000, obj_textbox);	
			currentDialogueBox.textToShow = _text;
		}
	} else {
		if (currentDialogueLine < currentDialogueLength) {
			_text = currentDialogueText[currentDialogueLine];
			currentDialogueLine++;	
			currentDialogueBox.textToShow = _text;
		} else {
			if (nearbyNPC.dialogueProgression != array_length(nearbyNPC.dialogueRules) - 1) {
				nearbyNPC.dialogueProgression++;
			}
			currentDialogueBox.alarm[1] = 1; 
		}
	}
}