package games.missTheMissile.util.camera 
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
		function update():void;
	}
	
}