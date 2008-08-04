package com.maxlab.microUI.skins.simple 
{
	import com.maxlab.microUI.controls.TextBox;
	import com.maxlab.microUI.skins.Skin;
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	
	/**
	* The TextBox control's skin
	* 
	* @author BG5SBK
	*/
	public class TextBoxSkin extends Skin
	{
		override public function initialize():void 
		{
			redraw();
			super.initialize();
		}
		
		override public function paint(invalidateItems:Array):void 
		{
			if(invalidateItems.indexOf("size") >= 0)
			{
				redraw();
			}
			
			if (invalidateItems.indexOf("enable") >= 0)
			{
				if (owner.enable)
					TextBox(owner).textField.textColor = 0x000000;
				else
					TextBox(owner).textField.textColor = 0xCCCCCC;
			}
			
			super.paint(invalidateItems);
		}
		
		private function redraw():void
		{
			this.graphics.clear();
			
			this.graphics.beginFill(0xF0F0F0);
			this.graphics.drawRect(0, 0, owner.width - 1, owner.height - 1);
			this.graphics.endFill();
				
			this.graphics.lineStyle(1, 0x808080, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
			this.graphics.drawRect(0, 0, owner.width - 1, owner.height - 1);
			
			this.graphics.lineStyle(1, 0xCCCCCC, 1, false, "normal", CapsStyle.SQUARE, JointStyle.MITER);
			this.graphics.moveTo(owner.width - 2, 1);
			this.graphics.lineTo(1, 1);
			this.graphics.lineTo(1, owner.height - 2);
				
			this.graphics.lineStyle(1, 0xFFFFFF, 1, false, "normal", CapsStyle.SQUARE, JointStyle.MITER);
			this.graphics.moveTo(owner.width - 2, 2);
			this.graphics.lineTo(owner.width - 2, owner.height - 2);
			this.graphics.lineTo(2, owner.height - 2);
		}
	}
}