package com.maxlab.microUI.skins.simple 
{
	import com.maxlab.microUI.skins.Skin;
	
	/**
	* The ToolBar control's skin
	* 
	* @author BG5SBK
	*/
	public class ToolBarSkin extends Skin
	{
		override public function paint(invalidateItems:Array):void 
		{
			super.paint(invalidateItems);
			
			if (invalidateItems.indexOf("layout") >= 0)
			{
				redraw();
			}
		}
		
		private function redraw():void
		{
			SimpleSkinHelper.paintNormalBackground(this, owner.width, owner.height);
			SimpleSkinHelper.paintNormalBorder(this, owner.width, owner.height, true);
		}
	}
}