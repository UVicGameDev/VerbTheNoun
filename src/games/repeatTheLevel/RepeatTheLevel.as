package games.repeatTheLevel 
{
	import core.games.Game;
	import core.games.GameInfo;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class RepeatTheLevel extends Game 
	{
		[Embed(source = '/assets/game_standin_violet.png')] private const THUMBNAIL:Class;
		
		override protected function createGameWorld():World 
		{
			return new MantraGameWorld;
		}
		
		override public function get info():GameInfo 
		{
			return GameInfo.description
					.thumbnail(THUMBNAIL)
					.finish();
		}
	}

}