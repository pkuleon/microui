package com.maxlab.microUI.skins.simple 
{
	import com.maxlab.microUI.controls.LinkLabel;
	import com.maxlab.microUI.skins.Skin;
	import flash.text.TextFormat;
	
	/**
	* The LinkLabel control's skin
	* 
	* @author BG5SBK
	*/
	public class LinkLabelSkin extends LabelSkin
	{
		override protected function createTextFormat():TextFormat 
		{
			var format:TextFormat = super.createTextFormat();
			format.color = "0x0000FF";
			format.underline = true;
			
			return format;
		}
	}
}