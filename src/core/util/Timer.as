package core.util 
{
	import net.flashpunk.FP;
	/**
	 * The standard timer doesn't hook into FP, obviously.
	 * @author beyamor
	 */
	public class Timer 
	{
		private var	totalTile:Number,
					elapsedtime:Number			= 0,
					callbacks:Vector.<Function>	= new Vector.<Function>;
					
		public var loops:Boolean				= false;
		
		public function Timer(timeInSeconds:Number)
		{
			totalTile = timeInSeconds;
		}
		
		public function addCallback(callback:Function):Timer {
			
			callbacks.push(callback);
			return this;
		}
		
		public function get hasFired():Boolean {
			
			return elapsedtime >= totalTile;
		}
		
		public function update():void {
			
			if (hasFired) {
				
				if (loops)	elapsedtime = 0;
				else		return;
			};
			
			elapsedtime += FP.elapsed;
			
			if (hasFired) {
				
				for each (var callback:Function in callbacks) {
					
					callback();
				}
			}
		}
	}

}