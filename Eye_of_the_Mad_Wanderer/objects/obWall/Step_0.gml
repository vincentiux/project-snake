/// @description  Refresh

if (refresh){    
    var left = instance_place(x-16,y,obWall);
    var right = instance_place(x+16,y,obWall);
    var up = instance_place(x,y-16,obWall);
    var down = instance_place(x,y+16,obWall);
    
	if (left && right && up && down) {
		image_index = 15;
	}
	else if (right && up && down) {
		image_index = 14;
	}
	else if (left && right && up) {
		image_index = 13;
	}
	else if (left && right && down) {
		image_index = 12;
	}
	else if (left && up && down) {
		image_index = 11;
	}
	else if (right && down) {
		image_index = 10;
	}
	else if (right && up) {
		image_index = 9;
	}
	else if (left && down) {
		image_index = 8;
	}
	else if (left && up) {
		image_index = 7;
	}
	else if (up && down) {
		image_index = 6;
	}
	else if (left && right) {
		image_index = 5;
	}
	else if (down) {
		image_index = 4;
	}
	else if (up) {
		image_index = 3;
	}
	else if (right) {
		image_index = 2;
	}
	else if (left) {
		image_index = 1;
	}
	else {
		image_index = 0;
	}
    
    refresh = false;
}

/*
if (instance_exists(obPlayer)) {
	checkVisible = 0;

	//See if Wall is visible to the player
	if (scCheckVisible(obPlayer, id, obPlayer.fov)) {
	    //Check left top corner
	    if (collision_line(x-17,y-17,obPlayer.x,obPlayer.y,obWall,0,1)) {
	        checkVisible += 1;
		}
    
	    //Check right top corner
	    if (collision_line(x+17,y-17,obPlayer.x,obPlayer.y,obWall,0,1)) {
	        checkVisible += 1;
		}
    
	    //Check right bottom corner
	    if (collision_line(x+17,y+17,obPlayer.x,obPlayer.y,obWall,0,1)) {
	        checkVisible += 1;
		}
    
	    //Check left bottom corner
	    if (collision_line(x-17,y+17,obPlayer.x,obPlayer.y,obWall,0,1)) {
	        checkVisible += 1;
		}
	}
	else {
	    checkVisible = 4;
	}

	//If wall should be visible, make it visible
	if (checkVisible < 4) {
	    visible = 1;
	}
	else {
		visible = 0;
	}
}
else {
	visible = 0;
}
