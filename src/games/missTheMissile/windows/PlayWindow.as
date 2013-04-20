package games.missTheMissile.windows 
{
	import core.ui.windows.sub.PlayWindowBase;
	import core.util.camera.BoundedCamera;
	import core.util.camera.EntityCamera;
	import core.util.camera.FPCamera;
	import flash.geom.Rectangle;
	import games.missTheMissile.arena.Arena;
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
					asteroidSpawner:AsteroidSpawner;
		
		public function PlayWindow(gameData:GameData, alertScreen:AlertScreen) 
		{
			super();
			
			arena = new Arena(FP.width * 2, FP.height * 2);
			
			player = new Player(FP.halfWidth, FP.halfHeight, gameData, arena);
			world.add(player);
			
			camera = new BoundedCamera(
							new Rectangle(0, 0, arena.width, arena.height),
							new EntityCamera(
								player,
								camera));
			
			launcher		= new MisisleLauncher(this, alertScreen);
			asteroidSpawner	= new AsteroidSpawner(this);
			
			clearColor = 0;
		}
		
		override public function update():void 
		{
			super.update();
			
			launcher.update();
			
			checkCollisions();
		}
		
		private function checkCollisions():void {
			
			var mtmEntities:Vector.<MissTheMissileEntity> = new Vector.<MissTheMissileEntity>;
			world.getClass(MissTheMissileEntity, mtmEntities);
			
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