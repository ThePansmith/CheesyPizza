if (global.timeattack == 1)
	instance_destroy();
if in_saveroom()
	instance_destroy();

if (content == obj_pizzakinshroom && global.shroomfollow)
	instance_destroy();
if (content == obj_pizzakincheese && global.cheesefollow)
	instance_destroy();
if (content == obj_pizzakintomato && global.tomatofollow)
	instance_destroy();
if (content == obj_pizzakinsausage && global.sausagefollow)
	instance_destroy();
if (content == obj_pizzakinpineapple && global.pineapplefollow)
	instance_destroy();

if global.snickchallenge
	instance_destroy(id, false);

if content == obj_bigcollect
{
	instance_change(obj_bigcollect, false);
	event_perform_object(obj_bigcollect, ev_create, 0);
}
