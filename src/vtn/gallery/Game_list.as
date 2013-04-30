package vtn.gallery
{
	import games.dialThePhone.DialThePhone;
	import games.missTheMissile.MissTheMissile;
	import HeartTheBeets.HeartTheBeetsWorld;
	import HeartTheBeets.Cloud;
	import net.flashpunk.World;
	import vtn.gallery.test.TestWorld;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class Game_list 
	{
		public var game_list:Array;
		
		//Embedd Game selectable 
		[Embed(source = '/assets/game_standin_red.png')] private const REDSTANDIN:Class;
		[Embed(source = '/assets/game_standin_green.png')] private const GREENSTANDIN:Class;
		[Embed(source = '/assets/game_standin_yellow.png')] private const YELLOWSTANDIN:Class;
		[Embed(source = '/assets/game_standin_blue.png')] private const BLUESTANDIN:Class;
		[Embed(source = '/assets/game_standin_violet.png')] private const VIOLETSTANDIN:Class;
		[Embed(source = '/HeartTheBeets/HTB_assets/Cloud.png')] public const CLOUD:Class;
		
		public function Game_list() 
		{
			game_list = new Array();
			game_list.push((new GamePortal(function():World { return new MissTheMissile; }, REDSTANDIN)));
			game_list.push((new GamePortal(function():World { return new HeartTheBeetsWorld; }, CLOUD)));
			game_list.push((new GamePortal(function():World { return new DialThePhone; }, YELLOWSTANDIN)));
			game_list.push((new GamePortal(function():World {return new TestWorld(BLUESTANDIN)}, BLUESTANDIN)));
			game_list.push((new GamePortal(function():World {return new TestWorld(VIOLETSTANDIN)}, VIOLETSTANDIN)));
		}	
	}

}