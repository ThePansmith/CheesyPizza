if !variable_instance_exists(id, "shellSurface")
	exit;

if surface_exists(shellSurface)
	surface_free(shellSurface);
if ds_exists(deferredQueue, ds_type_queue)
	ds_queue_destroy(deferredQueue);
if ds_exists(WC_builtins, ds_type_map)
	ds_map_destroy(WC_builtins);
