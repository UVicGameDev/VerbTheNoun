package games.missTheMissile.windows 
{
	import core.ui.windows.sub.PlayWindowBase;
	import flash.geom.Rectangle;
	import games.missTheMissile.arena.Arena;
	import games.missTheMissile.entities.MissTheMissileEntity;
	import games.missTheMissile.entities.Player;
	import games.missTheMissile.spawners.AsteroidSpawner;
	import games.missTheMissile.spawners.MisisleLauncher;
	import games.missTheMissile.util.camera.BoundedCamera;
	import games.missTheMissile.util.camera.Camera;
	import games.missTheMissile.util.camera.EntityCamera;
	import games.missTheMissile.util.camera.FPCamera;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class PlayWindow extends PlayWindowBase 
	{
		public var	player:Player,
					arena:Arena,
					arenaCam:Camera;
					
		private var	launcher:MisisleLauncher,
					asteroidSpawner:AsteroidSpawner;
		
		public function PlayWindow() 
		{
			super();
			
			arena = new Arena(FP.width * 2, FP.height * 2);
			
			player = new Player(FP.halfWidth, FP.halfHeight, arena);
			world.add(player);
			
			arenaCam = new BoundedCamera(
							new Rectangle(0, 0, arena.width, arena.height),
							new EntityCamera(
								player,
								new FPCamera));
			
			launcher		= new MisisleLauncher(this);
			asteroidSpawner	= new AsteroidSpawner(this);
		}
		
		override public function update():void 
		{
			super.update();
			
			launcher.update();
			arenaCam.update();
			
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