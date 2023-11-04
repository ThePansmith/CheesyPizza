global.roommessage = "SAGE";

global.collect = 0;
ds_list_clear(global.saveroom);
ds_list_clear(global.baddieroom);
global.prank_enemykilled = false;
global.prank_cankillenemy = true;
global.combodropped = false;
global.combo = 0;
global.combotime = 0;
global.comboscore = 0;
global.previouscombo = 0;
global.style = 0;
global.stylethreshold = 0;
global.heattime = 0;
with obj_player
	supercharged = false;
