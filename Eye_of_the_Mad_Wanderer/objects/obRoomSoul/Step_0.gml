/// @description Insert description here
// You can write your code in this editor

if (theExit) {
	if (instance_exists(obPlayer)) {
		if (distance_to_object(obPlayer) <= 64) {
			with (obControl) {
				nextLevel = true;
			}
		}
	}
}