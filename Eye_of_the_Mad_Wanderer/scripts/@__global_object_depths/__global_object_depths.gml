// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = -10; // obControl
global.__objectDepths[1] = 10; // obBackground
global.__objectDepths[2] = 0; // obPlayer
global.__objectDepths[3] = -5; // obBullet
global.__objectDepths[4] = -2; // obWall
global.__objectDepths[5] = 0; // obEnemy
global.__objectDepths[6] = 9; // obCameraMagnet
global.__objectDepths[7] = 0; // parShadows
global.__objectDepths[8] = 3; // obGore
global.__objectDepths[9] = 3; // obBloodPuddle
global.__objectDepths[10] = 3; // obDrawGore
global.__objectDepths[11] = -1; // obTable
global.__objectDepths[12] = -1; // obBarrel
global.__objectDepths[13] = 3; // obFurniturePart
global.__objectDepths[14] = -3; // obExplosion
global.__objectDepths[15] = -2; // obDoor


global.__objectNames[0] = "obControl";
global.__objectNames[1] = "obBackground";
global.__objectNames[2] = "obPlayer";
global.__objectNames[3] = "obBullet";
global.__objectNames[4] = "obWall";
global.__objectNames[5] = "obEnemy";
global.__objectNames[6] = "obCameraMagnet";
global.__objectNames[7] = "parShadows";
global.__objectNames[8] = "obGore";
global.__objectNames[9] = "obBloodPuddle";
global.__objectNames[10] = "obDrawGore";
global.__objectNames[11] = "obTable";
global.__objectNames[12] = "obBarrel";
global.__objectNames[13] = "obFurniturePart";
global.__objectNames[14] = "obExplosion";
global.__objectNames[15] = "obDoor";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for