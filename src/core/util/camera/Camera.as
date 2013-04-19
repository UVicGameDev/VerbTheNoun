package core.util.camera 
{
	
	/**
	 * ...
	 * @author beyamor
	 */
	public interface Camera 
	{
		function get x():Number;
		function get y():Number;
		function set x(newX:Number):void;
		function set y(newY:Number):void;
		
		function get width():Number;
		function get height():Number;
		
		// What I really want to do is mix these in. Maybe I should just bite the bullet and make this guy an abstract class.
		function get top():Number;
		function get bottom():Number;
		function get left():Number;
		function get right():Number;
		
		function update():void;
	}
	
}