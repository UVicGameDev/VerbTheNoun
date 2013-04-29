package core.util.camera 
{
	import core.util.Updateable;
	
	/**
	 * The camera represents where we're looking in space.
	 * @author beyamor
	 */
	public interface Camera extends Updateable
	{
		function get x():Number;
		function get y():Number;
		function set x(newX:Number):void;
		function set y(newY:Number):void;
		
		function get width():Number;
		function get height():Number;
		
		// What I really want to do is mix these in. Maybe I should just bite the bullet and make this guy an abstract class.
		// Actually, this comes back to the idea of making a Dimensions object.
		function get top():Number;
		function get bottom():Number;
		function get left():Number;
		function get right():Number;
	}
	
}