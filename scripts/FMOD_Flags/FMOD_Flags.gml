#macro FMOD_INVALID_HANDLE -1

enum FMOD_INIT_FLAGS
{
	// Use defaults for all initialization options.
	NORMAL					= 0x00000000,
	// Enable live update.
	LIVEUPDATE				= 0x00000001,
	// Load banks even if they reference plugins that have not been loaded.
	ALLOW_MISSING_PLUGINS	= 0x00000002,
	// Disable asynchronous processing and perform all processing on the calling thread instead.
	SYNCHRONOUS_UPDATE		= 0x00000004,
	// Defer timeline callbacks until the main update.
	DEFERRED_CALLBACKS		= 0x00000008,
	// No additional threads are created for bank and resource loading. 
	LOAD_FROM_UPDATE		= 0x00000010,
	// Enables detailed memory usage statistics. Increases memory footprint and impacts performance.
	MEMORY_TRACKING			= 0x00000020,	
}

enum FMOD_EVENTINSTANCE_STOPMODE
{
	ALLOWFADEOUT,
	IMMEDIATE
}