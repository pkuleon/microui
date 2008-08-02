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
		private var m_textField:TextField;
		
		override public function paint(invalidateItems:Array):void 
		{
			if (m_textField)
			{
				if (invalidateItems.indexOf("text") >= 0)
				{
					m_textField.text = Label(owner).text;
				}
				else if(invalidateItems.indexOf("textColor") >= 0)
				{
					m_textField.textColor = Label(owner).textColor;
				}
				else if (invalidateItems.indexOf("textSize") >= 0)
				{
					m_textField.defaultTextFormat = getTextFormat();
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
				if (!ownerLabel.textColor)
					ownerLabel.textColor = 0x000000;
					
				if (!ownerLabel.textSize)
					ownerLabel.textSize = 13;
				
				m_textField = new TextField();
				m_textField.autoSize = TextFieldAutoSize.LEFT;
				m_textField.textColor = ownerLabel.textColor;
				m_textField.defaultTextFormat = getTextFormat();
				m_textField.selectable = false;
				m_textField.mouseEnabled = false;
				m_textField.text = ownerLabel.text;
					
				owner.addChild(m_textField);
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
		
		protected function get textField():TextField
		{
			return m_textField;
		}
	}
}