package games.dialThePhone.entities.finger 
{
	import core.context.ELUStateMachine;
	import core.GameConsts;
	import core.input.TopDownKeyInterpreter;
	import core.Keys;
	import core.motion.BoundedVelocity;
	import core.motion.Velocity;
	import flash.geom.Point;
	import games.dialThePhone.entities.finger.states.MoveState;
	import games.dialThePhone.entities.finger.states.TapDownState;
	import games.dialThePhone.entities.finger.states.TappingState;
	import games.dialThePhone.entities.finger.states.TapUpState;
	import games.dialThePhone.entities.keys.Key;
	import games.dialThePhone.graphics.FingerSprite;
	import games.dialThePhone.util.ColorBounds;
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
					bounds:ColorBounds,
					velocity:Velocity;
					
		public var	state:ELUStateMachine,
					moveIntention:TopDownKeyInterpreter	= new TopDownKeyInterpreter,
					overHeight:Number = 1,
					tappingIsEnabled:Boolean			= true;
		
		public function Finger(initialX:Number, initialY:Number, bounds:ColorBounds) 
		{
			this.bounds	= bounds;
			_sprite		= new FingerSprite(this);
			
			super(initialX, initialY, _sprite);
			
			state = new ELUStateMachine(
				"move", {
				move:		new MoveState(this),
				tapDown:	new TapDownState(this),
				tapping:	new TappingState(this),
				tapUp:		new TapUpState(this)
			});
			
			velocity = new BoundedVelocity(0, 0, MAX_SPEED);
		}
		
		override public function update():void 
		{
			super.update();
			
			moveIntention.update();
			state.update();
			
			if (bounds.contains(x + velocity.dx, y))	x += velocity.dx;
			else										velocity.x = 0;
			if (bounds.contains(x, y + velocity.dy))	y += velocity.dy;
			else										velocity.y = 0;
		}
		
		public function accelerate():void {
			
			velocity.accelerate(moveIntention.direction, ACCELERATION);
		}
		
		public function applyFriction():void {
			
			velocity.applyFriction(FRICTION);
		}
		
		public function enableTapping():void { tappingIsEnabled = true; }
		public function disableTapping():void { tappingIsEnabled = false; }
	}

}