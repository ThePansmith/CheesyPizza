/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for portal_activate

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2273
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2776
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|31_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2549
*/
function anon_gml_RoomCC_molasses_6_5_Create_12_gml_RoomCC_molasses_6_5_Create() //anon_gml_RoomCC_molasses_6_5_Create_12_gml_RoomCC_molasses_6_5_Create
{
    return (place_meeting(x, y, obj_player) && obj_player.state == (75 << 0));
}

function anon_gml_RoomCC_molasses_6_5_Create_124_gml_RoomCC_molasses_6_5_Create() //anon_gml_RoomCC_molasses_6_5_Create_124_gml_RoomCC_molasses_6_5_Create
{
    portal_activate(104280, 1)
    with (104078)
    {
        y = (ystart + 32)
        if (!(ds_list_find_index(other.flags.saveroom, other.id) != -1))
        {
            camera_shake(20, 40)
            scr_sound(82, 83)
            scr_sound(58)
            with (instance_place(x, (ystart - 1), obj_player))
                y = (other.y - 46)
        }
    }
    var lay_id = layer_get_id("Tiles_6")
    layer_y(lay_id, 32)
}

