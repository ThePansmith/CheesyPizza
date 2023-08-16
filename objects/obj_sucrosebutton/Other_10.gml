if (currentState == ButtonState.RELEASED)
{
	currentState = ButtonState.PRESSING;
	sprite_index = spr_Lowering;
	if save_trigger && !in_saveroom()
		add_saveroom();
}
