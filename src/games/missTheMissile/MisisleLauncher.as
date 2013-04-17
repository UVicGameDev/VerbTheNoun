package games.missTheMissile 
{
	import core.Random;
	import core.util.Timer;
	import games.missTheMissile.entities.Missile;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author beyamor
	 */
	public class MisisleLauncher 
	{
		private static const	TIME_BETWEEN_SHOTS:Number	= 2,
								BOUNDARY:Number				= 100;
		
		private var	mtm:MissTheMissile,
					timer:Timer;
	
		public function MisisleLauncher(mtm:MissTheMissile) 
		{
			this.mtm = mtm;
			
			shootMissile();
			timer = new Timer(TIME_BETWEEN_SHOTS);
			
			var nextShotCallback:Function = function():void {
				
				shootMissile();
				timer = new Timer(TIME_BETWEEN_SHOTS);
				timer.addCallback(nextShotCallback);
			}
			
			timer.addCallback(nextShotCallback);
		}
		
		private function shootMissile():void {
			
			// Copied this wholesale into AsteroidSpawner. Consider moving it into something.
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
			
			var missile:Missile = new Missile(x, y, mtm.player);
			mtm.add(missile);
		}
		
		public function update():void {
			
			timer.update();
		}
	}

}