package com.maxlab.microUI.controls 
{
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.core.ControlAlign;
	import com.maxlab.microUI.core.ControlLayout;
	import flash.display.DisplayObject;
	
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
		
		private var m_text:String;
		private var m_textSize:Number = 13;
		private var m_textColor:Number = 0x000000;
		
		public function Label(config:*) 
		{
			if (config)
			{
				if (config.icon)
					icon = config.icon;
					
				if (config.text)
					text = config.text;
					
				if (config.textSize)
					textSize = config.textSize;
					
				if (config.textColor)
					textColor = config.textColor;
					
				if (config.autoSize == null)
					config.autoSize = true;
					
				if (!config.layout)
					config.layout = ControlLayout.HORIZONTAL;
					
				if (!config.vAlign && !config.verticalAlign)
					config.verticalAlign = ControlAlign.MIDDLE;
					
				if (!config.hAlign && !config.horizontalAlign)
					config.horizontalAlign = ControlAlign.CENTER;
			}
			
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
				
				invalidate("icon");
			}
		}
		
		public function get text():String
		{
			return m_text;
		}
		
		public function set text(value:String):void
		{
			if (m_text != value)
			{
				m_text = value;
				invalidate("text");
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
		
		public function get textColor():Number
		{
			return m_textColor;
		}
		
		public function set textColor(value:Number):void
		{
			if (m_textColor != value)
			{
				m_textColor = value;
				invalidate("textColor");
			}
		}
	}
}