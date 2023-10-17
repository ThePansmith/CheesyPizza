/// @param {real}	_world_x	Where in the world to draw it (X)
/// @param {real}	_world_y	Where in the world to draw it (Y)
/// @param {real}	_tm_x		Where does the tile exist on the tilemap? (X)
/// @param {real}	_tm_y		Where does the tile exist on the tilemap? (Y)
/// @param {GMAsset}	_sprite		The source tilemap sprite
/// @param {real}		_subimage	The source tilemap sprite subimage
/// @param {real}		_tilesize_x		Width of each tile
/// @param {real}		_tilesize_y		Height of each tile
function cyop_tile(_world_x, _world_y, _tm_x, _tm_y, _sprite, _subimage, _tilesize_x, _tilesize_y) constructor
{
	x = _world_x;
	y = _world_y;
	tm_x = _tm_x;
	tm_y = _tm_y;
	sprite = _sprite;
	subimage = _subimage;
	size_x = _tilesize_x;
	size_y = _tilesize_y;
	scale_x = 32 / size_x;
	scale_y = 32 / size_y;
}
