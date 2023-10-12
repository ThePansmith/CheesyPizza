function safe_get(inst, variable)
{
	if instance_exists(inst)
		return variable_instance_get(inst, variable);
	return undefined;
}
