package HeartTheBeets 
{
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class HTBLinkedListNode 
	{
		public var next:HTBLinkedListNode;
		public var object:HeartTheBeetsEntity;
		
		public function HTBLinkedListNode(object:HeartTheBeetsEntity) 
		{
			this.object = object;
		}
		
		public function inserAfter(new_object:HeartTheBeetsEntity)
		{
			var node:HTBLinkedListNode = new HTBLinkedListNode(new_object);
			node.next = next;
			next = node;
		}
		
		public function remove() {
			
		}
	}

}