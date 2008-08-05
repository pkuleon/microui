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
	public class TextBoxSkin extends LabelSkin
	{
		override public function initialize():void 
		{
			super.initialize();
			redraw();
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
			SimpleSkinHelper.paintFocusBackground(this, owner.width, owner.height);
			SimpleSkinHelper.paintInlineBorder(this, owner.width, owner.height, true);
		}
	}
}