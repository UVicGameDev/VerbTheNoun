package games.repeatTheLevel 
{
	import net.flashpunk.graphics.Image;
	import games.repeatTheLevel.common.Assets;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class AcidPipe extends Solid 
	{
		private var timeIntervalCoef:Number = 1.5;
		private var time:Number = timeIntervalCoef*FP.frameRate/100;
		
		public function AcidPipe(x:int,y:int) 
		{
			
			var picture:Image = new Image(Assets.IMG_PIPE);
			super(x, y, picture, 0, 0, picture.width, picture.height, "solid");
		}
		
		public override function update():void
		{
			//trace(time);
			if (time <= 0)
			{
				
				FP.world.add(new AcidDrop(this.x + width / 2, this.y + height / 2));
				time = timeIntervalCoef*FP.frameRate/100;
			}
			else 
			{
				time-= 0.01;
			}
		}
	}

}