package core.ui.windows 
{
	import flash.display.BitmapData;
	import core.util.camera.Camera
	import flash.geom.Point;
	
	/**
	 * Windows describe the idea of nested views.
	 * 
	 * Windows are aware of their parents and will render their views with respect to them.
	 * 
	 * @author beyamor
	 */
	public interface Window 
	{
		function get x():Number;
		function get y():Number;
		function get position():Point;
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