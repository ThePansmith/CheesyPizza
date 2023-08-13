if global.replayrecord
	replay_record_end();

global.gameframe_caption_text = "You did it! Pizza Tower!";
with obj_endlevelfade
{
	if sugary
		global.gameframe_caption_text = "You did it! Sugary Spire!";
}
