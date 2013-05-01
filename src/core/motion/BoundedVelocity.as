package core.motion 
{
	/**
	 * Bounded velocity clamps its speed such that it does not exceed the max speed.
	 * @author beyamor
	 */
	public class BoundedVelocity extends Velocity 
	{
		
		public function BoundedVelocity(speed:Number, direction:Number, maxSpeed:Number) 
		{
			this.maxSpeed			= maxSpeed;
			this.maxSpeedSquared	= maxSpeed * maxSpeed;
			this.baseVelocity		= new UnboundedVelocity(speed, direction);
		}
		
		private function clampSpeed():void {
			
			var	oldX:Number	= baseVelocity.x,
				oldY:Number	= baseVelocity.y;
			
			if (oldX*oldX + oldY*oldY <= maxSpeedSquared) return;
			
			var	clampRatio:Number = maxSpeed / baseVelocity.speed;
			
			baseVelocity.x *= clampRatio;
			baseVelocity.y *= clampRatio;
		}
		
		override public function accelerate(direction:Number, magnitude:Number):void 
		{
			super.accelerate(direction, magnitude);
			clampSpeed();
		}
		
		//
		//	Basic accessors
		//
		override public function get x():Number { return baseVelocity.x; }
		override public function set x(newX:Number):void  { baseVelocity.x = newX; clampSpeed(); }
		
		override public function get y():Number  { return baseVelocity.y }
		override public function set y(newY:Number):void  { baseVelocity.y = newY; clampSpeed(); }
		
		override public function get direction():Number { return baseVelocity.direction; }
		override public function set direction(newDirection:Number):void  { baseVelocity.direction = newDirection; }
		
		override public function get speed():Number { return baseVelocity.speed; }
		override public function set speed(newSpeed:Number):void { baseVelocity.speed = newSpeed; clampSpeed(); }
		
		private var	baseVelocity:UnboundedVelocity,
					maxSpeed:Number,
					maxSpeedSquared:Number;
	}

}