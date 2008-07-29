package com.maxlab.microUI.core 
{
	import flash.display.Sprite;
	
	/**
	* The UICompent's skin, handle an UICompent's display style.
	* 
	* @author BG5SBK
	*/
	public class ControlSkin extends Sprite
	{
		public function ControlSkin() 
		{
		}
		
		public function get owner():Control
		{
			return parent as Control;
		}
		
		public function paint(force:Boolean = false):void
		{
			
		}
	}
}