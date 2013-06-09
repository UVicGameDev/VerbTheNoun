package games.repeatTheLevel 
{
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class Player extends Solid 
	{	
		public static const WALKING:int = 0;
		public static const FALLING:int = 1;
		public static const JUMPING:int = 2;
		public static const SWIMMING:int = 3;
		public static const DEAD:int = 4;
		
		public static const GRAV:Number = 0.5;
		private const MAX_Y_VEL:int = 10;
		public const MOV:int = 5;
		
		private var state:int = 0;
		public var y_vel:Number = 0;
		private var mid_jump:int = 0;
		
		public var h_dir:int = 0;
		public var v_dir:int = 0;
		
		public var mount:MovingPlatform = null;
		
		private var worldPointer:MantraGameWorld;
		
		
		public function Player(x:int, y:int, image:Image, hit_x:int, hit_y:int, width:int, height:int) 
		{
			super(x, y, image, hit_x, hit_y, width, height, "player");
			layer = 1;
			
		}
		
		public function setWorld(world:MantraGameWorld):void
		{
			worldPointer = world;
		}
		
		override public function update():void
		{
			super.update();
			
			var x_inc:int = 0;
			var y_inc:int = 0;
			
			if (state != DEAD)
			{
				if (Input.check(Key.LEFT)) x_inc += -1;
				if (Input.check(Key.RIGHT)) x_inc += 1;
			}

			
			if (Input.check(Key.SPACE)) 
			{
				if (state == WALKING) 
				{
					y_vel = -8;
					state = JUMPING;
					dismount();
				}

				else if (state == SWIMMING)
				{
					
				}
				else
				{
					y_vel += GRAV;
				}
			}
			else {
				if (state == JUMPING)
				{
					if(y_vel < 0)
						y_vel = 0;
					state = FALLING;
				}
				else 
				{
					y_vel += GRAV;
				}
			}
			
			y_inc = (y_vel < 0 ? -1 : 1);
			
			
			
			//move in x
			
			for (var i_x:int = 0; i_x < MOV; i_x++)
			{
				x += x_inc;
				if (collide("solid", x, y) as Solid)
				{
					x -= x_inc;
					//dir = i_x * x_inc;
					break;
				}
				else if (collide("threat", x, y) as Entity)
				{
					worldPointer.setDropDownFlag();
					state = DEAD;
					y_vel = 0;
					
				}
			}
			h_dir += i_x * x_inc;
			
			//move in y
			for (var i_y:int = 0; i_y < Math.abs(y_vel);i_y++)
			{
				y += y_inc;
				var solid:Solid = collide("solid", x, y) as Solid;
				if (solid)
				{
					
					//switch to walking if you land
					y -= y_inc;
					if (solid.y > y)
					{
						if (solid is MovingPlatform)
						{
							(solid as MovingPlatform).mount(this);
							mount = (solid as MovingPlatform);
						}
						state = WALKING;
						
					}
					else
					{
						dismount();
						state = FALLING;
					}
					y_vel = 0;
					break;
				}
				else if (collide("threat", x, y) as Entity)
				{
					worldPointer.setDropDownFlag();
					state = DEAD;
					y_vel = 0;
					
				}
				else {
					dismount();
					state = FALLING;
				}
			}
			v_dir = i_y * y_inc;
		}
		
		public function push(dir:int):void
		{
			h_dir += dir;
			x += dir;
			
			trace("new h_dir = " + h_dir);
		}
		
		private function dismount():void
		{
			if (mount != null )
			{
				mount.dismount();
				mount = null;
			}
			
		}
	}

}