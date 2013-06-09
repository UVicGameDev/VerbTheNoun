package HeartTheBeets 
{
	import core.games.Game;
	import core.games.GameInfo;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class HeartTheBeets extends Game 
	{
		[Embed(source = '/HeartTheBeets/HTB_assets/Cloud.png')] public const CLOUD:Class;
		
		override protected function createGameWorld():World 
		{
			return new HeartTheBeetsWorld;
		}
		
		override public function get info():GameInfo 
		{
			return GameInfo.description
					.thumbnail(CLOUD)
					.finish();
		}
	}

}