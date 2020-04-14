/// @description  scRoomLayout(name);
/// @param name - a string that matches the name of a room
/// @returns - an array



var layout = argument0;

if (layout == "elevator") {
	roomArray[0, 0] = 4;	// Width in 32x32 pixel squares
	roomArray[1, 0] = 4;	// Height in 32x32 pixel squares
	
	/* 	The remaining array indices represent each 32x32 square within the room.
	//	The first index is the X position, the second is the Y position (starting in the top-left).
	//	The 0th row of data is dedicated to the width and height.
	//	0 = NOTHING - 1 = WALL
	*/
	
	roomArray[01, 01] = 1; roomArray[02, 01] = 1; roomArray[03, 01] = 1; roomArray[04, 01] = 1;
	roomArray[01, 02] = 1; roomArray[02, 02] = 0; roomArray[03, 02] = 0; roomArray[04, 02] = 1;
	roomArray[01, 03] = 1; roomArray[02, 03] = 0; roomArray[03, 03] = 0; roomArray[04, 03] = 1;
	roomArray[01, 04] = 1; roomArray[02, 04] = 1; roomArray[03, 04] = 1; roomArray[04, 04] = 1;
	
	return roomArray;
}
else if (layout == "empty") {
	roomArray[0, 0] = 12;	// Width in 32x32 pixel squares
	roomArray[1, 0] = 12;	// Height in 32x32 pixel squares
	
	/* 	The remaining array indices represent each 32x32 square within the room.
	//	The first index is the X position, the second is the Y position (starting in the top-left).
	//	The 0th row of data is dedicated to the width and height.
	//	0 = NOTHING - 1 = WALL - 2 = PATH POINT - 3 = SMALL ENEMY
	*/
	
	roomArray[01, 01] = 1; roomArray[02, 01] = 1; roomArray[03, 01] = 1; roomArray[04, 01] = 1; roomArray[05, 01] = 1; roomArray[06, 01] = 1; roomArray[07, 01] = 1; roomArray[08, 01] = 1; roomArray[09, 01] = 1; roomArray[10, 01] = 1; roomArray[11, 01] = 1; roomArray[12, 01] = 1; 
	roomArray[01, 02] = 1; roomArray[02, 02] = 0; roomArray[03, 02] = 0; roomArray[04, 02] = 0; roomArray[05, 02] = 0; roomArray[06, 02] = 0; roomArray[07, 02] = 0; roomArray[08, 02] = 0; roomArray[09, 02] = 0; roomArray[10, 02] = 0; roomArray[11, 02] = 0; roomArray[12, 02] = 1; 
	roomArray[01, 03] = 1; roomArray[02, 03] = 0; roomArray[03, 03] = 2; roomArray[04, 03] = 0; roomArray[05, 03] = 0; roomArray[06, 03] = 0; roomArray[07, 03] = 0; roomArray[08, 03] = 0; roomArray[09, 03] = 0; roomArray[10, 03] = 2; roomArray[11, 03] = 0; roomArray[12, 03] = 1; 
	roomArray[01, 04] = 1; roomArray[02, 04] = 0; roomArray[03, 04] = 0; roomArray[04, 04] = 3; roomArray[05, 04] = 0; roomArray[06, 04] = 0; roomArray[07, 04] = 2; roomArray[08, 04] = 0; roomArray[09, 04] = 0; roomArray[10, 04] = 0; roomArray[11, 04] = 0; roomArray[12, 04] = 1; 
	roomArray[01, 05] = 1; roomArray[02, 05] = 0; roomArray[03, 05] = 0; roomArray[04, 05] = 0; roomArray[05, 05] = 0; roomArray[06, 05] = 0; roomArray[07, 05] = 0; roomArray[08, 05] = 0; roomArray[09, 05] = 0; roomArray[10, 05] = 0; roomArray[11, 05] = 0; roomArray[12, 05] = 1; 
	roomArray[01, 06] = 1; roomArray[02, 06] = 0; roomArray[03, 06] = 0; roomArray[04, 06] = 0; roomArray[05, 06] = 0; roomArray[06, 06] = 0; roomArray[07, 06] = 0; roomArray[08, 06] = 0; roomArray[09, 06] = 0; roomArray[10, 06] = 0; roomArray[11, 06] = 0; roomArray[12, 06] = 1; 
	roomArray[01, 07] = 1; roomArray[02, 07] = 0; roomArray[03, 07] = 0; roomArray[04, 07] = 0; roomArray[05, 07] = 0; roomArray[06, 07] = 0; roomArray[07, 07] = 0; roomArray[08, 07] = 3; roomArray[09, 07] = 2; roomArray[10, 07] = 0; roomArray[11, 07] = 0; roomArray[12, 07] = 1; 
	roomArray[01, 08] = 1; roomArray[02, 08] = 0; roomArray[03, 08] = 0; roomArray[04, 08] = 0; roomArray[05, 08] = 0; roomArray[06, 08] = 0; roomArray[07, 08] = 0; roomArray[08, 08] = 0; roomArray[09, 08] = 0; roomArray[10, 08] = 0; roomArray[11, 08] = 0; roomArray[12, 08] = 1; 
	roomArray[01, 09] = 1; roomArray[02, 09] = 0; roomArray[03, 09] = 0; roomArray[04, 09] = 2; roomArray[05, 09] = 2; roomArray[06, 09] = 0; roomArray[07, 09] = 0; roomArray[08, 09] = 0; roomArray[09, 09] = 0; roomArray[10, 09] = 0; roomArray[11, 09] = 0; roomArray[12, 09] = 1; 
	roomArray[01, 10] = 1; roomArray[02, 10] = 0; roomArray[03, 10] = 0; roomArray[04, 10] = 0; roomArray[05, 10] = 0; roomArray[06, 10] = 0; roomArray[07, 10] = 0; roomArray[08, 10] = 0; roomArray[09, 10] = 0; roomArray[10, 10] = 0; roomArray[11, 10] = 0; roomArray[12, 10] = 1; 
	roomArray[01, 11] = 1; roomArray[02, 11] = 0; roomArray[03, 11] = 0; roomArray[04, 11] = 0; roomArray[05, 11] = 0; roomArray[06, 11] = 0; roomArray[07, 11] = 0; roomArray[08, 11] = 0; roomArray[09, 11] = 0; roomArray[10, 11] = 0; roomArray[11, 11] = 0; roomArray[12, 11] = 1; 
	roomArray[01, 12] = 1; roomArray[02, 12] = 1; roomArray[03, 12] = 1; roomArray[04, 12] = 1; roomArray[05, 12] = 1; roomArray[06, 12] = 1; roomArray[07, 12] = 1; roomArray[08, 12] = 1; roomArray[09, 12] = 1; roomArray[10, 12] = 1; roomArray[11, 12] = 1; roomArray[12, 12] = 1; 
	
	return roomArray;
}
else if (layout == "zigzag") {
	roomArray[0, 0] = 12;	// Width in 32x32 pixel squares
	roomArray[1, 0] = 14;	// Height in 32x32 pixel squares
	
	/* 	The remaining array indices represent each 32x32 square within the room.
	//	The first index is the X position, the second is the Y position (starting in the top-left).
	//	The 0th row of data is dedicated to the width and height.
	//	0 = NOTHING - 1 = WALL - 2 = PATH POINT - 3 = SMALL ENEMY
	*/
	
	roomArray[01, 01] = 1; roomArray[02, 01] = 1; roomArray[03, 01] = 1; roomArray[04, 01] = 1; roomArray[05, 01] = 1; roomArray[06, 01] = 1; roomArray[07, 01] = 1; roomArray[08, 01] = 1; roomArray[09, 01] = 1; roomArray[10, 01] = 1; roomArray[11, 01] = 1; roomArray[12, 01] = 1; 
	roomArray[01, 02] = 1; roomArray[02, 02] = 2; roomArray[03, 02] = 1; roomArray[04, 02] = 0; roomArray[05, 02] = 0; roomArray[06, 02] = 0; roomArray[07, 02] = 0; roomArray[08, 02] = 0; roomArray[09, 02] = 1; roomArray[10, 02] = 2; roomArray[11, 02] = 0; roomArray[12, 02] = 1; 
	roomArray[01, 03] = 1; roomArray[02, 03] = 0; roomArray[03, 03] = 1; roomArray[04, 03] = 0; roomArray[05, 03] = 0; roomArray[06, 03] = 0; roomArray[07, 03] = 0; roomArray[08, 03] = 0; roomArray[09, 03] = 1; roomArray[10, 03] = 0; roomArray[11, 03] = 0; roomArray[12, 03] = 1; 
	roomArray[01, 04] = 1; roomArray[02, 04] = 0; roomArray[03, 04] = 1; roomArray[04, 04] = 0; roomArray[05, 04] = 0; roomArray[06, 04] = 0; roomArray[07, 04] = 0; roomArray[08, 04] = 0; roomArray[09, 04] = 1; roomArray[10, 04] = 0; roomArray[11, 04] = 0; roomArray[12, 04] = 1; 
	roomArray[01, 05] = 1; roomArray[02, 05] = 0; roomArray[03, 05] = 1; roomArray[04, 05] = 0; roomArray[05, 05] = 0; roomArray[06, 05] = 0; roomArray[07, 05] = 0; roomArray[08, 05] = 0; roomArray[09, 05] = 1; roomArray[10, 05] = 0; roomArray[11, 05] = 0; roomArray[12, 05] = 1; 
	roomArray[01, 06] = 1; roomArray[02, 06] = 0; roomArray[03, 06] = 1; roomArray[04, 06] = 0; roomArray[05, 06] = 0; roomArray[06, 06] = 1; roomArray[07, 06] = 0; roomArray[08, 06] = 0; roomArray[09, 06] = 1; roomArray[10, 06] = 0; roomArray[11, 06] = 0; roomArray[12, 06] = 1; 
	roomArray[01, 07] = 1; roomArray[02, 07] = 0; roomArray[03, 07] = 1; roomArray[04, 07] = 0; roomArray[05, 07] = 0; roomArray[06, 07] = 1; roomArray[07, 07] = 0; roomArray[08, 07] = 0; roomArray[09, 07] = 1; roomArray[10, 07] = 0; roomArray[11, 07] = 0; roomArray[12, 07] = 1; 
	roomArray[01, 08] = 1; roomArray[02, 08] = 0; roomArray[03, 08] = 1; roomArray[04, 08] = 0; roomArray[05, 08] = 3; roomArray[06, 08] = 1; roomArray[07, 08] = 0; roomArray[08, 08] = 0; roomArray[09, 08] = 1; roomArray[10, 08] = 0; roomArray[11, 08] = 0; roomArray[12, 08] = 1; 
	roomArray[01, 09] = 1; roomArray[02, 09] = 0; roomArray[03, 09] = 1; roomArray[04, 09] = 0; roomArray[05, 09] = 0; roomArray[06, 09] = 1; roomArray[07, 09] = 0; roomArray[08, 09] = 0; roomArray[09, 09] = 1; roomArray[10, 09] = 0; roomArray[11, 09] = 0; roomArray[12, 09] = 1; 
	roomArray[01, 10] = 1; roomArray[02, 10] = 0; roomArray[03, 10] = 0; roomArray[04, 10] = 0; roomArray[05, 10] = 0; roomArray[06, 10] = 1; roomArray[07, 10] = 0; roomArray[08, 10] = 0; roomArray[09, 10] = 0; roomArray[10, 10] = 0; roomArray[11, 10] = 0; roomArray[12, 10] = 1; 
	roomArray[01, 11] = 1; roomArray[02, 11] = 0; roomArray[03, 11] = 0; roomArray[04, 11] = 0; roomArray[05, 11] = 0; roomArray[06, 11] = 1; roomArray[07, 11] = 0; roomArray[08, 11] = 0; roomArray[09, 11] = 0; roomArray[10, 11] = 0; roomArray[11, 11] = 0; roomArray[12, 11] = 1; 
	roomArray[01, 12] = 1; roomArray[02, 12] = 0; roomArray[03, 12] = 0; roomArray[04, 12] = 0; roomArray[05, 12] = 0; roomArray[06, 12] = 1; roomArray[07, 12] = 0; roomArray[08, 12] = 0; roomArray[09, 12] = 0; roomArray[10, 12] = 0; roomArray[11, 12] = 0; roomArray[12, 12] = 1; 
	roomArray[01, 13] = 1; roomArray[02, 13] = 0; roomArray[03, 13] = 0; roomArray[04, 13] = 0; roomArray[05, 13] = 0; roomArray[06, 13] = 1; roomArray[07, 13] = 2; roomArray[08, 13] = 0; roomArray[09, 13] = 0; roomArray[10, 13] = 0; roomArray[11, 13] = 0; roomArray[12, 13] = 1; 
	roomArray[01, 14] = 1; roomArray[02, 14] = 1; roomArray[03, 14] = 1; roomArray[04, 14] = 1; roomArray[05, 14] = 1; roomArray[06, 14] = 1; roomArray[07, 14] = 1; roomArray[08, 14] = 1; roomArray[09, 14] = 1; roomArray[10, 14] = 1; roomArray[11, 14] = 1; roomArray[12, 14] = 1; 
	
	return roomArray;
}
else {
	show_error("ERROR: No room of type \"" + layout + "\" found during floor generation.", false);
}

