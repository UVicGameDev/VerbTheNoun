package games.missTheMissile 
{
	import core.games.Game;
	import core.games.GameInfo;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MissTheMissile extends Game 
	{
		[Embed(source = '/assets/game_standin_red.png')] private const THUMBNAIL:Class;
		
		override protected function createGameWorld():World 
		{
			return new MissTheMissileWorld(this);
		}
		
		override public function get info():GameInfo 
		{
			return GameInfo.description
					.thumbnail(THUMBNAIL)
					.finish();
		}
	}

}