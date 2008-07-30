package com.maxlab.microUI.controls 
{
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.core.ControlLayout;
	import flash.display.DisplayObject;
	
	/**
	* 标签控件
	* 
	* @author BG5SBK
	*/
	public class Label extends Control
	{
		private var m_icon:DisplayObject;
		
		private var m_autoSize:Boolean;
		
		private var m_text:String;
		private var m_textSize:Number;
		private var m_textColor:Number;
		
		public function Label(config:*) 
		{
			if (config)
			{
				if (config.icon)
					icon = config.icon;
					
				if (config.autoSize)
					autoSize = config.autoSize;
					
				if (config.text)
					text = config.text;
					
				if (config.textSize)
					textSize = config.textSize;
					
				if (config.textColor)
					textColor = config.textColor;
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
		
		public function get autoSize():Boolean
		{
			return m_autoSize;
		}
		
		public function set autoSize(value:Boolean):void
		{
			m_autoSize = value;
			invalidate("autoSize");
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
		
		override public function set width(value:Number):void 
		{
			if(!autoSize)
				super.width = value;
		}
		
		override public function set height(value:Number):void 
		{
			if(!autoSize)
				super.height = value;
		}
		
		override public function get layout():String 
		{ 
			return ControlLayout.HORIZONTAL; 
		}
		
		override public function set layout(value:String):void 
		{
		}
	}
}