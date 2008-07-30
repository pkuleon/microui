package com.maxlab.microUI.skins.simple 
{
	import com.maxlab.microUI.controls.Panel;
	import com.maxlab.microUI.skins.Skin;
	
	/**
	* ...
	* @author BG5SBK
	*/
	public class PanelSkin extends Skin
	{
		override public function paint(invalidateItems:Array):void 
		{
			if(invalidateItems.indexOf("width") >= 0 
			|| invalidateItems.indexOf("height") >= 0 
			|| invalidateItems.indexOf("addChild") >= 0 
			|| invalidateItems.indexOf("removeChild") >= 0)
				Panel(owner).layoutChilds();
		}
	}
}