image_angle++;

if (image_angle >= 360)
	image_angle = 0;

var angle = image_angle * (pi / 180);

TL_x = x;
TL_y = y;
var rotated_TL = point_rotate(TL_x, TL_y, angle, x + 16 * image_xscale, y + 16 * image_yscale);
TL_x = rotated_TL[0];
TL_y = rotated_TL[1];


TR_x = x + 32 * image_xscale;
TR_y = y;
var rotated_TR = point_rotate(TR_x, TR_y, angle, x + 16 * image_xscale, y + 16 * image_yscale);
TR_x = rotated_TR[0];
TR_y = rotated_TR[1];


BR_x = x + 32 * image_xscale;
BR_y = y + 32 * image_yscale;
var rotated_BR = point_rotate(BR_x, BR_y, angle, x + 16 * image_xscale, y + 16 * image_yscale);
BR_x = rotated_BR[0];
BR_y = rotated_BR[1];

BL_x = x;
BL_y = y + 32 * image_yscale;
var rotated_BL = point_rotate(BL_x, BL_y, angle, x + 16 * image_xscale, y + 16 * image_yscale);
BL_x = rotated_BL[0];
BL_y = rotated_BL[1];