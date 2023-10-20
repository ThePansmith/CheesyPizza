while ds_queue_size(queue) >= distance
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
	x : target_object.x, 
	y : target_object.y, 
	sprite_index : target_object.sprite_index,
	image_index : target_object.image_index,
	image_xscale : target_object == obj_player1 ? target_object.xscale : target_object.image_xscale,
	room : room,
	visible : target_object.visible
});

if grace_period > 0
	grace_period--;

layer_4_index = (layer_4_index + 0.1) % sprite_get_number(spr_cosmicclone_layer4);
for (var i = 0; i < 3; i++)
{
	var index = i * 2;
	layer_offsets[index] = (layer_offsets[index] + ((i + 1) / 4)) % 64; 
}
