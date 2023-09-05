//live_auto_call;

surface_free(global.modsurf);
if layer_exists(sequence_layer)
	layer_destroy(sequence_layer);

surface_free(tv_bg.surf);
delete tv_bg;
