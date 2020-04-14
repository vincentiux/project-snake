/// @description Insert description here
// You can write your code in this editor

// Sight

sightDistance = maxSightDistance;

for (var i = 0; i < maxSightDistance; i++) {
	if (collision_line(x, y, x + lengthdir_x(i, detectionDir), y + lengthdir_y(i, detectionDir), obWall, 1, 0)) {
		sightDistance = i;
		break;
	}
}


if (instance_exists(obPlayer)) {
	if (y > obPlayer.y)	{
		depth = -2;
	}
	else {
		depth = 0;
	}
	
	if (distance_to_object(obPlayer) <= 16) {
		detect = 1;
		chaseTimer = chaseTimerMax;
		attack = true;
	}
	
	// Animate and Attack

	if (attack) {
		if (image_index >= 10.5) {
			image_index = 0;
			attack = 0;
		}
		else if ((image_index > 8) && (image_index < 9)) {
			if (instance_place(x,y,obPlayer)) {
				with (obPlayer) {
					dead = true;
				}
			}
			else {
				image_index += 0.25;
			}
		}
		else {
			image_index += 0.25;
		}
	}
	else {
		if (image_index >= 2) {
			image_index = 0;
		}
		else {
			image_index += 0.1;
		}
	}
	
	// Detection

	if (point_in_triangle(obPlayer.x, obPlayer.y, x, y, x + lengthdir_x(sightDistance, detectionDir - (fov / 2)),  y + lengthdir_y(sightDistance, detectionDir - (fov / 2)), x + lengthdir_x(sightDistance, detectionDir + (fov / 2)),  y + lengthdir_y(sightDistance, detectionDir + (fov / 2)))) {
		detect = lerp(detect, 1, 0.15 * clamp((300 - point_distance(x,y,obPlayer.x,obPlayer.y)) / 300, 0.1, 1));
	
		if (detect > 0.8) {
			detect = 1;						// Caught!
			chaseTimer = chaseTimerMax;
		}
	}
	else {
		if (chaseTimer > 0) {
			chaseTimer--;
		}
		else {
			if (detect == 1) {
				goal = instance_nearest(x,y,obPathPoint);
			}
			
			detect = lerp(detect, 0, 0.2);
		}
	}
}

// Pathfinding Stuff

if (detect == 1) {
	goal = obPlayer;
	spd = 2;
}
else {
	spd = 1;
}

if (mp_grid_path(global.grid, pathfind, x, y, goal.x, goal.y, 1)) {
	path_start(pathfind, spd, path_action_stop, false);
}
else {
	goal = instance_find(obPathPoint, irandom(instance_number(obPathPoint) - 1));
}

if ((distance_to_object(goal) <= 16) && (goal != obPlayer.id)) {
	if (goal.id == path[0].id) {
		goal = path[1];
	}
	else if (goal.id == path[1].id) {
		goal = path[2];
	}
	else {
		goal = path[0];
	}
}

// Vision Cone Lag

detectionDir = lerp(detectionDir, direction, 0.05);

