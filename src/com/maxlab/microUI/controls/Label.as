package com.maxlab.microUI.controls 
{
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.core.ControlAlign;
	import com.maxlab.microUI.core.ControlLayout;
	import flash.display.DisplayObject;
	import flash.events.Event;
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
		
		private var m_textSize:Number;
		
		public function Label(config:*) 
		{
			if (config)
			{
				if (config.icon != null)
					icon = config.icon;
					
				if (config.text != null)
				{
					createTextField();
					text = config.text;
				}
				
				if (config.textSize != null)
					textSize = config.textSize;
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
			if (textField.text != value)
			{
				textField.text = value;
				dispatchEvent(new Event(Event.CHANGE));
			}
		}
		
		public function get textSize():Number
		{
			return m_textSize;
		}
		
		public function set textSize(value:Number):void
		{
			if (m_textSize != value)
			{
				m_textSize = value;
				invalidate("textSize");
			}
		}
		
		protected function createTextField():void
		{
			if (textField == null)
			{
				trace("create text");
				textField = new TextField();
				textField.selectable = false;
				textField.mouseEnabled = false;
				textField.autoSize = TextFieldAutoSize.LEFT;
			}
		}
	}
}