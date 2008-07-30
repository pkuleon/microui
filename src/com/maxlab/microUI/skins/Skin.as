package com.maxlab.microUI.skins
{
	import com.maxlab.microUI.core.Control;
	import flash.display.Sprite;
	
	/**
	* The UICompent's skin, handle an UICompent's display style.
	* 
	* @author BG5SBK
	*/
	public class Skin extends Sprite
	{
		public function get owner() : Control
		{
			return parent as Control;
		}
		
		public function paint(invalidateItems:Array):void
		{
			
		}
	}
}