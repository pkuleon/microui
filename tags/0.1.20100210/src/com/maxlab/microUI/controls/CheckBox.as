package com.maxlab.microUI.controls 
{
	import com.maxlab.microUI.core.ControlAlign;
	import com.maxlab.microUI.core.ControlLayout;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	* The CheckBox control
	* 
	* @author BG5SBK
	*/
	public class CheckBox extends Label
	{
		private var m_value:Boolean;
		
		public function CheckBox(config:*) 
		{
			if (!config)
			{
				config = {};
				value = false;
				text = "Check Box";
			}
			
			if (config.value != null)
				value = config.value;
					
			if (config.text != null)
				text = config.text;
				
			if (config.tabEnabled == null)
				config.tabEnabled = true;
			
			super(config);
			
			buttonMode = true;
			useHandCursor = true;
			
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(event:MouseEvent):void
		{
			value = !value;
		}
		
		public function get value():Boolean
		{
			return m_value;
		}
		
		public function set value(v:Boolean):void
		{
			if (m_value != v)
			{
				m_value = v;
				invalidate("value");
				dispatchEvent(new Event(Event.CHANGE));
			}
		}
	}
}