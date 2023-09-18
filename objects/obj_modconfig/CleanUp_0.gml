live_auto_call;

surface_free(global.modsurf);
if layer_exists(sequence_layer)
	layer_destroy(sequence_layer);

delete tv_bg;
destroy_sounds([machsnd]);
