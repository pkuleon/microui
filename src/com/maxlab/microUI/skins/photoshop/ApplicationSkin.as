package com.maxlab.microUI.skins.photoshop 
{
	import com.maxlab.microUI.skins.Skin;
	
	/**
	* ...
	* @author BG5SBK
	*/
	public class ApplicationSkin extends Skin
	{
		override public function initialize():void 
		{
			redraw();
			super.initialize();
		}
		
		override public function paint(invalidateItems:Array):void 
		{
			super.paint(invalidateItems);
			
			if (invalidateItems.indexOf("size") >= 0)
			{
				redraw();
			}
		}
		
		private function redraw():void
		{
			graphics.clear();
			graphics.beginFill(0x333333);
			graphics.drawRect(0, 0, owner.width - 1, owner.height - 1);
			graphics.endFill();
		}
	}
}