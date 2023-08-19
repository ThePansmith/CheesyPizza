if in_saveroom()
	instance_destroy(id, false);
with instance_place(x, y, obj_bigcollect)
	instance_destroy(id, false);
if place_meeting(x, y, obj_secretportal)
	instance_destroy(id, false);
