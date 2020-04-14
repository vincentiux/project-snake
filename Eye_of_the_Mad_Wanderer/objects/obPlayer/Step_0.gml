d_top = keyboard_check(ord("W"));
d_right = keyboard_check(ord("D"));
d_left = keyboard_check(ord("A"));
d_bottom = keyboard_check(ord("S"));

u_top = keyboard_check_released(ord("W"));
u_right = keyboard_check_released(ord("D"));
u_left = keyboard_check_released(ord("A"));
u_bottom = keyboard_check_released(ord("S"));

d_shift = keyboard_check(vk_shift);
d_control = keyboard_check(vk_control);

u_shift = keyboard_check_released(vk_shift);
u_control = keyboard_check_released(vk_control);

if (!dead) {
	if (d_shift) {
		spd = 4;
		anispd = 0.5;
	}

	if (u_shift) {
		spd = 2;
		anispd = 0.25;
	}

	if (d_control) {
		spd = 1;
		anispd = 0.15;
	}

	if (u_control) {
		spd = 2;
		anispd = 0.25;
	}

	if (d_left && place_free(x - collisionSpd, y)) {
		if(d_top or d_bottom) {
			x -= spd/sqrt(2);
			image_index += anispd/2;
		} else {
			x -= spd;
			image_index += anispd;
			dir = -1;
		}
		sprite_index = sp_left;
	}

	if (u_left) {
		speed = 0;
		sprite_index = sp_standing_left;
		image_index = 0;
	}

	if (d_right && place_free(x + collisionSpd, y)) {
		if(d_top or d_bottom) {
			x += spd/sqrt(2);
			image_index += anispd/2;
		} else {
			x += spd;
			image_index += anispd;
			dir = 1;
		}
		sprite_index = sp_right;
	}

	if (u_right) {
		speed = 0;
		sprite_index = sp_standing_right;
		image_index = 0;
	}

	if (d_top && place_free(x, y - collisionSpd)) {
		if(d_left) {
			y -= spd/sqrt(2);
			sprite_index = sp_left;
			image_index += anispd/2;
		} else if(d_right) {
			y -= spd/sqrt(2);
			sprite_index = sp_right;
			image_index += anispd/2;
		} else {
			y -= spd;
			if(dir == 1) {
				sprite_index = sp_right;
				image_index += anispd;
			} else {
				sprite_index = sp_left;
				image_index += anispd;
			}
		}
	}

	if (u_top) {
		if(dir == 1) {
			sprite_index = sp_standing_right;
		} else {
			sprite_index = sp_standing_left;
		}
		image_index = 0;
		speed = 0;
	}

	if (d_bottom && place_free(x, y + collisionSpd)) {
		if(d_left) {
			y += spd/sqrt(2);
			sprite_index = sp_left;
			image_index += anispd/2;
		} else if(d_right) {
			y += spd/sqrt(2);
			sprite_index = sp_right;
			image_index += anispd/2;
		} else {
			y += spd;
			if(dir == 1) {
				sprite_index = sp_right;
				image_index += anispd;
			} else {
				sprite_index = sp_left;
				image_index += anispd;
			}
		}
	}

	if (u_bottom) {
		if(dir == 1) {
			sprite_index = sp_standing_right;
		} else {
			sprite_index = sp_standing_left;
		}
		image_index = 0;
		speed = 0;
	}

	// Looking

	direction = point_direction(x, y, mouse_x, mouse_y);
	viewRatio = clamp((point_distance(x, y, mouse_x, mouse_y) / 600), 0, 1);

	fov = lerp(fovMax, fovMin, viewRatio);
	viewDistance = lerp(maxViewDistance, minViewDistance, viewRatio);
}
else {
	spd = 0;
	anispd = 0;
	
	image_speed = 0;
	
	image_angle = 90;
	
	viewDistance = lerp(viewDistance, 0, 0.1);
	fov = lerp(fov, 0, 0.1);
	
	depth = -11;
}