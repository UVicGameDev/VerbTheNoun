package games.missTheMissile.spawners 
{
	import core.Random;
	import core.ui.windows.sub.PlayWindowBase;
	import core.util.Timer;
	import flash.geom.Point;
	import games.missTheMissile.arena.BoundaryPositioner;
	import games.missTheMissile.entities.Missile;
	import games.missTheMissile.MissTheMissile;
	import games.missTheMissile.ui.alert.IncomingAlert;
	import games.missTheMissile.windows.AlertScreen;
	import games.missTheMissile.windows.PlayWindow;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author beyamor
	 */
	public class MisisleLauncher 
	{
		private static const	TIME_BETWEEN_SHOTS:Number	= 2,
								BOUNDARY:Number				= 100;
		
		private var	mtm:PlayWindow,
					timer:Timer,
					positioner:BoundaryPositioner,
					alertScreen:AlertScreen;
	
		public function MisisleLauncher(mtm:PlayWindow, alertScreen:AlertScreen) 
		{
			this.mtm			= mtm;
			this.alertScreen	= alertScreen;
			this.positioner		= new BoundaryPositioner(mtm.arena, BOUNDARY);
			
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
			mtm.view.add(missile);
			
			var alert:IncomingAlert = new IncomingAlert("missile", 0xff0000, missile, mtm.camera, alertScreen.camera);
			alertScreen.view.add(alert);
		}
		
		public function update():void {
			
			timer.update();
		}
	}

}