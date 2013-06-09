package core.games 
{
	/**
	 * All of the metadata for a game.
	 * Each game should supply its own info.
	 * @author beyamor
	 */
	public class GameInfo 
	{
		private var	_thumbnail:*;
		
		public function GameInfo(thumbnail:*) {
			
			_thumbnail	= thumbnail;
		}
		
		/**
		 * Gets the thumbnail that should be shown for this game in the gallery.
		 */
		public function get thumbnail():* {
			
			return _thumbnail;
		}
		
		/**
		 * Returns a builder for game info.
		 */
		public static function get description():GameInfoBuilder {
			
			return new GameInfoBuilder;
		}
	}

}

import core.games.GameInfo;

/**
 * A helpful builder class for game info.
 */
class GameInfoBuilder {
	
	private var	_thumbnail:*;
	
	public function GameInfoBuilder() {
		
		
	}
	
	/**
	 * Whatever thumbnail should be shown in the gallery.
	 */
	public function thumbnail(thumbnail:*):GameInfoBuilder {
		
		_thumbnail = thumbnail;
		return this;
	}
	
	/**
	 * Finishes the description and returns the game info.
	 */
	public function finish():GameInfo {
		
		if (thumbnail == null) throw new Error("Thumbnail not set");
		
		return new GameInfo(_thumbnail);
	}
}