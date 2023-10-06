/// @description save and free memory
save_servers();

if surface_exists(surfclip)
	surface_free(surfclip);
if surface_exists(surffinal)
	surface_free(surffinal);
ds_map_destroy(textboxes);
