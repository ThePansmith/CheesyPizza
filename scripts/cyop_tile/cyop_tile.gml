/// @param {real}	_world_x	Where in the world to draw it (X)
/// @param {real}	_world_y	Where in the world to draw it (Y)
/// @param {real}	_tm_x		Where does the tile exist on the tilemap? (X)
/// @param {real}	_tm_y		Where does the tile exist on the tilemap? (Y)
function cyop_tile(_world_x, _world_y, _tm_x, _tm_y) constructor
{
	x = _world_x;
	y = _world_y;
	tilemap_x = _tm_x;
	tilemap_y = _tm_y;
}