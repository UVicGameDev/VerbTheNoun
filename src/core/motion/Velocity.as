package core.motion 
{
	import net.flashpunk.FP;
	
	/**
	 * Hey, that basic physical property.
	 * 
	 * The Velocity class describes motion with a speed in a direction. Duh.
	 * It also provides some handy methods like friction and acceleration.
	 * 
	 * Note that one of UnboundedVelocity or BoundedVelocity should be instanciated.
	 * This class should be considered an abstract base class.
	 * 
	 * @author beyamor
	 */
	public class Velocity 
	{
		//
		//	Basic accessors
		//
		public function get x():Number { throw new Error("not implemented"); }
		public function set x(newX:Number):void  { throw new Error("not implemented"); }
		
		public function get y():Number  { throw new Error("not implemented"); }
		public function set y(newY:Number):void  { throw new Error("not implemented"); }
		
		public function get direction():Number { throw new Error("not implemented"); }
		public function set direction(newDirection:Number):void  { throw new Error("not implemented"); }
		
		public function get speed():Number { throw new Error("not implemented"); }
		public function set speed(newSpeed:Number):void { throw new Error("not implemented"); }
		
		//
		//	Additional methods
		//
		/**
		 * The change in x position caused by this velocity for the current tick.
		 */
		public function get dx():Number {
			
			return x * FP.elapsed;
		}
		
		/**
		 * The change in y position caused by this velocity for the current tick.
		 */
		public function get dy():Number {
			
			return y * FP.elapsed;
		}
		
		/**
		 * Adds to the velocity in the given direction with the given magnitude.
		 */
		public function accelerate(direction:Number, magnitude:Number):void {
			
			x += Math.cos(direction) * magnitude;
			y += Math.sin(direction) * magnitude;
		}
		
		/**
		 * Decreases the speed by the given value
		 */
		public function applyFriction(frictionValue:Number):void {
			
			speed = Math.max(0, speed - frictionValue);
		}
	}

}