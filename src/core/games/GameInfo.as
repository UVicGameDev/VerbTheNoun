package core.games 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class GameInfo 
	{
		private var	_thumbnail:*;
		
		public function GameInfo(thumbnail:*) {
			
			_thumbnail	= thumbnail;
		}
		
		public function get thumbnail():* {
			
			return _thumbnail;
		}
		
		public static function get description():GameInfoBuilder {
			
			return new GameInfoBuilder;
		}
	}

}

import core.games.GameInfo;

class GameInfoBuilder {
	
	private var	_thumbnail:*;
	
	public function GameInfoBuilder() {
		
		
	}
	
	public function thumbnail(thumbnail:*):GameInfoBuilder {
		
		_thumbnail = thumbnail;
		return this;
	}
	
	public function finish():GameInfo {
		
		if (thumbnail == null) throw new Error("Thumbnail not set");
		
		return new GameInfo(_thumbnail);
	}
}