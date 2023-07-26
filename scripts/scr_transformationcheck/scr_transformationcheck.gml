function scr_transformationcheck()
{
	return !array_contains(transformation, state) or (state == states.actor or state == states.tube);
}
