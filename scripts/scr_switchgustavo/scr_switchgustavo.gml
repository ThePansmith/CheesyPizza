function scr_switchgustavo()
{
    with (obj_player1)
    {
        visible = true
        ratmount_movespeed = 8
        gustavodash = false
        isgustavo = true;
        state = states.ratmount
        jumpAnim = false;
        sprite_index = spr_ratmount_idle;
        brick = true;
        fmod_event_instance_release(snd_voiceok)
        player_destroy_sounds();
		player_init_sounds();
    }
}

function scr_switchpeppino()
{
    with (obj_player1)
    {
		visible = true;
		gustavodash = 0;
		ratmount_movespeed = 8;
		isgustavo = false;
		state = states.normal;
		jumpAnim = false;
		sprite_index = spr_idle;
		brick = false;
	    player_destroy_sounds();
		player_init_sounds();
    }
}
