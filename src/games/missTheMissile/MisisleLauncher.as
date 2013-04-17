package games.missTheMissile 
{
	import core.Random;
	import core.util.Timer;
	import flash.geom.Point;
	import games.missTheMissile.arena.BoundaryPositioner;
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
					timer:Timer,
					positioner:BoundaryPositioner;
	
		public function MisisleLauncher(mtm:MissTheMissile) 
		{
			this.mtm = mtm;
			this.positioner = new BoundaryPositioner(mtm.arena, BOUNDARY);
			
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
			
			var position:Point = positioner.getNextPosition();
			
			var missile:Missile = new Missile(position.x, position.y, mtm.player);
			mtm.add(missile);
		}
		
		public function update():void {
			
			timer.update();
		}
	}

}