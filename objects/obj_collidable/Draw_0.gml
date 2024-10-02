/// @desc TEMPORARY

collision_mask.draw(x, y, colliding ? c_red : c_white);

if (colliding) {
	draw_text(16, 16, "Colliding!");
}