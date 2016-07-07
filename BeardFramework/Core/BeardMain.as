package BeardFramework.Core 
{
	import BeardFramework.Events.InputManager;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Ludo
	 */
	public class BeardMain extends Sprite
	{
		
		public function BeardMain() 
		{
		
			
			
			
			
			
		}
		
		private function init():void{
			
			
			//Inputs Should Check for the settings to add listeners
			stage.addEventListener(MouseEvent.CLICK, InputManager.getInstance().onMouseEvent);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, InputManager.getInstance().onKeyboardEvent);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, InputManager.getInstance().onKeyboardEvent);
			
			
		}
	}

}