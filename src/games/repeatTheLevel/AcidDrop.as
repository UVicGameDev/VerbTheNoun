package games.repeatTheLevel 
{	
	import net.flashpunk.graphics.Image;
	import games.repeatTheLevel.common.Assets;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class AcidDrop extends Solid 
	{
		public static const GRAV:Number = 1.0;
		public var y_vel:Number = 0;
		
		public function AcidDrop(x:int,y:int) 
		{
			
			var picture:Image = new Image(Assets.IMG_DROP);
			super (x - picture.width / 2, 
					y - picture.height / 2, 
					picture, 
					picture.width / 10, 
					picture.height / 10, 
					picture.width - picture.width/5,
					picture.height - picture.height/5,
					"solid");
		}
		
		override public function update():void
		{
			var y_inc:int = 0;
			
			y_vel += GRAV;
			y_inc = 1;
			
			for (var i_y:int = 0; i_y < Math.abs(y_vel);i_y++)
			{
				y += y_inc;
				if (collide("puddle", x+originX, y+originY))
				{
					FP.world.remove(this);
				}
			}
		}
	}
}