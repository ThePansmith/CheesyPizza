if (ds_queue_size(queue) == 60)
{
	var struct = ds_queue_dequeue(queue);
	x = struct.x;
	y = struct.y;
	sprite_index = struct.sprite_index;
	image_index = struct.image_index;
	image_xscale = struct.image_xscale;
	visible = struct.visible;
	
	curr_state = struct;
}


ds_queue_enqueue(queue, 
	{
		x: target_object.x, 
		y : target_object.y, 
		sprite_index : target_object.sprite_index,
		image_index : target_object.image_index,
		image_xscale : target_object == obj_player1 ? target_object.xscale : target_object.image_xscale,
		room : room,
		visible : target_object.visible
	});

if grace_period > 0
	grace_period--