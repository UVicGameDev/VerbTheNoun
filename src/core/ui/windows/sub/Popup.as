package core.ui.windows.sub 
{
	import core.Game;
	import core.Keys;
	import core.ui.windows.WindowStack;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Popup extends SubWindow 
	{
		private var		stack:WindowStack;
		protected var	canBeClosed:Boolean	= true;
		
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
			
			if (canBeClosed && Input.pressed(Keys.CANCEL)) close();
		}
	}

}