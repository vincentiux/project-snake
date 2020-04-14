/// @description Testing

hint = true;

depth = -10;

global.currentFloor = 1;

var roomsToGen;
var roomsToGenRarity;

roomsToGen[0] = "empty";
roomsToGenRarity[0] = 0.8;

roomsToGen[1] = "zigzag";
roomsToGenRarity[1] = 0.4;

scGenerateFloor(irandom_range(5,11), roomsToGen, roomsToGenRarity);

cameraSpeed = 5;

targetViewX = 0;
targetViewY = 0;

instance_create(5032, 5032, obPlayer);

drawShadow = ds_stack_create();
surfShadow = surface_create(10000, 10000);

global.grid = mp_grid_create(8, 8, 1280, 1280, 16, 16);

nextLevel = false;