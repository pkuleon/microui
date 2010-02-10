package com.maxlab.microUI.skins.simple 
{
	import com.maxlab.microUI.skins.Skin;
	
	/**
	* The ToolTip's skin
	* 
	* @author BG5SBK
	*/
	public class ToolTipSkin extends LabelSkin
	{
		override public function paint(invalidateItems:Array):void 
		{
			super.paint(invalidateItems);
			
			if(invalidateItems.indexOf("size") >= 0)
				redraw();
		}
		
		private function redraw() : void
		{
			SimpleSkinHelper.paintFocusBackground(this, owner.width, owner.height);
			SimpleSkinHelper.paintDisableBorder(this, owner.width, owner.height, true);
		}
	}
}