package  
{
	import HeartTheBeets.HeartTheBeetsWorld;
	import net.flashpunk.World;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class Game_list 
	{
		public var game_list:Array;
		
		//Embedd Game selectable 
		[Embed(source = 'HeartTheBeets/HTB_assets/Cloud.png')] private const HTB:Class;
		[Embed(source = 'assets/game_standin_green.png')] private const GREENSTANDIN:Class;
		[Embed(source = 'assets/game_standin_yellow.png')] private const YELLOWSTANDIN:Class;
		[Embed(source = 'assets/game_standin_blue.png')] private const BLUESTANDIN:Class;
		[Embed(source = 'assets/game_standin_violet.png')] private const VIOLETSTANDIN:Class;
		
		public function Game_list() 
		{
			game_list = new Array();
			game_list.push((new GamePortal(function():World {return new HeartTheBeetsWorld()}, HTB)));
			game_list.push((new GamePortal(function():World {return new TestWorld(GREENSTANDIN)}, GREENSTANDIN)));
			game_list.push((new GamePortal(function():World {return new TestWorld(YELLOWSTANDIN)}, YELLOWSTANDIN)));
			game_list.push((new GamePortal(function():World {return new TestWorld(BLUESTANDIN)}, BLUESTANDIN)));
			game_list.push((new GamePortal(function():World {return new TestWorld(VIOLETSTANDIN)}, VIOLETSTANDIN)));
		}	
	}

}