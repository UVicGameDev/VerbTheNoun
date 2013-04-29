package core.ui.windows 
{
	/**
	 * You might end up with windows on top of windows.
	 * In this case, employ a window stack to manage them.
	 * @author beyamor
	 */
	public class WindowStack 
	{
		private var windows:Vector.<Window> = new Vector.<Window>;
		
		/**
		 * Creates a new window stack with some windows.
		 */
		public function WindowStack(... windows)
		{
			for each (var window:Window in windows) push(window);
		}
		
		/**
		 * Pushes some windows onto the stack.
		 */
		public function push(... windowsToAdd):void {
			
			for each (var window:Window in windowsToAdd) windows.push(window);
		}
		
		/**
		 * 	Pops the top off the stack.
		 */
		public function pop():Window {
			
			return windows.pop();
		}
		
		/**
		 * Updates top-to-bottom
		 */
		public function update():void {
			
			var		window:Window;
			const	reversedWindows:Vector.<Window> = windows.concat().reverse();
			
			for each (window in reversedWindows) {
				
				window.update();
				if (window.blocksUpdates) break;
			}
		}
		
		/**
		 * Renders bottom-to-top
		 */
		public function render():void {
			
			for each (var window:Window in windows) {
				
				window.render();
			}
		}
		
		/**
		 * Returns the top of the stack, supplying null if the are no windows.
		 */
		public function get top():Window {
			
			if (windows.length == 0) return null;
			
			return windows[windows.length - 1];
		}
	}

}