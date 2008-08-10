package com.maxlab.microUI.skins.simple 
{
	import com.maxlab.microUI.skins.Skin;
	
	/**
	* The Panel control's skin
	* 
	* @author BG5SBK
	*/
	public class PanelSkin extends Skin
	{
		override public function initialize():void 
		{
			redraw();
			super.initialize();
		}
		override public function paint(invalidateItems:Array):void 
		{
			if (invalidateItems.indexOf("size") >= 0)
			{
				redraw();
			}
			
			super.paint(invalidateItems);
		}
		
		private function redraw():void
		{
			SimpleSkinHelper.paintFocusBackground(this, owner.width, owner.height);
		}
	}
}