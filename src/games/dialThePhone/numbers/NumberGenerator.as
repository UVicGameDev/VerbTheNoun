package games.dialThePhone.numbers 
{
	import core.Random;
	/**
	 * ...
	 * @author beyamor
	 */
	public class NumberGenerator 
	{
		private var digits:Vector.<uint>
		
		public function NumberGenerator() 
		{
			
		}
		
		public function next():Vector.<uint> {
			
			generateNextNumber();
			return digits.concat();
		}
		
		private function generateNextNumber():void {
			
			digits = Random.shuffle(new <uint>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
		}
	}

}