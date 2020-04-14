/// @description Move Camera

if (keyboard_check_pressed(vk_f1)) {
	window_set_fullscreen(!window_get_fullscreen());
}

if (keyboard_check_pressed(vk_enter)) {
	hint = !hint;
}

if (keyboard_check(vk_up)) {
	y -= cameraSpeed;
}

if (keyboard_check(vk_down)) {
	y += cameraSpeed;
}

if (keyboard_check(vk_left)) {
	x -= cameraSpeed;
}

if (keyboard_check(vk_right)) {
	x += cameraSpeed;
}

#region MOVE THE VIEW

halfViewWidth = camera_get_view_width(view_camera[0]) / 2;
halfViewHeight = camera_get_view_height(view_camera[0]) / 2;

if (instance_exists(obPlayer)) {
	if (instance_exists(obRoomSoul)) {
		with (obPlayer) {
			other.nearestSoul = instance_nearest(x, y, obRoomSoul);
		}
	}
	else {
		instance_create(0, 0, obRoomSoul);
	}
	
	var viewStartX = lerp(obPlayer.x, nearestSoul.x, 0.3);
	var viewStartY = lerp(obPlayer.y, nearestSoul.y, 0.3);
	
	targetViewX = lerp(viewStartX, mouse_x, 0.4);
	targetViewY = lerp(viewStartY, mouse_y, 0.4);
	
	camera_set_view_pos(view_camera[0], targetViewX - halfViewWidth, targetViewY - halfViewHeight);
}

#endregion

if ((keyboard_check_pressed(vk_space)) || (nextLevel)) {
	if (nextLevel) {
		nextLevel = false;
		global.currentFloor++;
	}
	else {
		global.currentFloor = 1;
	}
	
	with (all){
		if (id != other.id){    // Destroy all instances except control
			instance_destroy();
		}
	}
        
	tile_layer_delete(5);       // Clear Tiles
	
	var roomsToGen;
	var roomsToGenRarity;

	roomsToGen[0] = "empty";
	roomsToGenRarity[0] = 0.8;

	roomsToGen[1] = "zigzag";
	roomsToGenRarity[1] = 0.4;

	scGenerateFloor(irandom_range(min(4 + global.currentFloor, 10),min(9 + global.currentFloor, 30)), roomsToGen, roomsToGenRarity);
	
	instance_create(5032, 5032, obPlayer);

	ds_stack_destroy(drawShadow);	
	drawShadow = ds_stack_create();
	
	x = 0;
	y = 0;
}