function safe_get(inst, variable)
{
	if inst == global
	{
		if variable_global_exists(variable)
			return variable_global_get(variable);
		return undefined;
	}
	if instance_exists(inst) && variable_instance_exists(inst, variable)
		return variable_instance_get(inst, variable);
	return undefined;
}
