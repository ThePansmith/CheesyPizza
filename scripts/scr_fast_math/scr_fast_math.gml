/// ==== LISTEN UP FUCK STICKS ====
/// I know this is going to be leaked eventually 
/// all of this code is copyright of RadixComet
/// Don't steal my fucking code
/// and if you are, at least fucking credit me.

function rectangle_in_rectangle_fast(top1, left1, bottom1, right1, top2, left2, bottom2, right2)
{
	if right1 < left2
		return false;
	if left1 > right2
		return false;
			
	if top1 > bottom2
		return false;
	if bottom1 < top2
		return false;
		
	return rectangle_in_rectangle(left1, top1, right1, bottom1, left2, top2, right2, bottom2);
}
