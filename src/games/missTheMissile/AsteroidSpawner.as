package games.missTheMissile 
{
	import core.Random;
	import games.missTheMissile.entities.Asteroid;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author beyamor
	 */
	public class AsteroidSpawner 
	{
		private static const BOUNDARY:Number = 100;
		
		private var mtm:MissTheMissile;
		
		public function AsteroidSpawner(mtm:MissTheMissile)
		{
			this.mtm = mtm;
			
			spawnNextAsteroid();
		}
		
		private function spawnNextAsteroid():void {
			
			// Copying this wholesale from MissileLauncher. Consider moving it into something.
			var x:Number, y:Number;
			
			switch (Random.any(["left", "right", "top", "bottom"])) {
				
				case "left":
					x = -BOUNDARY;
					y = Random.inRange(0, FP.height);
					break;
					
				case "right":
					x = FP.width + BOUNDARY;
					y = Random.inRange(0, FP.height);
					break;
					
				case "top":
					x = Random.inRange(0, FP.width);
					y = -BOUNDARY;
					break;
					
				case "bottom":
					x = Random.inRange(0, FP.width);
					y = FP.height + BOUNDARY;
					break;
			}
			
			var asteroid:Asteroid = new Asteroid(this, x, y);
			mtm.add(asteroid);
		}
		
		public function asteroidDestroid(asteroid:Asteroid):void {
			
			mtm.remove(asteroid);
			spawnNextAsteroid();
		}
	}

}