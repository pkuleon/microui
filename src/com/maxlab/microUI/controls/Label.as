package com.maxlab.microUI.controls 
{
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.core.ControlAlign;
	import com.maxlab.microUI.core.ControlLayout;
	import flash.display.DisplayObject;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	* The Label control.
	* In MicroUI the Label control not only display text but also display an icon.
	* The text and icon are optional, but at least you have to set one.
	* 
	* @author BG5SBK
	*/
	public class Label extends Panel
	{
		private var m_icon:DisplayObject;
		private var m_textField:TextField;
		
		public function Label(config:*) 
		{
			if (config)
			{
				if (config.icon != null)
					icon = config.icon;
					
				if (config.text != null)
				{
					textField = new TextField();
					textField.selectable = false;
					textField.mouseEnabled = false;
					textField.autoSize = TextFieldAutoSize.LEFT;
					
					var format:TextFormat = new TextFormat();
						
					if (config.textSize != null)
						format.size = config.textSize;
					else
						format.size = 13;
						
					if (config.textFont != null)
						format.font = config.textFont;
					else
						format.font = "Arial";
						
					if (config.textColor != null)
						format.color = config.textColor;
					else
						format.color = 0x000000;
					
					textField.defaultTextFormat = format;
					textField.text = config.text;
				}
			}
			else
				config = { };
			
			if (config.autoSize == null)
				config.autoSize = true;
					
			if (config.layout == null)
				config.layout = ControlLayout.HORIZONTAL;
					
			if (config.vAlign == null && config.verticalAlign == null)
				config.verticalAlign = ControlAlign.MIDDLE;
					
			if (config.hAlign == null && config.horizontalAlign == null)
				config.horizontalAlign = ControlAlign.CENTER;
			
			super(config);
		}
		
		public function get icon():DisplayObject
		{
			return m_icon;
		}
		
		public function set icon(value:DisplayObject):void
		{
			if (m_icon != value)
			{
				if (m_icon)
					removeChild(m_icon);
					
				m_icon = value;
				addChild(m_icon);
			}
		}
		
		public function get textField():TextField
		{
			return m_textField;
		}
		
		public function set textField(value:TextField):void
		{
			if (m_textField != value)
			{
				if (m_textField)
					removeChild(m_textField);
				
				m_textField = value;
				addChild(m_textField);
			}
		}
		
		public function get text():String
		{
			return textField.text;
		}
		
		public function set text(value:String):void
		{
			textField.text = value;
		}
	}
}