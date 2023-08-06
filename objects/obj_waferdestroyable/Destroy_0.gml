if ds_list_find_index(global.saveroom, id) == -1
{
    var rep = 4 + ((sprite_width / 32) - 1);
    repeat rep
        create_debris(x + sprite_width / 2, y + sprite_height / 2, spr_waferdestroyable_debris);
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
    ds_list_add(global.saveroom, id);
}
