/// @description Update Walls
// You can write your code in this editor

if (updateWalls) {
	with (obWall) {
		mp_grid_add_instances(global.grid, self, 1);
	}
	
	updateWalls = false;
}