package games.missTheMissile.views 
{
	import core.ui.View;
	import core.util.camera.BoundedCamera;
	import core.util.camera.Camera;
	import core.util.camera.EntityCamera;
	import core.util.camera.ViewCamera;
	import core.util.Updateable;
	import core.util.UpdateList;
	import flash.display.BitmapData;
	import games.missTheMissile.arena.Arena;
	import games.missTheMissile.entities.Player;
	import net.flashpunk.FP;
	
	/**
	 * There are a couple of views making up the actual gameplay.
	 * (namely, the game view, the hud view, and the parallax star views)
	 * The view system is responsible for managing the updating and rendering of these guys.
	 * Different states may or may not choose to update this system,
	 * thereby controlling whether or not the actual game is running.
	 * 
	 * Also, "ViewSystem" is a crappy name.
	 * @author beyamor
	 */
	public class ViewSystem
	{
		public var	gameView:View,
					gameCamera:Camera,
					hudView:View,
					hudCamera:Camera;
					
		private var starViews:Vector.<View> = new Vector.<View>,
					updateables:UpdateList	= new UpdateList;
		
		public function ViewSystem(arena:Arena, player:Player)
		{
			// Game view
			gameView	= new View(Consts.GAME_WIDTH, Consts.GAME_HEIGHT);
			gameCamera	= new BoundedCamera(
							arena.bounds,
							new EntityCamera(
								player,
								new ViewCamera(gameView)));
			
			updateables.add(gameView.updater);
			updateables.add(gameCamera);
			
			// Hud view
			hudView		= new View(Consts.GAME_WIDTH, Consts.GAME_HEIGHT);
			hudCamera	= new ViewCamera(hudView);
			
			updateables.add(hudView.updater);
			updateables.add(hudCamera);
			
			// Star views
			for (var distance:int = 1; distance <= 4; ++distance) {
				
				var starView:StarView = new StarView(arena, gameCamera, distance);
				
				starViews.push(starView);
				updateables.add(starView.updater);
			}
		}
		
		public function update():void {
			
			updateables.update();
		}
		
		public function render():void {
			
			for each (var starView:StarView in starViews) starView.renderTo(FP.buffer);
			gameView.renderTo(FP.buffer);
			hudView.renderTo(FP.buffer);
		}
	}

}