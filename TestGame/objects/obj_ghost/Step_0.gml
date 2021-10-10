/// @description Player Movement

// Check keys for movement
moveRight = keyboard_check(vk_right)
moveLeft = keyboard_check(vk_left)
moveUp = keyboard_check(vk_up)
moveDown = keyboard_check(vk_down)

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

// Depth sorting
depth =-y;