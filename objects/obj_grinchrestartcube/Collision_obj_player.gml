if other.cutscene exit;

var rm = global.leveltorestart;
global.levelattempts++;

ds_list_clear(global.saveroom);
ds_list_clear(global.baddieroom);
ds_list_clear(global.debris_list);
ds_list_clear(global.collect_list);

instance_destroy(obj_fadeout);

global.levelreset = false;
scr_playerreset(true);
global.levelreset = true;

other.targetDoor = "A";
other.targetRoom = rm;
scr_room_goto(rm);
