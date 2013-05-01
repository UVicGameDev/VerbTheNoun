package games.dialThePhone.entities.finger 
{
	import core.GameConsts;
	import core.input.TopDownKeyInterpreter;
	import core.Keys;
	import core.motion.BoundedVelocity;
	import core.motion.Velocity;
	import flash.geom.Point;
	import games.dialThePhone.entities.finger.states.MoveState;
	import games.dialThePhone.entities.finger.states.TapDownState;
	import games.dialThePhone.entities.finger.states.TapUpState;
	import games.dialThePhone.entities.keys.Key;
	import games.dialThePhone.graphics.FingerSprite;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Finger extends Entity 
	{
		private var	ACCELERATION:Number	= 50,
					MAX_SPEED:Number	= 600,
					FRICTION:Number		= 7;
		
		private var	_sprite:FingerSprite,
					currentState:FingerState,
					moveIntention:TopDownKeyInterpreter	= new TopDownKeyInterpreter;
					
		public var	moveState:FingerState,
					tapDownState:FingerState,
					tapUpState:FingerState,
					velocity:Velocity;
					
		public function get sprite():FingerSprite { return _sprite; }
		
		public function Finger(initialX:Number, initialY:Number) 
		{
			_sprite = new FingerSprite;
			
			super(initialX, initialY, _sprite);
			
			moveState		= new MoveState(this);
			tapDownState	= new TapDownState(this);
			tapUpState		= new TapUpState(this);
			currentState	= moveState;
			
			velocity = new BoundedVelocity(0, 0, MAX_SPEED);
		}
		
		public function tryKeyPress():void {
			
			var	pressedKey:Key = collide("key", x, y) as Key;
			
			if (!pressedKey) return;
			
			pressedKey.press();
		}
		
		override public function update():void 
		{
			super.update();
			
			moveIntention.update();
			currentState.update();
		}
		
		public function move():void {
			
			// I'm copying this almost wholesale from missTheMissile's Player.
			// Consider factoring it out into something.
			
			if (!moveIntention.tryingToMove) {
				
				velocity.applyFriction(FRICTION);
			}
			
			else {
			
				velocity.accelerate(moveIntention.direction, ACCELERATION);
			}
			
			x += velocity.dx;
			y += velocity.dy;
			
			// Probably also want to factor out this bounding logic.
			if (x < 0)						{ x = 0;						velocity.x = 0; }
			if (x > GameConsts.WIDTH)		{ x = GameConsts.WIDTH;			velocity.x = 0; }
			if (y < 0)						{ y = 0;						velocity.y = 0; }
			if (y > GameConsts.HALF_HEIGHT)	{ y = GameConsts.HALF_HEIGHT;	velocity.y = 0; }
		}
		
		public function switchTo(nextState:FingerState):void {
			
			if (currentState) currentState.leave();
			currentState = nextState;
			currentState.enter();
		}
	}

}