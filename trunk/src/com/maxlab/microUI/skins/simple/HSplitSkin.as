package com.maxlab.microUI.skins.simple 
{
	import com.maxlab.microUI.skins.Skin;
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	
	/**
	* The HSplit control's skin
	* 
	* @author BG5SBK
	*/
	public class HSplitSkin extends Skin
	{
		override public function paint(invalidateItems:Array):void 
		{
			super.paint(invalidateItems);
			
			if (invalidateItems.indexOf("size") >= 0)
			{
				this.graphics.clear();
				this.graphics.lineStyle(1, 0x808080, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
				this.graphics.lineTo(owner.width - 1, 0);
				this.graphics.moveTo(0, 1);
				
				var shadow:Number = ownerInToolBar ? 0xFFFFFF : 0xE8E8E8;
				
				this.graphics.lineStyle(1, shadow, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
				this.graphics.lineTo(owner.width - 1, 1);
				
				this.y = (owner.height - 2) / 2;
			}
		}
	}
}