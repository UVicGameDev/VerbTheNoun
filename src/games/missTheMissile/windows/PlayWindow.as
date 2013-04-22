package games.missTheMissile.windows 
{
	import core.Dimensions;
	import core.ui.windows.sub.PlayWindowBase;
	import core.ui.windows.sub.Popup;
	import core.util.camera.BoundedCamera;
	import core.util.camera.EntityCamera;
	import core.util.camera.FPCamera;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import games.missTheMissile.arena.Arena;
	import games.missTheMissile.arena.StarView;
	import games.missTheMissile.entities.MissTheMissileEntity;
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
					
		private var	launcher:MisisleLauncher,
					asteroidSpawner:AsteroidSpawner,
					starViews:Vector.<StarView>			= new Vector.<StarView>
		
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
			
			launcher		= new MisisleLauncher(this, alertScreen, gameData);
			asteroidSpawner	= new AsteroidSpawner(this);
			
			for (var distance:uint = 1; distance <= 4; ++distance) {
				
				starViews.push(new StarView(arena, camera, distance));
			}
			
			clearColor = 0;
		}
		
		override public function update():void 
		{
			super.update();
			
			for each (var starView:StarView in starViews) starView.update();
			
			launcher.update();
			
			checkCollisions();
		}
		
		override public function render():void 
		{			
			clearBuffer();
			
			for each (var starView:StarView in starViews) {
				
				starView.render();
				buffer.copyPixels(
					starView.buffer,
					new Rectangle(0, 0, width, height),
					new Point(0, 0),
					starView.buffer, null, true);
			}
			
			view.render();
			
			parent.buffer.copyPixels(
				buffer,
				new Rectangle(0, 0, width, height),
				new Point(x, y));
		}
		
		private function checkCollisions():void {
			
			var mtmEntities:Vector.<MissTheMissileEntity> = new Vector.<MissTheMissileEntity>;
			view.getClass(MissTheMissileEntity, mtmEntities);
			
			for (var firstIndex:uint = 0; firstIndex < mtmEntities.length; ++firstIndex) {
				for (var secondIndex:uint = firstIndex + 1; secondIndex < mtmEntities.length; ++secondIndex) {
					
					var	first:MissTheMissileEntity	= mtmEntities[firstIndex],
						second:MissTheMissileEntity	= mtmEntities[secondIndex];
						
					if (first.collideWith(second, first.x, first.y)) {
						
						first.collided(second);
						second.collided(first);
					}
				}
			}
		}
	}

}