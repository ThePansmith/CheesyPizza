close_menu();
with obj_player1
	visible = true;
	
surface_free(surface);
vertex_format_delete(vertex_format);
vertex_delete_buffer(vertex_buffer);
vertex_delete_buffer(pizza_vbuffer);
