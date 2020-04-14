/// @description Insert description here
// You can write your code in this editor

depth = 1;

// Establish Path Points

if (random(1) < 0.5) {
	instance_destroy();
}

if (instance_number(obPathPoint) < 3) {
	while (instance_number(obPathPoint) < 3) {
		var newPath = instance_create(x, y, obPathPoint);
		newPath.randomizePlace = true;
	}
}

path[0] = instance_find(obPathPoint, irandom(instance_number(obPathPoint) - 1));
path[1] = instance_find(obPathPoint, irandom(instance_number(obPathPoint) - 1));
path[2] = instance_find(obPathPoint, irandom(instance_number(obPathPoint) - 1));

while (path[1].id == path[0].id) {
	path[1] = instance_find(obPathPoint, irandom(instance_number(obPathPoint) - 1));
}

while (path[2].id == path[0].id) {
	path[2] = instance_find(obPathPoint, irandom(instance_number(obPathPoint) - 1));
	
	while (path[2].id == path[1].id) {
		path[2] = instance_find(obPathPoint, irandom(instance_number(obPathPoint) - 1));
	}
}

goal = path[0];

// Establish Pathfinding

pathfind = path_add();

updateWalls = true;

// Other

image_speed = 0;
image_index = 0;

spd = 1;

attack = false;
fov = 80;

detectionDir = 0;

detect = 0;
chaseTimer = 0;
chaseTimerMax = 600;

// Sight Blockers
sightDistance = 300;
maxSightDistance = 300;
