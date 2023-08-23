/// @description sugary visited doors
if !sugary
	exit;

if !in_saveroom()
{
	add_saveroom();
	visited = true;
}
else
	visited = true;

if visited
	sprite_index = spr_doorvisited_ss;
