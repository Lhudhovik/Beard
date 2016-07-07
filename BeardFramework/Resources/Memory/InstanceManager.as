package BeardFramework.Resources.Memory 
{
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	/**
	 * ...
	 * @author Ludo
	 */
	public class InstanceManager 
	{
		
		
		
		static private var _instance:InstanceManager;
		private var _pool :Dictionary;
		private var _counts :Dictionary;
		private var _currentPoolName:String;
		
		
		
		public function InstanceManager(singleton:InstanceManagerSingleton) 
		{
			
			
		}
		
		static public function getInstance():InstanceManager
		{
			if (!_instance){
				_instance = new InstanceManager(new InstanceManagerSingleton());
				_instance.init();
				
			}
			
			return _instance;
		}
		
		private function init():void
		{
			_pool = new Dictionary();
			_counts = new Dictionary();
		}
		
	
		public function createInstances(type:Class, count:uint=1 , vector:Vector.<*> = null):void
		{
			//_currentPoolName = getQualifiedClassName(type);
			//
			//if (!_pool[_currentPoolName])
			//{
				//_pool[_currentPoolName] = vector;
				//_counts[_currentPoolName] = count;
				//
				//while (--count >-1){
					//
					//_pool[_currentPoolName][count] = new type();
					//
					//trace("added object in " + _currentPoolName + " pool");
				//}
			//}
			//else
				//while (count-->0){
					//
					//_pool[_currentPoolName][_counts[_currentPoolName]++] = new type();
					//trace("added object in " + _currentPoolName + " pool");
				//}
			
			
		}
		
		public function borrowObject(type:Class):*
		{
			//_currentPoolName = getQualifiedClassName(type);
			//
			//if (!_pool[_currentPoolName] ||_counts[_currentPoolName] <= 0)
				//createInstances(type);
			//
			//_counts[_currentPoolName]--;
			//
			//trace("borrowed object in " + _currentPoolName + " pool");
			//return _pool[_currentPoolName][_counts[_currentPoolName]];
			//
			
		}
		
		public function returnObject(returnedObject:*):void
		{
			//_currentPoolName = getQualifiedClassName(getQualifiedClassName(returnedObject));
			//
			//_pool[_currentPoolName][_counts[_currentPoolName]]++
			//
			
		}
		
		
	}

}
internal class InstanceManagerSingleton{
	
}

