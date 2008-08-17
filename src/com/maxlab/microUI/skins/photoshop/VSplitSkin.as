package com.maxlab.microUI.skins.photoshop 
{
	import com.maxlab.microUI.skins.Skin;
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	
	/**
	* ...
	* @author BG5SBK
	*/
	public class VSplitSkin extends Skin
	{
		override public function initialize():void 
		{
			super.initialize();
			owner.width = 3;
		}
			
		override public function paint(invalidateItems:Array):void 
		{
			super.paint(invalidateItems);
			
			if (invalidateItems.indexOf("size") >= 0)
			{
				graphics.clear();
				graphics.lineStyle(1, 0x585858, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
				graphics.lineTo(0, owner.height - 1);
				
				graphics.moveTo(1, 0);
				graphics.lineStyle(1, 0x141414, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
				graphics.lineTo(1, owner.height - 1);
				
				graphics.moveTo(2, 0);
				graphics.lineStyle(1, 0x585858, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
				graphics.lineTo(2, owner.height - 1);
				
				x = (owner.width - 2) / 2;
			}
		}
	}
}