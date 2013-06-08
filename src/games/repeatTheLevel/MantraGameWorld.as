package games.repeatTheLevel
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import games.repeatTheLevel.common.Assets;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class MantraGameWorld extends World 
	{
		private var boundary_x:int = 640;
		private const boundary_inc:int = 640;
		
		private var  level_y:int = 400;
		private const  level_y_inc:int = 400;
		private var  level_x:int = 500;
		private const  level_x_inc:int = 500;
		
		private var  player:Player = new Player(0, 300, new Image(Assets.IMG_PLAYERSTANDIN), 0, 0, 10, 32);
		
		private var cameraManager:MantraCamera = new MantraCamera(player);
		
		
		public function MantraGameWorld() 
		{
			buildLevel(0, 400);
			//level_y += level_y_inc;
			add(player);
		}
		
		
		public function buildLevel(start_x:int, y_level:int):void 
		{
			for (var i:int = 0; i < 20; i++)
			{
				add(new SolidBuilder()	.useImage(new Image(Assets.IMG_BLOCK))
										.setPosition(start_x +(i * 32), y_level )
										.build());
			}
			
			for (i = 0; i < 10; i++)
			{
				add(new SolidBuilder()	.useImage(new Image(Assets.IMG_BLOCK))
										.setPosition(start_x +(i * 64), y_level - (i*8))
										.build());
			}
		}
		
		//in update()
		public override function update():void
		{
			super.update();
			
			if (player.x > boundary_x)
			{
				
				buildLevel(level_x, level_y);
				boundary_x += boundary_inc;
				level_x += level_x_inc;
				level_y += level_y_inc;
			}
			
			//camera = cameraManager.update(boundary_x);
			cameraManager.update(boundary_x, camera);
			trace(camera);
			//FP.screen.camera = camera;
		}
	}

}