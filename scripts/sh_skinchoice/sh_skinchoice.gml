function sh_skin()
{
	if !WC_debug
		return "You do not have permission to use this command";
	
	isOpen = false;
	instance_create(0, 0, obj_skinchoice);
}
function meta_skin()
{
	return {
		description: "opens palette menu",
	}
}
