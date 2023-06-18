function sh_drag()
{
	if !WC_debug
		return "You do not have permission to use this command";
	
	WC_drag_toggle = !WC_drag_toggle;
	if !isOpen
		create_transformation_tip("{s}Dragging " + (WC_drag_toggle ? "ON" : "OFF") + "/");
	else
		return "Dragging objects " + (WC_drag_toggle ? "ON" : "OFF");
}
function meta_drag()
{
	return {
		description: "toggles being able to drag stuff around",
	}
}
