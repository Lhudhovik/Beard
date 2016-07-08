package BeardFramework.Resources.Assets 
{
	import flash.utils.getTimer;
	/**
	 * ...
	 * @author Ludovic Geraert
	 */
	public class LoaderParameters extends Object
	{
		public var name : String = "DefaultName";
		public function LoaderParameters() 
		{
			name += getTimer();
		}
		
	}

}