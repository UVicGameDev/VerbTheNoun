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
		private var boundary_x:int = 2650;
		private const boundary_inc:int = 640;
		
		private var  level_y:int = 400;
		private const  level_y_jump:int = 1200;
		private var  level_x:int = 500;
		private const  level_x_inc:int = 500;
		
		private var hasDropped:Boolean = false;
		private var updatePositionsFlag:Boolean = false;
		private var removeOldLevelFlag:Boolean = false;
		private var dropDownFlag:Boolean = false;
		
		private var  player:Player = new Player(0, 300, new Image(Assets.IMG_PLAYERSTANDIN), 0, 0, 10, 32);
		
		private var cameraManager:MantraCamera = new MantraCamera(player);
		
		private var prevLevel:Vector.<Entity> = new Vector.<Entity>;
		//private var currLevel:Vector.<Entity> = new Vector.<Entity>;
		
		
		public function MantraGameWorld() 
		{
			FP.console.enable();
			buildLevel(0, 400);
			//level_y += level_y_inc;
			player.setWorld(this);
			add(player);
		}
		
		public function setDropDownFlag():void
		{
			dropDownFlag = true;
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
			
			buildLevel(player.x - 400, level_y_jump);
			hasDropped = true;
			updatePositionsFlag = true;
			dropDownFlag = false;
		}
		
		public function updatePositions():void
		{
			var x_change:int = player.x - 400;
			var y_change:int = level_y_jump - level_y;
			
			var allEnts:Vector.<Entity> = new Vector.<Entity>;
			getAll(allEnts);

			for each (var e:Entity in allEnts)
			{
				e.x -= x_change;
				e.y -= y_change;
				
				if (e is MovingPlatform)
				{
					(e as MovingPlatform).applyOffset(x_change);
				}
			}

			camera.x -= x_change;
			camera.y -= y_change;
			
			
			updatePositionsFlag = false;
			removeOldLevelFlag = true;
		}
		
		private function buildFloor(start:int, height:int, length:int):void
		{
			for (var i:int = 0; i < length; i++)
			{
				add(new SolidBuilder()	.useImage(new Image(Assets.IMG_BLOCK))
										.setPosition(start +(i * 32), height )
										.build());
			}
		}
		
		private function buildAcid(start:int, height:int, length:int):void
		{
			add(new SolidBuilder()	.useImage(new Image(Assets.IMG_BLOCK))
									.setPosition(start, height )
									.build());
									
			add(new SolidBuilder()	.useImage(new Image(Assets.IMG_PUDDLE))
									.setPosition(start, height-1)
									.overrideType("threat")
									.build());
									
			add(new AcidPipe(start, height - 384));
		}
		
		private function buildFire(start:int, height:int, length:int):void
		{
			for (var i:int = 0; i < length; i++)
			{
				add(new Fire(start +(i * 32), height) );
			}
			
			buildFloor(start - 32, height + 32, length + 2);
			
			//trace("created platform at " + (start + 32));
			add(new MovingPlatform(start + 32, height - 64, start + (length*32) - 96));
		}
		
		private function buildSpikes(start:int, height:int, length:int):void
		{
			//var phantoms:Array = [1,4,9]
			for (var i:int = 0; i < length; i++)
			{
				if (i==1 || i==4 || i==9)
					add(new PhantomSpike(start +(i * 32), height) );
				else
					add(new Spike(start +(i * 32), height) );
			}
			buildFloor(start - 32, height + 32, length + 2);
			
			add(new MovingPlatform(start + 32, height - 64, start + (length*32) - 96));
		}
		
		private function buildWater(start:int, height:int, length:int):void
		{
			for (var i:int = 0; i < length; i++)
			{
				add(new SolidBuilder()	.useImage(new Image(Assets.IMG_WATERBLOCK))
										.setPosition(start + 32*i, height+32)
										.overrideType("water")
										.build());
				add(new SolidBuilder()	.useImage(new Image(Assets.IMG_WATERBLOCK))
										.setPosition(start + 32*i, height+64)
										.overrideType("water")
										.build());
				add(new SolidBuilder()	.useImage(new Image(Assets.IMG_WATERSURFACE))
										.setHitboxDim(32, 16)
										.setPosition(start + 32*i, height)
										.overrideType("water")
										.build());
				
			}
			
			for (i = 0; i < 2; i++ )
			{
			
				add(new SolidBuilder()	.useImage(new Image(Assets.IMG_BLOCK))
										.setPosition(start-32, height+32+(i*32))
										.build());
				add(new SolidBuilder()	.useImage(new Image(Assets.IMG_BLOCK))
										.setPosition(start+32+(32*length), height+32+(i*32))
										.build());
			}
			
			buildFloor(start - 32, height + 69, length + 2);
			
			add(new SpikePlatform(start + 32, height - 64, start + (length * 32) - 96));
		}
		
		public function buildLevel(start_x:int, y_level:int):void 
		{
			/*var levelSize:int = (boundary_x+200) / 32;
			for (var i:int = 0; i < levelSize; i++)
			{
				add(new SolidBuilder()	.useImage(new Image(Assets.IMG_BLOCK))
										.setPosition(start_x +(i * 32), y_level )
										.build());
			}
			
			add(new SolidBuilder()	.useImage(new Image(Assets.IMG_PUDDLE))
									.setPosition(start_x + 480, y_level)
									.overrideType("threat")
									.build());
									
			add(new AcidPipe(start_x + 480, y_level - 384));
			
			add(new MovingPlatform(start_x + 720, y_level - 128, start_x + 720 + 32 * 8))
			
			for (i = 0; i < 12; i++)
			{
				add(new SolidBuilder()	.useImage(new Image(Assets.IMG_WATERBLOCK))
										.setPosition(start_x + 640 + 32*i, y_level+32)
										.overrideType("water")
										.build());
				add(new SolidBuilder()	.useImage(new Image(Assets.IMG_WATERBLOCK))
										.setPosition(start_x + 640 + 32*i, y_level+64)
										.overrideType("water")
										.build());
				add(new SolidBuilder()	.useImage(new Image(Assets.IMG_WATERSURFACE))
										.setHitboxDim(32, 16)
										.setPosition(start_x + 480, y_level)
										.overrideType("water")
										.build());
			}
			add(new SolidBuilder()	.useImage(new Image(Assets.IMG_BLOCK))
										.setPosition(start_x + 640 + 32*12, y_level-72)
										.build()); 
										
			add(new SolidBuilder()	.useImage(new Image(Assets.IMG_BLOCK))
										.setPosition(start_x + 640 - 32, y_level-72)
										.build());
			*/
										
			var position:int = start_x;
			
			buildFloor(position, level_y, 23);
			position += 23 * 32;
			
			buildAcid(position, level_y, 23);
			position += 32;
			
			buildFloor(position, level_y, 20);
			position += 20 * 32;
			
			buildFire(position, level_y, 17);
			position += 17 * 32;
			
			
			buildFloor(position, level_y, 23);
			position += 23 * 32;
			
			buildAcid(position, level_y, 23);
			position += 32;
			
			buildFloor(position, level_y, 20);
			position += 20 * 32;
			
			buildSpikes(position, level_y, 9);
			position += 9 * 32;
			
			
			buildFloor(position, level_y, 23);
			position += 23 * 32;
			
			buildAcid(position, level_y, 1);
			position += 32;
			
			buildFloor(position, level_y, 20);
			position += 20 * 32;
			
			buildWater(position, level_y, 17);
			position += 17 * 32;
			
			
			buildFloor(position, level_y, 23);
			position += 23 * 32;
			
			buildAcid(position, level_y, 1);
			position += 32;
			
			buildFloor(position, level_y, 20);
			position += 20 * 32;
			
			boundary_x = position - start_x;
			
			buildFloor(position, level_y, 23);
			position += 23 * 32;
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
				if (player.x > boundary_x)
				{
					dropDown();
				}
				else if (dropDownFlag)
				{
					dropDown();
				}
			}
			
			if (removeOldLevelFlag)
			{
				if (player.y_vel == 0)
				{
					
					removeList(prevLevel);
					removeOldLevelFlag = false;
					hasDropped = false;
					prevLevel = new Vector.<Entity>;
				}
			}
			cameraManager.update(boundary_x+200, camera);
		}
	}

}