/// @description Insert description here
// You can write your code in this editor

if (randomizePlace) {
	var randSoul = instance_find(obRoomSoul, irandom(instance_number(obRoomSoul) - 1));
	x = 0;
	y = 0;
	
	while (x == 0) {
		x = randSoul.x + irandom_range(-randSoul.roomWidth / 2, randSoul.roomWidth / 2);
		y = randSoul.y + irandom_range(-randSoul.roomHeight / 2, randSoul.roomHeight / 2);
		
		if (collision_point(x, y, obWall, true, true)) {
			x = 0;
			y = 0;
		}
	}
	
	randomizePlace = false;
}