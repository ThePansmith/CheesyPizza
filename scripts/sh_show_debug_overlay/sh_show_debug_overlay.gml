function sh_show_debug_overlay()
{
	WC_debugoverlay = !WC_debugoverlay;
	show_debug_overlay(WC_debugoverlay);
	return $"Debug overlay {WC_debugoverlay ? "ON" : "OFF"}";
}
function meta_show_debug_overlay()
{
	return
	{
		description: "toggles debug overlay"
	}
}
