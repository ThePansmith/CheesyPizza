if instance_exists(obj_keyconfig)
	exit;

reset_blendmode();
reset_shader_fix();

if SUGARY
	scr_pausedraw_ss();
else
	scr_pausedraw();
