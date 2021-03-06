package games.dialThePhone 
{
	import core.games.Game;
	import core.games.GameInfo;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class DialThePhone extends Game 
	{
		[Embed(source = '/assets/game_standin_yellow.png')] private const THUMBNAIL:Class;
		
		override protected function createGameWorld():World 
		{
			return new DialThePhoneWorld(this);
		}
		
		override public function get info():GameInfo 
		{
			return GameInfo.description
					.thumbnail(THUMBNAIL)
					.finish();
		}
	}

}