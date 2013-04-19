package core.ui.windows 
{
	import flash.display.BitmapData;
	import core.util.camera.Camera
	
	/**
	 * So, I dunno.
	 * Window? Display? View? Subworld?
	 * This guy represents a discrete section of the game interface,
	 * full of its own entities and complete with its own updating/rendering.
	 * 
	 * @author beyamor
	 */
	public interface Window 
	{
		function get x():Number;
		function get y():Number;
		function get width():Number;
		function get height():Number;
		
		function update():void;
		function render():void;
		
		function get buffer():BitmapData;
		function get camera():Camera;
		
		function get parent():Window;
		
		function get blocksUpdates():Boolean;
	}
	
}