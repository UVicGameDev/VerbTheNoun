package games.missTheMissile.windows 
{
	import core.Dimensions;
	import core.ui.windows.sub.PlayWindowBase;
	import core.util.camera.BoundedCamera;
	import core.util.camera.EntityCamera;
	import core.util.camera.FPCamera;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import games.missTheMissile.arena.Arena;
	import games.missTheMissile.arena.StarView;
	import games.missTheMissile.entities.SpaceEntity;
	import games.missTheMissile.entities.Player;
	import games.missTheMissile.GameData;
	import games.missTheMissile.MissTheMissile;
	import games.missTheMissile.spawners.AsteroidSpawner;
	import games.missTheMissile.spawners.MisisleLauncher;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class PlayWindow extends PlayWindowBase 
	{
		public var	player:Player,
					arena:Arena;
					
		private var	starViews:Vector.<StarView>			= new Vector.<StarView>
		
		public function PlayWindow(gameData:GameData, alertScreen:AlertScreen) 
		{
			super();
			
			arena = new Arena(FP.width * 2, FP.height * 2);
			
			player = new Player(Dimensions.halfWidth(arena), Dimensions.halfHeight(arena), gameData, arena);
			view.add(player);
			
			camera = new BoundedCamera(
							new Rectangle(0, 0, arena.width, arena.height),
							new EntityCamera(
								player,
								camera));
			
			updateables.add(new MisisleLauncher(this, alertScreen, gameData));
			new AsteroidSpawner(this);
			
			for (var distance:uint = 1; distance <= 4; ++distance) {
				
				var starView:StarView = new StarView(arena, camera, distance);
				updateables.add(starView);
				starViews.push(starView);
			}
			
			clearColor = 0;
		}
		
		override public function render():void 
		{			
			clearBuffer();
			
			for each (var starView:StarView in starViews) {
				
				starView.renderTo(buffer);
			}
			
			view.renderTo(parent.buffer, position);
		}
	}

}