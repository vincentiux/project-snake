/// @description Draw Shadows

if (instance_exists(obPlayer) && instance_exists(obWall)) {
	if (!surface_exists(surfShadow)){
		surfShadow = surface_create(10000, 10000);
	}
	
	draw_set_color(c_black);
	
	surface_set_target(surfShadow);
	
	draw_clear_alpha(c_black, 0);
	
	// Draw Outer Circle
	var viewScale = ((obPlayer.maxViewDistance - obPlayer.viewDistance) / (obPlayer.maxViewDistance));
	
	draw_circle(obPlayer.x, obPlayer.y, 1000, 0);
	
	draw_set_blend_mode(bm_subtract);
	draw_circle(obPlayer.x, obPlayer.y, 1000 * viewScale, 0);
	draw_set_blend_mode(bm_normal);
	
	//Draw Player View Cone
	draw_set_color(c_black);
	draw_primitive_begin(pr_trianglestrip);
	draw_vertex(obPlayer.x,obPlayer.y);
	draw_vertex(obPlayer.x+lengthdir_x(2000,obPlayer.direction+(obPlayer.fov / 2)),obPlayer.y+lengthdir_y(2000,obPlayer.direction+(obPlayer.fov / 2)));
	draw_vertex(obPlayer.x+lengthdir_x(2000,obPlayer.direction+(obPlayer.fov / 2) + 180),obPlayer.y+lengthdir_y(2000,obPlayer.direction+(obPlayer.fov / 2) + 180));
	draw_vertex(obPlayer.x+lengthdir_x(2000,obPlayer.direction-(obPlayer.fov / 2) - 180),obPlayer.y+lengthdir_y(2000,obPlayer.direction-(obPlayer.fov / 2) - 180));
	draw_vertex(obPlayer.x+lengthdir_x(2000,obPlayer.direction-(obPlayer.fov / 2)),obPlayer.y+lengthdir_y(2000,obPlayer.direction-(obPlayer.fov / 2)));
	draw_vertex(obPlayer.x,obPlayer.y);
	draw_primitive_end();
	
	draw_set_blend_mode(bm_subtract);
	draw_circle(obPlayer.x, obPlayer.y, obPlayer.viewDistance, 0);
	draw_set_blend_mode(bm_normal);
	
	//Add all walls to drawShadow stack
	with (obWall) {
	    ds_stack_push(obControl.drawShadow,id);
	}

	//Draw all wall shadows
	while (ds_stack_size(drawShadow)>0) {
	    draw_set_color(c_black);

	    holdID = ds_stack_pop(drawShadow);
	    holdX = holdID.x - 16;
	    holdY = holdID.y - 16;
    
	    draw_primitive_begin(pr_trianglestrip);
	    draw_vertex(holdX,holdY);
	    draw_vertex(holdX+lengthdir_x(1000,point_direction(obPlayer.x,obPlayer.y,holdX,holdY)),holdY+lengthdir_y(1000,point_direction(obPlayer.x,obPlayer.y,holdX,holdY)));
	    draw_vertex(holdX+32,holdY);
	    draw_vertex(holdX+32+lengthdir_x(1000,point_direction(obPlayer.x,obPlayer.y,holdX+32,holdY)),holdY+lengthdir_y(1000,point_direction(obPlayer.x,obPlayer.y,holdX+32,holdY)));
	    draw_vertex(holdX+32,holdY+32);
	    draw_vertex(holdX+32+lengthdir_x(1000,point_direction(obPlayer.x,obPlayer.y,holdX+32,holdY+32)),holdY+32+lengthdir_y(1000,point_direction(obPlayer.x,obPlayer.y,holdX+32,holdY+32)));
	    draw_vertex(holdX,holdY+32);
	    draw_vertex(holdX+lengthdir_x(1000,point_direction(obPlayer.x,obPlayer.y,holdX,holdY+32)),holdY+32+lengthdir_y(1000,point_direction(obPlayer.x,obPlayer.y,holdX,holdY+32)));
	    draw_vertex(holdX,holdY);
	    draw_primitive_end();
	
		draw_rectangle(holdX, holdY, holdX + 32, holdY + 32, 0);
	}
	
	surface_reset_target();

	draw_surface(surfShadow, 0, 0);
}

// Draw Floor and Hint

draw_set_font(fnFloor);
draw_set_color(c_white);

draw_set_halign(fa_left);

draw_text(camera_get_view_x(view_camera[0]) + 10, camera_get_view_y(view_camera[0]) + 10, "FLOOR: " + string(global.currentFloor));

if (hint) {
	draw_set_halign(fa_right);

	draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 10, camera_get_view_y(view_camera[0]) + 10, "HOW TO PLAY");
	draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 10, camera_get_view_y(view_camera[0]) + 39, "WASD to move. Mouse to look.");  // +29 down
	draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 10, camera_get_view_y(view_camera[0]) + 68, "Shift to run. Control to stalk.");
	draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 10, camera_get_view_y(view_camera[0]) + 97, "Get to the other elevator.");
	draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 10, camera_get_view_y(view_camera[0]) + 126, "Don't get spotted.");
	draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 10, camera_get_view_y(view_camera[0]) + 155, "Space to restart. Enter to hide this.");

	draw_set_halign(fa_left);
}