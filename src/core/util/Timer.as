package core.util 
{
	import net.flashpunk.FP;
	/**
	 * The timer can be used to set time-based alarms.
	 * Attach callbacks to be triggered at the end of some period.
	 * 
	 * (The standard timer doesn't hook into FP, obviously.)
	 * @author beyamor
	 */
	public class Timer implements Updateable
	{
		private var	totalTile:Number,
					elapsedtime:Number			= 0,
					callbacks:Vector.<Function>	= new Vector.<Function>;
		
		/**
		 * If the timer loops, it will start counting up again after it fires.
		 * Any callbacks will be called every time the timer fires.
		 */
		public var loops:Boolean				= false;
		
		/**
		 * Creates a new Timer with a period of the given time in seconds.
		 * new Timer(1) fires after one second.
		 */
		public function Timer(timeInSeconds:Number)
		{
			totalTile = timeInSeconds;
		}
		
		/**
		 * Adds a callback to be called when the timer fires.
		 */
		public function addCallback(callback:Function):Timer {
			
			callbacks.push(callback);
			return this;
		}
		
		/**
		 * Whether the timer has seen enough time elapse.
		 */
		public function get hasFired():Boolean {
			
			return elapsedtime >= totalTile;
		}
		
		/**
		 * Updates, potentially calling callbacks.
		 */
		public function update():void {
			
			if (hasFired) {
				
				if (loops)	elapsedtime -= totalTile;
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