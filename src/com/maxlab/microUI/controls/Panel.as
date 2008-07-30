package com.maxlab.microUI.controls 
{
	import com.maxlab.microUI.core.Control;
	
	/**
	* The panel control
	* 
	* @author BG5SBK
	*/
	public class Panel extends Control
	{
		private var m_layout:String;
		
		private var m_verticalGap:Number;
		private var m_verticalAlign:String;
		
		private var m_horizontalGap:Number;
		private var m_horizontalAlign:String;
		
		public function Panel(config:*) 
		{
			if (config)
			{
				if(config.layout)
					m_layout = config.layout;
				
				if (config.verticalGap)
					m_verticalGap = config.verticalGap;
					
				if (config.verticalAlign)
					m_verticalAlign = config.verticalAlign;
				
				if (config.horizontalGap)
					m_horizontalGap = config.horizontalGap;
				
				if (config.horizontalAlign)
					m_horizontalAlign = config.horizontalAlign;
			}
			
			super(config);
		}
		
		public function get layout():String 
		{ 
			return m_layout; 
		}
		
		public function set layout(value:String):void
		{
			m_layout = value;
			layoutChilds();
		}
		
		public function layoutChilds():void
		{
			
		}
	}
}