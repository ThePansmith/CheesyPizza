if (other.team == 1 && instance_exists(baddieID) && baddieID.parryable && baddieID.state != states.grabbed && baddieID.state != states.hit && !baddieID.invincible && baddieID.instantkillable)
{
	fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y);
	if (!baddieID.important)
	{
		global.style += 5 + floor(global.combo / heat_nerf);
		global.combotime = 60;
		global.heattime = 60;
	}
	if (!baddieID.elite || baddieID.elitehit <= 0)
	{
		if (baddieID.destroyable)
		{
			notification_push(notifs.baddie_hurtboxkill, [room, baddieID.object_index, baddieID, other.object_index]);
			instance_destroy(baddieID);
			instance_destroy();
		}
	}
	else
	{
		var lag = 2;
		baddieID.hitLag = lag;
		baddieID.hitX = baddieID.x;
		baddieID.hitY = baddieID.y;
		baddieID.hp -= 1;
		instance_create(baddieID.x, baddieID.y, obj_parryeffect);
		baddieID.alarm[3] = 3;
		baddieID.state = states.hit;
		baddieID.image_xscale = -other.image_xscale;
		create_slapstar(x, y);
		create_slapstar(x, y);
		create_slapstar(x, y);
		create_baddiegibs(x, y);
		create_baddiegibs(x, y);
		create_baddiegibs(x, y);
		with (obj_camera)
		{
			shake_mag = 3;
			shake_mag_acc = 3 / room_speed;
		}
		baddieID.hitvsp = -4;
		baddieID.hithsp = other.image_xscale * 10;
	}
}
