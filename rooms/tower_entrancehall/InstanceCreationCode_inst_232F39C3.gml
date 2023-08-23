if global.panic
{
	instance_destroy(id, false);
	exit;
}

//depth = -1000;
xScale = 32;
yScale = 32;
zScale = 32;
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_color();
vertex_format_add_texcoord();
format =  vertex_format_end();
//format = rx_obj_CreateVertexTextureFormat(); // temp
var parserHint = rx_obj_parserhint.ignore_none;
parserHint = enum_set_flag(parserHint, rx_obj_parserhint.ignore_normal_list);
parserHint = enum_set_flag(parserHint, rx_obj_parserhint.ignore_texcoord_list);

model = mdl_Load_OBJ_Model_File("data/model/radix.obj", format, parserHint, true);
