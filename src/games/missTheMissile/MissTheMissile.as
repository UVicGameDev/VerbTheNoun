package games.missTheMissile 
{
	import core.Debug;
	import core.Game;
	import core.Random;
	import flash.geom.Rectangle;
	import games.missTheMissile.arena.Arena;
	import games.missTheMissile.entities.Asteroid;
	import games.missTheMissile.entities.Missile;
	import games.missTheMissile.entities.MissTheMissileEntity;
	import games.missTheMissile.entities.Player;
	import games.missTheMissile.ui.windows.PauseWindow;
	import games.missTheMissile.util.camera.BoundedCamera;
	import games.missTheMissile.util.camera.Camera;
	import games.missTheMissile.util.camera.EntityCamera;
	import games.missTheMissile.util.camera.FPCamera;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MissTheMissile extends Game 
	{
		public var	player:Player,
					arena:Arena,
					arenaCam:Camera;
					
		private var	launcher:MisisleLauncher,
					asteroidSpawner:AsteroidSpawner;
		
		public function MissTheMissile() 
		{
			if (Debug.isEnabled) addGraphic(new Text("Miss the Missile"));
			
			arena = new Arena(FP.width * 2, FP.height * 2);
			
			player = new Player(FP.halfWidth, FP.halfHeight, arena);
			add(player);
			
			arenaCam = new BoundedCamera(
							new Rectangle(0, 0, arena.width, arena.height),
							new EntityCamera(
								player,
								new FPCamera));
			
			launcher		= new MisisleLauncher(this);
			asteroidSpawner	= new AsteroidSpawner(this);
			
			windows.push(new PauseWindow);
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
			getClass(MissTheMissileEntity, mtmEntities);
			
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