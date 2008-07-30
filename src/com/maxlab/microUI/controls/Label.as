package com.maxlab.microUI.controls 
{
	import com.maxlab.microUI.core.Control;
	
	/**
	* ...
	* @author DaDa
	*/
	public class Label extends Control
	{
		private var m_size:Number;
		private var m_text:String;
		private var m_color:Number;
		
		public function Label(config:*) 
		{
			if (config)
			{
				if (config.size)
					size = config.size;
					
				if (config.text)
					text = config.text;
					
				if (config.color)
					color = config.color;
			}
			
			super(config);
		}
		
		public function get size():Number
		{
			return m_size;
		}
		
		public function set size(value:Number):void
		{
			if (m_size != value)
			{
				m_size = value;
				invalidate("size");
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
		
		public function get color():Number
		{
			return m_color;
		}
		
		public function set color(value:Number):void
		{
			if (m_color != value)
			{
				m_color = value;
				invalidate("color");
			}
		}
	}
}