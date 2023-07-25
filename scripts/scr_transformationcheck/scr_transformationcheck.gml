function scr_transformationcheck()
{
	return (state != states.actor && state != states.tube) || array_contains(transformation, state);
}
