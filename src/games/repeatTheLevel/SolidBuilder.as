package games.repeatTheLevel
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class SolidBuilder 
	{
		
		public var x:int = 0;
		public var y:int = 0;
		public var width:int = 0;
		public var height:int = 0;
		public var hit_x:int = 0;
		public var hit_y:int = 0;
		public var image:Image = null;
		public var type:String = "solid";
		
		public function SolidBuilder() 
		{
			
		}
		
		public function useImage(image:Image):SolidBuilder
		{
			width = image.width;
			height = image.height;
			this.image = image;
			return this;
		}
		
		public function setHitboxOffset(x_off:int, y_off:int):SolidBuilder
		{
			hit_x = x_off;
			hit_y = y_off;
			return this;
		}
		
		public function setPosition(x:int, y:int):SolidBuilder
		{
			this.x = x;
			this.y = y;
			return this;
		}
		
		public function overrideType(type:String):SolidBuilder
		{
			this.type = type;
			return this;
		}
		
		public function build():Solid
		{
			return new Solid(x,y,image,hit_x,hit_y,width,height,type);
		}
	}

}