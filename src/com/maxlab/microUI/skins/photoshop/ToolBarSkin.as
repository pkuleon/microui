package com.maxlab.microUI.skins.photoshop 
{
	import com.maxlab.microUI.skins.Skin;
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	
	/**
	* ...
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
			graphics.clear();
			
			graphics.beginFill(0x474747);
			graphics.drawRect(0, 0, owner.width - 1, owner.height - 1);
			graphics.endFill();
			
			graphics.lineStyle(1, 0x141414, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
			graphics.drawRect(0, 0, owner.width - 1, owner.height - 1);
			graphics.lineStyle(1, 0x595959, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
			graphics.drawRect(1, 1, owner.width - 3, owner.height - 3);
		}
	}
}