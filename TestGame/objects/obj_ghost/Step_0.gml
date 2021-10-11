 /// @description Player Movement

// Check keys for movement
if (global.playerControl) {
	moveRight = keyboard_check(vk_right)
	moveLeft = keyboard_check(vk_left)
	moveUp = keyboard_check(vk_up)
	moveDown = keyboard_check(vk_down)
} else {
	moveRight = 0;
	moveLeft = 0;
	moveUp = 0;
	moveDown = 0;
}

// Calculate movement
vx = ((moveRight - moveLeft) * walkSpeed);
vy = ((moveDown - moveUp) * walkSpeed);
// If Idle
if (vx == 0 && vy = 0) {
	sprite_index = spr_ghost_idle_down
}

// If moving
if (vx != 0 || vy != 0) {
	if !collision_point(x+vx, y, obj_par_environment, true, true) {
		x += vx;	
	}
	if !collision_point(x, y+vy, obj_par_environment, true, true) {
		y += vy;
	}
	
	//Change walking Sprite
	sprite_index = spr_ghost_moving;
}
 
// Check for collisions with NPC
nearbyNPC = collision_rectangle(x-lookRange, y-lookRange, x+lookRange, y+lookRange, obj_par_npc, false, true)
if nearbyNPC {
	// Pop up prompt
	if (npcPrompt == noone || npcPrompt == undefined) {
		npcPrompt = scr_showPrompt(nearbyNPC, nearbyNPC.x, nearbyNPC.y - nearbyNPC.sprite_height);	
	}
	//show_debug_message("obj_player has found an enemy!")
} else {
	//Get rid of prompt
	scr_dismissPrompt(npcPrompt, 0);
	// show_debug_message("obj_player hasn't found anything !")
}

// Depth sorting
depth =-y;