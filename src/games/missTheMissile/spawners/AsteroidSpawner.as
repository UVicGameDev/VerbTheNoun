package games.missTheMissile.spawners 
{
	import core.Random;
	import flash.geom.Point;
	import games.missTheMissile.arena.BoundaryPositioner;
	import games.missTheMissile.entities.Asteroid;
	import games.missTheMissile.MissTheMissile;
	import games.missTheMissile.windows.PlayWindow;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author beyamor
	 */
	public class AsteroidSpawner 
	{
		private static const BOUNDARY:Number = 100;
		
		private var	mtm:PlayWindow,
					positioner:BoundaryPositioner;
		
		public function AsteroidSpawner(mtm:PlayWindow)
		{
			this.mtm = mtm;
			positioner = new BoundaryPositioner(mtm.arena, BOUNDARY);
			
			spawnNextAsteroid();
		}
		
		private function spawnNextAsteroid():void {
			
			var position:Point = positioner.getNextPosition();
			
			var asteroid:Asteroid = new Asteroid(this, position.x, position.y);
			mtm.view.add(asteroid);
		}
		
		public function asteroidDestroid(asteroid:Asteroid):void {
			
			mtm.view.remove(asteroid);
			spawnNextAsteroid();
		}
	}

}