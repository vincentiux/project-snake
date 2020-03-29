grid = mp_grid_create(0,0, room_width/32, room_height/32, 32,32);
path=path_add();
mp_grid_add_instances(path, obWall,1);
mp_grid_path(grid,path,x,y,obControl.x, obControl.y,1);
path_start(path, 3,0,1);



	
image_angle=direction;

if(hp<=0) instance_destroy();