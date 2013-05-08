package games.dialThePhone.numbers 
{
	import core.Random;
	/**
	 * ...
	 * @author beyamor
	 */
	public class NumberGenerator 
	{
		private var _digits:Vector.<uint>;
		
		public function NumberGenerator() 
		{
			generateNextNumber();
		}
		
		private function generateNextNumber():void {
			
			_digits = Random.shuffle(new <uint>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
		}
		
		public function get digits():Vector.<uint> {
			
			return _digits.concat();
		}
	}

}