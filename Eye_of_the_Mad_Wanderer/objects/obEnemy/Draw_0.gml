/// @description Insert description here
// You can write your code in this editor

//Draw View Cone
draw_set_alpha(0.2);

draw_set_color(c_white);
draw_primitive_begin(pr_trianglestrip);
draw_vertex(x,y);
draw_vertex(x+lengthdir_x(sightDistance,detectionDir+(fov / 2)),y+lengthdir_y(sightDistance,detectionDir+(fov / 2)));
draw_vertex(x+lengthdir_x(sightDistance,detectionDir-(fov / 2)),y+lengthdir_y(sightDistance,detectionDir-(fov / 2)));
draw_vertex(x,y);
draw_primitive_end();

draw_circle(x, y, 16, 0);

if (detect > 0) {
	draw_set_alpha(0.75*detect);
	
	draw_set_color(c_maroon);
	draw_primitive_begin(pr_trianglestrip);
	draw_vertex(x,y);
	draw_vertex(x+lengthdir_x(sightDistance,detectionDir+(fov / 2)),y+lengthdir_y(sightDistance,detectionDir+(fov / 2)));
	draw_vertex(x+lengthdir_x(sightDistance,detectionDir-(fov / 2)),y+lengthdir_y(sightDistance,detectionDir-(fov / 2)));
	draw_vertex(x,y);
	draw_primitive_end();
}

draw_set_alpha(1);

// Draw Self
draw_self();