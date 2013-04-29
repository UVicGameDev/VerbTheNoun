package games.missTheMissile.spawners 
{
	import core.Random;
	import core.ui.View;
	import core.util.camera.Camera;
	import core.util.Timer;
	import core.util.Updateable;
	import flash.geom.Point;
	import games.missTheMissile.arena.Arena;
	import games.missTheMissile.arena.BoundaryPositioner;
	import games.missTheMissile.entities.Missile;
	import games.missTheMissile.GameData;
	import games.missTheMissile.MissTheMissile;
	import games.missTheMissile.ui.alert.IncomingAlert;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author beyamor
	 */
	public class MisisleLauncher implements Updateable
	{
		private static const	TIME_BETWEEN_SHOTS:Number	= 2,
								BOUNDARY:Number				= 100;
		
		private var	gameView:View,
					gameCamera:Camera,
					hudView:View,
					hudCamera:Camera,
					timer:Timer,
					positioner:BoundaryPositioner,
					data:GameData;

		public function MisisleLauncher(
			gameView:View, gameCamera:Camera,
			hudView:View, hudCamera:Camera,
			data:GameData, arena:Arena) 
		{
			this.gameView		= gameView;
			this.gameCamera		= gameCamera;
			this.hudView		= hudView;
			this.hudCamera		= hudCamera;
			this.data			= data;
			this.positioner		= new BoundaryPositioner(arena, BOUNDARY);
			
			shootMissile();
			timer = new Timer(TIME_BETWEEN_SHOTS);
			
			var nextShotCallback:Function = function():void {
				
				if (data.playerIsAlive) shootMissile();
				timer = new Timer(TIME_BETWEEN_SHOTS);
				timer.addCallback(nextShotCallback);
			}
			
			timer.addCallback(nextShotCallback);
		}
		
		private function shootMissile():void {
			
			var position:Point = positioner.getNextPosition();
			
			var missile:Missile = new Missile(position.x, position.y, data);
			gameView.add(missile);
			
			var alert:IncomingAlert = new IncomingAlert("missile", 0xff0000, missile, gameCamera, hudCamera);
			hudView.add(alert);
		}
		
		public function update():void {
			
			timer.update();
		}
	}

}