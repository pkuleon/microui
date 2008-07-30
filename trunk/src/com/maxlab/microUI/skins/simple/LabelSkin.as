package com.maxlab.microUI.skins.simple 
{
	import com.maxlab.microUI.controls.Label;
	import com.maxlab.microUI.skins.Skin;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	* ...
	* @author BG5SBK
	*/
	public class LabelSkin extends Skin
	{
		private var m_text:TextField;
		
		override public function paint(invalidateItems:Array):void 
		{
			if (invalidateItems.indexOf("text") >= 0)
			{
				m_text.text = Label(owner).text;
			}
			else if(invalidateItems.indexOf("color") >= 0)
			{
				m_text.textColor = Label(owner).color;
			}
			else if (invalidateItems.indexOf("size") >= 0)
			{
				m_text.defaultTextFormat = new TextFormat(null, Label(owner).size, Label(owner).color);
			}
			else if (invalidateItems.indexOf("initialize") >= 0)
			{
				var ownerLabel:Label = Label(owner);
				
				if (!ownerLabel.color)
					ownerLabel.color = 0x999999;
					
				if (!ownerLabel.size)
					ownerLabel.size = 13;
				
				m_text = new TextField();
				m_text.autoSize = TextFieldAutoSize.LEFT;;
				m_text.text = ownerLabel.text;
				m_text.defaultTextFormat = new TextFormat(null, ownerLabel.size, ownerLabel.color);
				m_text.textColor = ownerLabel.color;
				m_text.selectable = false;
				m_text.mouseEnabled = false;
				
				owner.width = m_text.width;
				owner.height = m_text.height;
				
				addChild(m_text);
			}
		}
	}
}