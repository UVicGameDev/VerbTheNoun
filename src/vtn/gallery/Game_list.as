package vtn.gallery
{
	import core.games.Game;
	import games.dialThePhone.DialThePhone;
	import games.missTheMissile.MissTheMissile;
	import games.missTheMissile.MissTheMissileWorld;
	import HeartTheBeets.HeartTheBeetsWorld;
	import HeartTheBeets.Cloud;
	import net.flashpunk.World;
	import vtn.gallery.test.TestWorld;
	import games.repeatTheLevel.MantraGameWorld;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class Game_list 
	{
		public var game_list:Vector.<GamePortal>;
		
		//Embedd Game selectable 
		[Embed(source = '/assets/game_standin_red.png')] private const REDSTANDIN:Class;
		[Embed(source = '/assets/game_standin_green.png')] private const GREENSTANDIN:Class;
		[Embed(source = '/assets/game_standin_yellow.png')] private const YELLOWSTANDIN:Class;
		[Embed(source = '/assets/game_standin_blue.png')] private const BLUESTANDIN:Class;
		[Embed(source = '/assets/game_standin_violet.png')] private const VIOLETSTANDIN:Class;
		[Embed(source = '/HeartTheBeets/HTB_assets/Cloud.png')] public const CLOUD:Class;
		
		public function Game_list() 
		{
			var allGames:Vector.<Class> = new <Class>[
				MissTheMissile
			];
			
			game_list = new Vector.<GamePortal>;
			for each (var gameClass:Class in allGames) game_list.push(new GamePortal(new gameClass));
			
			/*game_list.push((new GamePortal(function():World { return new HeartTheBeetsWorld; }, CLOUD)));
			game_list.push((new GamePortal(function():World { return new DialThePhone; }, YELLOWSTANDIN)));
			game_list.push((new GamePortal(function():World { return new MantraGameWorld; }, GREENSTANDIN)));
			game_list.push((new GamePortal(function():World {return new TestWorld(VIOLETSTANDIN)}, VIOLETSTANDIN)));*/
		}	
	}

}