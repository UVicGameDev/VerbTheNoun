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
		private var boundary_x:int = 1640;
		private const boundary_inc:int = 640;
		
		private var  level_y:int = 400;
		private const  level_y_inc:int = 400;
		private var  level_x:int = 500;
		private const  level_x_inc:int = 500;
		
		private var hasDropped:Boolean = false;
		private var updatePositionsFlag:Boolean = false;
		private var removeOldLevelFlag:Boolean = false;
		
		private var  player:Player = new Player(0, 300, new Image(Assets.IMG_PLAYERSTANDIN), 0, 0, 10, 32);
		
		private var cameraManager:MantraCamera = new MantraCamera(player);
		
		private var prevLevel:Vector.<Entity> = new Vector.<Entity>;
		//private var currLevel:Vector.<Entity> = new Vector.<Entity>;
		
		
		public function MantraGameWorld() 
		{
			FP.console.enable();
			buildLevel(0, 400);
			//level_y += level_y_inc;
			add(player);
		}
		
		public function dropDown():void
		{
			if (hasDropped)
				return;
			getAll(prevLevel)

			for each (var e:Entity in prevLevel)
			{

				if (e.type != "player")
				{
					e.type = "untouchable";
				}	
			}

			prevLevel.splice(prevLevel.indexOf(player), 1);
			
			buildLevel(player.x - 400, 600);
			hasDropped = true;
			updatePositionsFlag = true;
		}
		
		public function updatePositions():void
		{
			var x_change:int = player.x - 400;
			var y_change:int = 200;
			
			var allEnts:Vector.<Entity> = new Vector.<Entity>;
			getAll(allEnts);

			for each (var e:Entity in allEnts)
			{


				e.x -= x_change;
				e.y -= y_change;

				
			}

			camera.x -= x_change;
			camera.y -= y_change;
			
			
			updatePositionsFlag = false;
			removeOldLevelFlag = true;
		}
		
		public function buildLevel(start_x:int, y_level:int):void 
		{
			for (var i:int = 0; i < 80; i++)
			{
				add(new SolidBuilder()	.useImage(new Image(Assets.IMG_BLOCK))
										.setPosition(start_x +(i * 32), y_level )
										.build());
			}
			
			/*for (i = 0; i < 10; i++)
			{
				add(new SolidBuilder()	.useImage(new Image(Assets.IMG_BLOCK))
										.setPosition(start_x +(i * 64), y_level - (i*8))
										.build());
			}*/
			
			add(new SolidBuilder()	.useImage(new Image(Assets.IMG_PUDDLE))
									.setPosition(start_x + 480, y_level)
									.overrideType("puddle")
									.build());
									
			add(new AcidPipe(start_x + 480, y_level - 384));
			
		}
		
		//in update()
		public override function update():void
		{
			super.update();
			
			if (updatePositionsFlag)
			{
				updatePositions();
			}
			else
			{
				if (player.x > 800)
				{
					dropDown();
				}
			}
			
			if (removeOldLevelFlag)
			{
				trace("velocity = " + player.y_vel);
				if (player.y_vel == 0)
				{
					
					removeList(prevLevel);
					removeOldLevelFlag = false;
					hasDropped = false;
					prevLevel = new Vector.<Entity>;
				}
			}
			
			//camera = cameraManager.update(boundary_x);
			cameraManager.update(boundary_x, camera);
			//trace(camera);
			//FP.screen.camera = camera;
		}
	}

}