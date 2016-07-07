package BeardFramework.Resources.Assets 
{
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import flash.utils.Dictionary;
	import org.osflash.signals.Signal;
	import starling.textures.TextureAtlas;
	/**
	 * ...
	 * @author Ludovic Geraert
	 */
	public class AssetManager 
	{
		static public const LOADER_TYPE_IMAGE:uint = 0;
		static public const LOADER_TYPE_
		
		private const LOADER_NAME:String = "AssetManagerMainLoader";
	
		
		static private var _instance:AssetManager;
				
		private var _loader:LoaderMax;
		private var _atlases:Dictionary;
		private var _onComplete:Signal;
		private var _onProgress:Signal;
		private var _onError:Signal;
	
		
		
		public function AssetManager(singleton:AssetManagerSingleton) 
		{
			
			
		}
		
		static public function getInstance():AssetManager
		{
			if (!_instance){
				_instance = new AssetManager(new AssetManagerSingleton());
				_instance.init();
				
			}
			return _instance;
		}
		
		private function init():void
		{
			var loaderParams:LoaderMaxConstructorParameters = new LoaderMaxConstructorParameters();
			loaderParams.name = LOADER_NAME;
			loaderParams.onComplete  = onLoadingComplete;
			loaderParams.onProgress = onLoadingProgress;
			loaderParams.onError = onLoadingError;
			
			_onComplete = new Signal();
			_onProgress = new Signal();
			_onError = new Signal();
	
			_loader = new LoaderMax(loaderParams);
			_atlases = new Dictionary();
		}
		
		
		public static function append(type:uint, url:String = "", params:Object = null):void
		{
			//var loaderClass:Class;
			//switch(type)
			//{
				//case LOADER_TYPE_IMAGE : _instance._loader.append(new ImageLoader(url, params ? params : {}));
			//}
			//
			//_instance._loader.append(new loaderClass(url, loaderParams));
		//
		}
		
		public static function removeLoader(name:String = ""):void
		{
			//resourcesLoader.remove(resourcesLoader.getLoader(name));
		}
		
		public static function load(onComplete:Array = null, onProgress:Array = null, onError:Array = null):void
		{
			
			//if (onComplete != null)
				//onCompleteCallbacks = Vector.<Function>(onComplete);
			//else
				//onCompleteCallbacks = new Vector.<Function>();
			//
			//if (onProgress != null)
				//onProgressCallbacks = Vector.<Function>(onProgress);
			//else
				//onProgressCallbacks = new Vector.<Function>();
			//
			//if (onError != null)
				//onErrorCallbacks = Vector.<Function>(onError);
			//else
				//onErrorCallbacks = new Vector.<Function>();
			//
				//
			//resourcesLoader.load();
		
		}
		
		private static function onLoadingComplete(e:LoaderEvent = null):void
		{
			//trace("completed");
			//
			//for each (var callback:Function in onCompleteCallbacks)
			//{
				//callback.apply(null, [e]);
			//}
			//createAtlases(null);
			//_atlasesCount = 0;
			//resourcesLoader.empty(true, true);
		}
		
		private static function onLoadingProgress(e:LoaderEvent = null):void
		{
			
			
			//for each (var callback:Function in onProgressCallbacks)
			//{
				//callback.apply(null, [e]);
			//}
		//
		}
		
		private static function onLoadingError(e:LoaderEvent = null):void
		{
			
			//resourcesLoader.pause();
			//for each (var callback:Function in onErrorCallbacks)
			//{
				//callback.apply(null, [e]);
			//}
		}
		
		public static function set empty(value:Boolean):void
		{
			//if (value)
			//{
				//resourcesLoader.empty(true, true);
			//}
		}
		
	}

}
internal class AssetManagerSingleton{
	
}
internal class LoaderMaxConstructorParameters extends Object
{
	public var name:String;
	public var onComplete:Function;
	public var onProgress:Function;
	public var onError:Function;
}