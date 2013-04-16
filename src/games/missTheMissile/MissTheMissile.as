package games.missTheMissile 
{
	import core.Debug;
	import core.Game;
	import core.Random;
	import games.missTheMissile.entities.Asteroid;
	import games.missTheMissile.entities.Missile;
	import games.missTheMissile.entities.MissTheMissileEntity;
	import games.missTheMissile.entities.Player;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MissTheMissile extends Game 
	{
		public var player:Player;
		private var launcher:MisisleLauncher;
		
		public function MissTheMissile() 
		{
			if (Debug.isEnabled) addGraphic(new Text("Miss the Missile"));
			
			player = new Player(FP.halfWidth, FP.halfHeight);
			add(player);
			createNextAsteroid();
			
			launcher = new MisisleLauncher(this);
		}
		
		override public function update():void 
		{
			super.update();
			launcher.update();
			
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
		
		public function asteroidDestroyed(asteroid:Asteroid):void {
			
			remove(asteroid);
			createNextAsteroid();
		}
		
		private function createNextAsteroid():void {
			
			var asteroid:Asteroid = new Asteroid(this, 0, 0);
			add(asteroid);
		}
	}

}