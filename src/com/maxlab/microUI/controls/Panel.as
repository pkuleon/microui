package com.maxlab.microUI.controls 
{
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.core.ControlConfig;
	
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
		
		public function Panel(config:ControlConfig) 
		{
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
		
		override public function paint(force:Boolean = false):void 
		{
			super.paint(force);
			
			if (force)
				layoutChilds();
		}
		
		protected function layoutChilds():void
		{
			
		}
	}
}