package com.maxlab.microUI.controls 
{
	import com.maxlab.microUI.core.Control;
	import flash.events.Event;
	
	/**
	* The ProgressBar control.
	* 
	* @author BG5SBK
	*/
	public class ProgressBar extends Control
	{
		private var m_progress:Number = 0;
		private var m_indeterminate:Boolean = false;
		
		public function ProgressBar(config:*) 
		{
			if (config)
			{
				if (config.progress != null)
					progress = config.progress;
					
				if (config.indeterminate != null)
					indeterminate = config.indeterminate;
			}
			
			super(config);
		}
		
		public function get progress():Number
		{
			return m_progress;
		}
		
		public function set progress(value:Number):void 
		{
			if (m_progress != value)
			{
				m_progress = value;
				invalidate("progress");
			}
		}
		
		public function get indeterminate():Boolean 
		{
			return m_indeterminate;
		}
		
		public function set indeterminate(value:Boolean):void 
		{
			if (m_indeterminate != value)
			{
				if(value)
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
				else
					removeEventListener(Event.ENTER_FRAME, onEnterFrame);
					
				m_indeterminate = value;
			}
		}
		
		public function onEnterFrame(event:Event):void
		{
			progress += 0.01;
			
			if(progress > 1)
				progress = 0;
		}
	}
}