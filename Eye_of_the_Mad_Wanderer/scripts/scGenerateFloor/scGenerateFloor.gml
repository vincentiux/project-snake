/// @description  scGenerateFloor(roomsNum, rooms, roomsRarity);
/// @param roomsNum - number of rooms in the floor
/// @param rooms - array of names of layouts to be used for most rooms
/// @param roomsRarity - array of chances of associated layout (0.0-1.0)

var roomsNum = argument0;
var rooms = argument1;
var roomsRarity = argument2;
var layoutsAmount = array_length_1d(rooms);
var layout = "empty";
var roomData;

var width = 4;
var height = 4;

var startX = 5000;
var startY = 5000;

var counter = 0;

// Create Rooms
repeat(roomsNum){
    counter++
	
	// Determine layout
	
	if ((counter == 1) || (abs(counter-roomsNum) < 1)) {
		layout = "elevator";
	}
	else {
		var layoutFound = false;

		while (layoutFound == false) {
			var layoutNum = irandom_range(0, layoutsAmount - 1);
			var chance = random(1);
		
			if (chance <= roomsRarity[layoutNum]) {
				layout = rooms[layoutNum];
				layoutFound = true;
			}
		}
	}
	
	// Random Orientation
	
	var layoutRot = choose(0, 1, 2, 3);	// Turns counter-clockwise
	
	var tempData = scRoomLayout(layout);
	
	width = tempData[0, 0];
	height = tempData[1, 0];
	
	if (layoutRot == 1) || (layoutRot == 3) {
		var tempWidth = width;
		
		width = height;
		height = tempWidth;
		
		if (width > height) {
			for (var i = 1; i <= width; i++) {
				for (var j = 1; j <= height; j++) {
					roomData[i, j] = tempData[j, i];
				}
			}
		}
		else {
			for (var i = 1; i <= height; i++) {
				for (var j = 1; j <= width; j++) {
					roomData[j, i] = tempData[i, j];
				}
			}
		}
		
		if (layoutRot == 1) {
			var newTempData;
			
			for (var i = 1; i <= width; i++) {
				for (var j = 1; j <= height; j++) {
					newTempData[i, j] = roomData[i, (height - j) + 1];
				}
			}
			
			roomData = newTempData;
		}
	}
	else if (layoutRot == 2) {
		roomData = tempData;
		
		var newTempData;
			
		for (var i = 1; i <= width; i++) {
			for (var j = 1; j <= height; j++) {
				newTempData[i, j] = roomData[i, (height - j) + 1];
			}
		}
			
		roomData = newTempData;
	}
	else {
		roomData = tempData;
	}

	// Determine Position
	
	if (instance_exists(obRoomSoul)) {
		var anchorRoom = instance_find(obRoomSoul, irandom(instance_number(obRoomSoul) - 1));	// Random existing room
		var collideRoom;
		var newDir = choose(0, 1, 2, 3);	// Relative direction for new room
		var breakLoop = false;
		
		if (abs(counter-roomsNum) < 1) {			// Prevents elevators from being connected
			while (anchorRoom.roomWidth == 128)	{	// Elevator
				anchorRoom = instance_find(obRoomSoul, irandom(instance_number(obRoomSoul) - 1));
			}
		}
		
		while (breakLoop == false) {
			if (newDir == 0) {					// Right
				startX = (anchorRoom.x) + (anchorRoom.roomWidth / 2) + (irandom_range(2,6) * 32);			// 2-6 is hallway length
				startY = (anchorRoom.y) - (height * 16);
			}
			else if (newDir == 1) {				// Left
				startX = (anchorRoom.x) - (anchorRoom.roomWidth / 2) - (width * 32) - (irandom_range(2,6) * 32);
				startY = (anchorRoom.y) - (height * 16);
			}
			else if (newDir == 2) {				// Up
				startX = (anchorRoom.x) - (width * 16);
				startY = (anchorRoom.y) - (anchorRoom.roomHeight / 2) - (height * 32) - (irandom_range(2,6) * 32);
			}
			else if (newDir == 3) {				// Down
				startX = (anchorRoom.x) - (width * 16);
				startY = (anchorRoom.y) + (anchorRoom.roomHeight / 2) + (irandom_range(2,6) * 32);
			}
			
			collideRoom = instance_nearest(startX + (width * 16), startY + (height * 16), obRoomSoul);
		
			if ((!(collision_rectangle(startX, startY, startX + (width * 32), startY + (height * 32), obWall, 0, 0))) && (!(collision_rectangle(startX, startY, (anchorRoom.x) + (anchorRoom.roomWidth / 2), (anchorRoom.y) + (anchorRoom.roomHeight / 2), obWall, 0, 0))) && (point_distance(collideRoom.x, collideRoom.y, startX + (width * 16), startY + (height * 16)) > ((max(collideRoom.roomWidth, collideRoom.roomHeight) / 2) + (max(width, height) / 2)))) {
				breakLoop = true;
			}
			else {
				anchorRoom = instance_find(obRoomSoul, irandom(instance_number(obRoomSoul) - 1));
				newDir = choose(0, 1, 2, 3);
			}
		}
		
		startX += 16;
		startY += 16;
	}

	// Soul
	
	var newSoul = instance_create(startX+((width - 1) * 16), startY+((height - 1) * 16), obRoomSoul);
	newSoul.roomWidth = width * 32;
	newSoul.roomHeight = height * 32;
	if (abs(counter-roomsNum) < 1) {
		newSoul.theExit = true;
	}

    // Tiles and Walls and Everything
    
	var dataSquare = 0;
	var dataSquareX = 1;
	var dataSquareY = 1;
	
    for (iY = 0; iY < height; iY += 1){
        var tileX = choose(0,32);
        var tileY = choose(0,32);
    
        for (iX = 0; iX < width; iX += 1){
			dataSquareX = iX + 1;
			dataSquareY = iY + 1;
			
			if ((dataSquareX > width) || (dataSquareY > height)) {
				dataSquare = 0;
			}
			else {
				dataSquare = roomData[dataSquareX, dataSquareY];
			}
			
            if ((counter == 1) || (abs(counter-roomsNum) <= 0)) {
                if (random(1) < 0.8){
                    var tileX = choose(0,32);
                    var tileY = choose(0,32);
                }
            
				if (((height - iY) > 1) && ((width - iX) > 1)) {
					tile_add(tsElevatorTile,tileX,tileY,32,32,startX+(iX*32),startY+(iY*32),5);
				}
            }
            else{
                if (random(1) < 0.5){
                    var tileX = choose(0,32);
                    var tileY = choose(0,32);
                }
            
				if (((height - iY) > 1) && ((width - iX) > 1)) {
					tile_add(tsTile,tileX,tileY,32,32,startX+(iX*32),startY+(iY*32),5);
				}
            }
			
			// THIS IS WHAT ADDS OBJECTS TO THE FLOOR
			if (dataSquare == 1) {
				instance_create(startX+(iX*32),startY+(iY*32),obWall);
			}
			else if (dataSquare == 2) {
				instance_create(startX+(iX*32),startY+(iY*32),obPathPoint);
			}
			else if (dataSquare == 3) {
				instance_create(startX+(iX*32),startY+(iY*32),obEnemy);
			}
        }
    }
    
    // Hallway
    if (counter > 1) {
		hallStartX = 0
		hallStartY = 0
		hallEndX = 0
		hallEndY = 0
		
		if (newDir == 0) {
			hallStartX = startX - 32;
			hallStartY = startY + (height * 16);
			
			hallEndX = anchorRoom.x + (anchorRoom.roomWidth / 2);
			hallEndY = hallStartY;
			
			with (obWall) {
				if (collision_rectangle(other.hallStartX + 32, other.hallStartY - 64, other.hallEndX - 32, other.hallEndY + 32, self, 0, 0)) {
					instance_destroy();
				}
			}
			
			for (var i = -32; i <= abs(hallEndX - hallStartX) + 32; i += 32) {
				instance_create(hallStartX - i, hallStartY - 64, obWall);
				tile_add(tsTile, 0, 0, 32, 32, hallStartX - i, hallStartY, 5);
				tile_add(tsTile, 0, 0, 32, 32, hallStartX - i, hallStartY - 32, 5);
				tile_add(tsTile, 0, 0, 32, 32, hallStartX - i, hallStartY - 64, 5);
				instance_create(hallStartX - i, hallEndY + 32, obWall);
			}
		}
		else if (newDir == 1) {
			hallStartX = startX + (width * 32);
			hallStartY = startY + (height * 16);
			
			hallEndX = anchorRoom.x - (anchorRoom.roomWidth / 2) - 32;
			hallEndY = hallStartY;
			
			with (obWall) {
				if (collision_rectangle(other.hallStartX - 32, other.hallStartY - 64, other.hallEndX + 32, other.hallEndY + 32, self, 0, 0)) {
					instance_destroy();
				}
			}
			
			for (var i = -32; i <= abs(hallEndX - hallStartX) + 64; i += 32) {
				instance_create(hallStartX + i, hallStartY - 64, obWall);
				tile_add(tsTile, 0, 0, 32, 32, hallStartX + i, hallStartY, 5);
				tile_add(tsTile, 0, 0, 32, 32, hallStartX + i, hallStartY - 32, 5);
				tile_add(tsTile, 0, 0, 32, 32, hallStartX + i, hallStartY - 64, 5);
				instance_create(hallStartX + i, hallEndY + 32, obWall);
			}
		}
		else if (newDir == 3) {
			hallStartX = startX + (width * 16);
			hallStartY = startY - 32;
			
			hallEndX = hallStartX;
			hallEndY = anchorRoom.y + (anchorRoom.roomHeight / 2);
			
			with (obWall) {
				if (collision_rectangle(other.hallStartX - 64, other.hallStartY + 32, other.hallEndX + 32, other.hallEndY - 32, self, 0, 0)) {
					instance_destroy();
				}
			}
			
			for (var i = -32; i <= abs(hallEndY - hallStartY) + 32; i += 32) {
				instance_create(hallStartX - 64, hallStartY - i, obWall);
				tile_add(tsTile, 0, 0, 32, 32, hallStartX, hallStartY - i, 5);
				tile_add(tsTile, 0, 0, 32, 32, hallStartX - 32, hallStartY - i, 5);
				tile_add(tsTile, 0, 0, 32, 32, hallStartX - 64, hallStartY - i, 5);
				instance_create(hallStartX + 32, hallStartY - i, obWall);
			}
		}
		else {
			hallStartX = startX + (width * 16);
			hallStartY = startY + (height * 32);
			
			hallEndX = hallStartX;
			hallEndY = anchorRoom.y + (anchorRoom.roomHeight / 2) - 32;
			
			with (obWall) {
				if (collision_rectangle(other.hallStartX - 64, other.hallStartY - 32, other.hallEndX + 32, other.hallEndY + 32, self, 0, 0)) {
					instance_destroy();
				}
			}
			
			for (var i = -32; i <= abs(hallEndY - hallStartY) + 64; i += 32) {
				instance_create(hallStartX - 64, hallStartY + i, obWall);
				tile_add(tsTile, 0, 0, 32, 32, hallStartX, hallStartY + i, 5);
				tile_add(tsTile, 0, 0, 32, 32, hallStartX - 32, hallStartY + i, 5);
				tile_add(tsTile, 0, 0, 32, 32, hallStartX - 64, hallStartY + i, 5);
				instance_create(hallStartX + 32, hallStartY + i, obWall);
			}
		}
	}
	
	// Update Walls
	
	with (obWall) {
		refresh = true;
	}
}
