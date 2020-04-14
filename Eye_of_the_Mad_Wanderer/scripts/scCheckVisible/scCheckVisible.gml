/// @description  scCheckVisible(viewing object , checked object, fov);

inView = 0;
viewer = argument0;
checked = argument1;
fov = argument2;

boundaryLeft = (viewer.direction + (fov / 2)) mod 360;
boundaryRight = (viewer.direction - (fov / 2));

if (boundaryRight < 0) {
	boundaryRight = 360 + boundaryRight;
}

if (boundaryLeft >= boundaryRight) {
	if (((point_direction(viewer.x, viewer.y, checked.x - 16, checked.y - 16) >= boundaryRight) && (point_direction(viewer.x, viewer.y, checked.x - 16, checked.y - 16) <= boundaryLeft)) || ((point_direction(viewer.x, viewer.y, checked.x + 16, checked.y - 16) >= boundaryRight) && (point_direction(viewer.x, viewer.y, checked.x + 16, checked.y - 16) <= boundaryLeft)) || ((point_direction(viewer.x, viewer.y, checked.x + 16, checked.y + 16) >= boundaryRight) && (point_direction(viewer.x, viewer.y, checked.x + 16, checked.y + 16) <= boundaryLeft)) || ((point_direction(viewer.x, viewer.y, checked.x - 16, checked.y + 16) >= boundaryRight) && (point_direction(viewer.x, viewer.y, checked.x - 16, checked.y + 16) <= boundaryLeft))) {
		inView = 1;
	}
}
else {
	if (((point_direction(viewer.x, viewer.y, checked.x - 16, checked.y - 16) >= boundaryRight) || (point_direction(viewer.x, viewer.y, checked.x - 16, checked.y - 16) <= boundaryLeft)) || ((point_direction(viewer.x, viewer.y, checked.x + 16, checked.y - 16) >= boundaryRight) || (point_direction(viewer.x, viewer.y, checked.x + 16, checked.y - 16) <= boundaryLeft)) || ((point_direction(viewer.x, viewer.y, checked.x + 16, checked.y + 16) >= boundaryRight) || (point_direction(viewer.x, viewer.y, checked.x + 16, checked.y + 16) <= boundaryLeft)) || ((point_direction(viewer.x, viewer.y, checked.x - 16, checked.y + 16) >= boundaryRight) || (point_direction(viewer.x, viewer.y, checked.x - 16, checked.y + 16) <= boundaryLeft))) {
		inView = 1;
	}	
}

return 1;