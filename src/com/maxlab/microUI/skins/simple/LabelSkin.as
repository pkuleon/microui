package com.maxlab.microUI.skins.simple 
{
	import com.maxlab.microUI.controls.Label;
	import com.maxlab.microUI.skins.Skin;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	* The Label control's skin
	* 
	* @author BG5SBK
	*/
	public class LabelSkin extends Skin
	{
		private var m_text:TextField;
		
		override public function paint(invalidateItems:Array):void 
		{
			if (m_text)
			{
				if (invalidateItems.indexOf("text") >= 0)
				{
					m_text.text = Label(owner).text;
				}
				else if(invalidateItems.indexOf("textColor") >= 0)
				{
					m_text.textColor = Label(owner).textColor;
				}
				else if (invalidateItems.indexOf("textSize") >= 0)
				{
					m_text.defaultTextFormat = getTextFormat();
				}
			}
			else
			{
				createTextField();
			}
			
			super.paint(invalidateItems);
		}
		
		private function createTextField():void
		{
			var ownerLabel:Label = Label(owner);
				
			if (ownerLabel.text)
			{
				trace(ownerLabel.textSize);
			
				if (!ownerLabel.textColor)
					ownerLabel.textColor = 0x666666;
					
				if (!ownerLabel.textSize)
					ownerLabel.textSize = 13;
				
				m_text = new TextField();
				m_text.autoSize = TextFieldAutoSize.LEFT;;
				m_text.text = ownerLabel.text;
				m_text.textColor = ownerLabel.textColor;
				m_text.defaultTextFormat = getTextFormat();
				m_text.selectable = false;
				m_text.mouseEnabled = false;
					
				owner.addChild(m_text);
			}
		}
		
		private function getTextFormat():TextFormat
		{
			var format:TextFormat = new TextFormat();
			format.font = "Arial";
			format.size = Label(owner).textSize;
			format.color = Label(owner).textColor;
			
			return format;
		}
	}
}