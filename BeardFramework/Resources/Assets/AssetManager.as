package BeardFramework.Resources.Assets 
{
	import BeardFramework.Resources.Assets.LoaderParameters;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.DataLoader;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.MP3Loader;
	import com.greensock.loading.XMLLoader;
	import flash.utils.Dictionary;
	import org.osflash.signals.Signal;
	import starling.textures.TextureAtlas;
	/**
	 * ...
	 * @author Ludovic Geraert
	 */
	public class AssetManager 
	{
		static public const LOADER_TYPE_IMAGE:uint 	= 0;
		static public const LOADER_TYPE_XML:uint 	= 1;
		static public const LOADER_TYPE_DATA:uint 	= 2;
		static public const LOADER_TYPE_SOUND:uint 	= 3;
		
		private const LOADER_NAME:String = "AssetManagerMainLoader";
	
		
		static private var _instance:AssetManager;
				
		private var _loader:LoaderMax;
		private var _atlases:Dictionary;
		private var _onComplete:Signal;
		private var _onProgress:Signal;
		private var _onError:Signal;
		private var _defaultParameters:LoaderParameters;
	
		
		
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
			
			_onComplete = new Signal(LoaderEvent);
			_onProgress = new Signal(LoaderEvent);
			_onError = new Signal(LoaderEvent);
	
			_loader = new LoaderMax( );
			//_loader = new LoaderMax(loaderParams );
			_atlases = new Dictionary();
		}
		
		
		public function append(type:uint, url:String = "", params:LoaderParameters = null):void
		{
			//var loaderClass:Class;
		
			
			switch(type)
		{
				case LOADER_TYPE_IMAGE : _loader.append(new ImageLoader(url, params ? params : new LoaderParameters()as Object));
					break;
				case LOADER_TYPE_XML : _loader.append(new XMLLoader(url, params ? params : new LoaderParameters() as Object));
					break;
				case LOADER_TYPE_DATA : _loader.append(new DataLoader(url, params ? params : new LoaderParameters() as Object));
					break;
				case LOADER_TYPE_SOUND : _loader.append(new MP3Loader(url, params ? params : new LoaderParameters() as Object));
					break;
				
			}
			
		}
		
		public function removeLoader(name:String = ""):void
		{
			_loader.remove(_loader.getLoader(name));
		}
		
		public function load(onCompleteCallback:Function = null, onProgressCallback:Function = null, onErrorCallback:Function = null, flush:Boolean = false):void
		{
			
			if (onCompleteCallback != null)
				_onComplete.addOnce(onCompleteCallback);
			if (onProgressCallback!=null)
				_onProgress.add(onProgressCallback);
			if (onErrorCallback!=null)
				_onError.addOnce(onErrorCallback);
			
				_loader.load(flush);
		
		}
		
		private function onLoadingComplete(e:LoaderEvent = null):void
		{
			trace("completed");
			
			_onComplete.dispatch(e);
			_loader.empty(true, true);
			
		}
		
		private function onLoadingProgress(e:LoaderEvent = null):void
		{
			_onProgress.dispatch(e);
		}
		
		private function onLoadingError(e:LoaderEvent = null):void
		{
			_loader.pause();
			_onError.dispatch(e);
			
		}
		
		public function empty(disposeChildren:Boolean=true, unloadAllContent:Boolean=true):void
		{
			_loader.empty(disposeChildren, unloadAllContent);
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
	
	public function LoaderMaxConstructorParameters():void
	{
		super();
	}
}