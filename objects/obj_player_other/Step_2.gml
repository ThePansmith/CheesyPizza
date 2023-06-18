/// @description Slope rotation

/*
	the idea is to guess what state the player is in using the sprites
	and then run the normal player code.
*/

state = states.normal;
if check_sprite("knight") && (check_sprite("slope") or check_sprite("charge") or check_sprite("slide"))
	state = states.knightpepslopes;
if (check_sprite("Sjump") && (check_sprite("start") or check_sprite("move")))
or (check_sprite("superjump") && (check_sprite("prep") or check_sprite("left") or check_sprite("right")))
	state = states.Sjumpprep;
if check_sprite("taunt")
	state = states.backbreaker;

event_perform_object(obj_player, ev_step, ev_step_end);
