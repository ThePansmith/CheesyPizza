if (room == rm_editor)
	exit;
if (global.timeattack == 1)
	instance_destroy();
if in_saveroom()
	instance_destroy();
