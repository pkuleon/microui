package com.maxlab.microUI.skins.simple 
{
	import com.maxlab.microUI.controls.Label;
	import com.maxlab.microUI.skins.Skin;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	* 标签控件皮肤
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
						m_text.defaultTextFormat = new TextFormat(null, Label(owner).textSize, Label(owner).textColor);
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
				
			if (!ownerLabel.textColor)
				ownerLabel.textColor = 0x666666;
				
			if (!ownerLabel.textSize)
				ownerLabel.textSize = 13;
				
			m_text = new TextField();
			m_text.autoSize = TextFieldAutoSize.LEFT;;
			m_text.text = ownerLabel.text;
			m_text.defaultTextFormat = new TextFormat(null, ownerLabel.textSize, ownerLabel.textColor);
			m_text.textColor = ownerLabel.textColor;
			m_text.selectable = false;
			m_text.mouseEnabled = false;
				
			addChild(m_text);
				
			if (ownerLabel.autoSize)
			{
				var w:Number = m_text.width;
				var h:Number = m_text.height;
				
				if (ownerLabel.icon)
				{
					w += ownerLabel.width;
					h += ownerLabel.height;
				}
					
				owner.width = w;
				owner.height = h;
			}
		}
	}
}