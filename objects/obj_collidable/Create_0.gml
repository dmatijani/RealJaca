/// @desc TEMPORARY

collision_mask = new CollisionMask(
	[
		new CollisionPartCircle(0, -32, 32),
		new CollisionPartRectangle(-32, -32, 32, 32),
		new CollisionPartCircle(0, 32, 32)
	]
);

colliding = false;