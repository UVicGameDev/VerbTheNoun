package HeartTheBeets 
{
	/**
	 * ...
	 * @author Lambwatt
	 */
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.utils.Input;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Key;
	
	public class GameText extends net.flashpunk.Entity
	{
		
		//private var myText:Text;
		public function GameText(x:int,y:int,text:String)
		{
			//super();
			this.x = x;
			this.y = y;
			//myText = text;
			graphic = new Text(text);
		}
		
		public function set_text_color(new_color:uint):void
		{

			Text(graphic).color = new_color;
		}
	}


}