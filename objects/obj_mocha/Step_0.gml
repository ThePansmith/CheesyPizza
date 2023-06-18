if (distance_to_object(obj_player1) <= 350 && !sparkleactive && shiny)
	sparkleactive = true;

if (sparkleactive  && sprite_get_number(spr_shinysparkle) >= sparkleindex)
	sparkleindex += 2;