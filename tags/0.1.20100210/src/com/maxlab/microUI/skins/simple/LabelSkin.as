package com.maxlab.microUI.skins.simple 
{
	import com.maxlab.microUI.controls.Label;
	import com.maxlab.microUI.skins.Skin;
	import flash.text.TextFormat;
	
	/**
	* The Label control's skin
	* 
	* @author BG5SBK
	*/
	public class LabelSkin extends Skin
	{
		override public function initialize():void 
		{
			super.initialize();
			
			if (Label(owner).textField)
				Label(owner).textField.setTextFormat(createTextFormat());
		}
		
		override public function paint(invalidateItems:Array):void 
		{
			super.paint(invalidateItems);
			
			if (invalidateItems.indexOf("text") >= 0)
				Label(owner).textField.setTextFormat(createTextFormat());
		}
		
		protected function createTextFormat():TextFormat
		{
			var format:TextFormat = new TextFormat();
							
			if (Label(owner).textSize)
				format.size = Label(owner).textSize;
			else
				format.size = 12;
							
			format.font = "Arial";
			format.color = 0x000000;
				
			return format;
		}
	}
}