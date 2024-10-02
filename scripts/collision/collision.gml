/**
 * A part of the larger collision mask
 */
function CollisionPart() constructor {
	static check_collision = function(_x, _y) {
		return true;
	}
	
	static draw = function(_x, _y) { }
}

/**
 * Function A square that is part of the collision mask
 * @param {Real} _x1 Left x relative to the instance who has this as a part of the collision mask
 * @param {Real} _y1 Top y relative to the instance who has this as a part of the collision mask
 * @param {Real} _x2 Right x relative to the instance who has this as a part of the collision mask
 * @param {Real} _y2 Bottom y relative to the instance who has this as a part of the collision mask
 */
function CollisionPartRectangle(_x1, _y1, _x2, _y2) : CollisionPart() constructor {
	x1 = _x1;
	y1 = _y1;
	x2 = _x2;
	y2 = _y2;
	
	static check_collision = function(_x, _y) {
		return collision_rectangle(_x + x1, _y + y1, _x + x2, _y + y2, obj_solid, false, true);
		// TODO: add tile collision and more complex slope collision
	}
	
	static draw = function(_x, _y, _color) {
		draw_rectangle_color(_x + x1, _y + y1, _x + x2, _y + y2, _color, _color, _color, _color, true);
	}
}

/**
 * Function A circle that is part of the collision mask
 * @param {Real} _x Center x relative to the instance who has this as a part of the collision mask
 * @param {Real} _y Center y relative to the instance who has this as a part of the collision mask
 * @param {Real} _radius Radius
 */
function CollisionPartCircle(_x, _y, _radius) : CollisionPart() constructor {
	x = _x;
	y = _y;
	radius = _radius;
	
	static check_collision = function(_x, _y) {
		return collision_circle(_x + x, _y + y, radius, obj_solid, false, true);
		// TODO: add tile collision and more complex slope collision
	}
	
	static draw = function(_x, _y, _color) {
		draw_circle_color(_x + x, _y + y, radius, _color, _color, true);
	}
}

/**
 * Defines the complex mask for an instance, made of mask parts
 * @param {Array<Struct.CollisionPart>} _mask_parts Array of parts of the collision mask
 */
function CollisionMask(_mask_parts) constructor {
	mask_parts = _mask_parts;
	
	static check_collision = function(_x, _y) {
		for (var _i = 0; _i < array_length(mask_parts); _i ++) {
			if (mask_parts[_i].check_collision(_x, _y)) return true;
		}
	}
	
	static draw = function(_x, _y, _color) {
		for (var _i = 0; _i < array_length(mask_parts); _i ++) {
			mask_parts[_i].draw(_x, _y, _color);
		}
	}
}