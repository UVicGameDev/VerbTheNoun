package games.repeatTheLevel 
{
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
		
		public static const GRAV:Number = 0.5;
		private const MAX_Y_VEL:int = 10;
		public const MOV:int = 5;
		
		private var state:int = 0;
		public var y_vel:Number = 0;
		private var mid_jump:int = 0;
		
		public var dir:int = 0;
		
		public function Player(x:int, y:int, image:Image, hit_x:int, hit_y:int, width:int, height:int) 
		{
			super(x, y, image, hit_x, hit_y, width, height, "player");
		}
		
		override public function update():void
		{
			super.update();
			
			var x_inc:int = 0;
			var y_inc:int = 0;
			
			if (Input.check(Key.LEFT)) x_inc += -1;
			if (Input.check(Key.RIGHT)) x_inc += 1;

			
			if (Input.check(Key.SPACE)) 
			{
				if (state == WALKING) 
				{
					y_vel = -8;
					state = JUMPING;
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
					dir = i_x * x_inc;
					break;
				}
			}
			dir = i_x * x_inc;
			
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
						
						state = WALKING;
						
					}
					else
					{
						y_vel = 0;
						state = FALLING;
					}
					break;
				}
			}
			
		}
	}

}