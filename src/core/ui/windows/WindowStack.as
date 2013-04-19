package core.ui.windows 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class WindowStack 
	{
		private var windows:Vector.<Window> = new Vector.<Window>;
		
		public function WindowStack(... windows)
		{
			for each (var window:Window in windows) push(window);
		}
		
		public function push(... windowsToAdd):void {
			
			for each (var window:Window in windowsToAdd) windows.push(window);
		}
		
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
		
		public function get top():Window {
			
			if (windows.length == 0) return null;
			
			return windows[windows.length - 1];
		}
	}

}