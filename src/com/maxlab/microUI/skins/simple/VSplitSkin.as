package com.maxlab.microUI.skins.simple 
{
	import com.maxlab.microUI.skins.Skin;
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	
	/**
	* The VSplit control's skin
	* 
	* @author BG5SBK
	*/
	public class VSplitSkin extends Skin
	{
		override public function paint(invalidateItems:Array):void 
		{
			super.paint(invalidateItems);
			
			if (invalidateItems.indexOf("size") >= 0)
			{
				graphics.clear();
				graphics.lineStyle(1, 0x808080, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
				graphics.lineTo(0, owner.height - 1);
				graphics.moveTo(1, 0);
				
				var shadow:Number = ownerInToolBar ? 0xFFFFFF : 0xE8E8E8;
				
				graphics.lineStyle(1, shadow, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
				graphics.lineTo(1, owner.height - 1);
				
				x = (owner.width - 2) / 2;
			}
		}
	}
}