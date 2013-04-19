package core.ui.windows.sub 
{
	import core.Game;
	import core.ui.windows.WindowStack;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Popup extends SubWindow 
	{
		private var stack:WindowStack;
		
		public function Popup(width:Number, height:Number, stack:WindowStack)
		{
			super(width, height);
			
			this.stack = stack;
			
			blocksUpdates = true;
		}
		
		public function close():void {
			
			if (stack.top == this) stack.pop();
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.pressed(Keys.CANCEL)) close();
		}
	}

}