package com.maxlab.microUI.skins.photoshop 
{
	import com.maxlab.microUI.skins.Skin;
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	
	/**
	* ...
	* @author BG5SBK
	*/
	public class HSplitSkin extends Skin
	{
		override public function initialize():void 
		{
			super.initialize();
			owner.height = 3;
		}
			
		override public function paint(invalidateItems:Array):void 
		{
			super.paint(invalidateItems);
			
			if (invalidateItems.indexOf("size") >= 0)
			{
				graphics.clear();
				graphics.lineStyle(1, 0x585858, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
				graphics.lineTo(owner.width - 1, 0);
				
				graphics.moveTo(0, 1);
				graphics.lineStyle(1, 0x141414, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
				graphics.lineTo(owner.width - 1, 1);
				
				graphics.moveTo(0, 2);
				graphics.lineStyle(1, 0x585858, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
				graphics.lineTo(owner.width - 1, 2);
				
				y = (owner.height - 2) / 2;
			}
		}
	}
}