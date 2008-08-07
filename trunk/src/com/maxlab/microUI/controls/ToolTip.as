package com.maxlab.microUI.controls 
{
	import com.maxlab.microUI.core.Control;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	* The ToolTip Control
	* 
	* @author BG5SBK
	*/
	public class ToolTip extends Label
	{
		private var m_target:Control;
		private var m_mouseInFlag:Boolean;
		private var m_mouseDownFlag:Boolean;
		
		public function ToolTip(config:*) 
		{
			if (config)
			{
				if (config.target != null)
					target = config.target;
			}
			else
				config = { };
				
			config.autoSize = true;
			config.padding = [4, 4, 4, 4];
			
			super(config);
			
			visible = false;
		}
		
		public function get target():Control
		{
			return m_target;
		}
		
		public function set target(value:Control):void
		{
			if (m_target != value)
			{
				m_target = value;
				
				if (m_target.stage)
					onTargetAddedToStage(null);
				else
					m_target.addEventListener(Event.ADDED_TO_STAGE, onTargetAddedToStage);
			}
		}
		
		private function onTargetAddedToStage(event:Event):void
		{
			m_target.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			m_target.stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			m_target.addEventListener(MouseEvent.MOUSE_OUT, onTargetMouseOut);
			m_target.addEventListener(MouseEvent.MOUSE_OVER, onTargetMouseOver);
			m_target.addEventListener(MouseEvent.MOUSE_DOWN, onTargetMouseDown);
			
			if(event)
				m_target.removeEventListener(Event.ADDED_TO_STAGE, onTargetAddedToStage);
		}
		
		private function onMouseUp(event:MouseEvent):void
		{
			m_mouseDownFlag = false;
			
			if (!m_mouseInFlag)
				visible = false;
		}
		
		private function onMouseMove(event:MouseEvent):void
		{
			if (visible)
			{
				x = stage.mouseX;
				y = stage.mouseY + 22;
			}
		}
		
		private function onTargetMouseOut(event:MouseEvent):void
		{
			if(!m_mouseDownFlag)
				visible = false;
			
			m_mouseInFlag = false;
		}
		
		private function onTargetMouseOver(event:MouseEvent):void
		{
			x = stage.mouseX;
			y = stage.mouseY + 22;
			visible = true;
			m_mouseInFlag = true;
		}
		
		private function onTargetMouseDown(event:MouseEvent):void
		{
			m_mouseDownFlag = true;
		}
	}
}