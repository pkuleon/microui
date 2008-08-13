package com.maxlab.microUI.controls 
{
	import com.maxlab.microUI.core.Control;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	/**
	* The button control.
	* Button is inherit from Label control, so a Button have icon and text.
	* 
	* @author BG5SBK
	*/
	public class Button extends Label
	{
		private var m_mouseInFlag:Boolean = false;
		private var m_mouseDownFlag:Boolean = false;
		
		private var m_onClick:Function = null;
		
		public function Button(config:*) 
		{
			if (config)
			{
				if (config.onClick != null)
					onClick = config.onClick;
					
			}
			else
				config = { };
			
			if ((config.width == null || config.height == null) && config.size == null)
				config.autoSize = true;
			else
				config.autoSize = false;
					
			if (config.padding == null
			&& config.paddingTop == null
			&& config.paddingLeft == null
			&& config.paddingRight == null
			&& config.paddingBottom == null)
				config.padding = [4, 4, 4, 4];
				
			if (config.tabEnabled == null)
				config.tabEnabled = true;
					
			super(config);
		}
		
		override protected function initializeSelf():void 
		{
			buttonMode = true;
			useHandCursor = true;
			
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			this.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			this.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		private function onMouseUp(event:MouseEvent):void
		{
			if(enable)
				this.mouseDownFlag = false;
		}
		
		private function onMouseDown(event:MouseEvent):void
		{
			if (enable)
			{
				this.mouseDownFlag = true;
				
				if (m_onClick != null)
					m_onClick(this);
			}
		}
		
		private function onMouseOver(event:MouseEvent):void
		{
			this.mouseInFlag = true;
		}
		
		private function onMouseOut(event:MouseEvent):void
		{
			this.mouseInFlag = false;
		}
		
		private function onKeyUp(event:KeyboardEvent):void
		{
			if (enable && event.keyCode == 13)
			{
				this.mouseDownFlag = false;
				
				if (m_onClick != null)
					m_onClick(this);
			}
		}
		
		private function onKeyDown(event:KeyboardEvent):void
		{
			if (enable && event.keyCode == 13)
			{
				this.mouseDownFlag = true;
			}
		}
		
		public function get mouseInFlag():Boolean
		{
			return m_mouseInFlag;
		}
		
		public function set mouseInFlag(value:Boolean):void
		{
			if (m_mouseInFlag != value)
			{
				m_mouseInFlag = value;
				
				if(enable)
					invalidate("mouseInFlag");
			}
		}
		
		public function get mouseDownFlag():Boolean
		{
			return m_mouseDownFlag;
		}
		
		public function set mouseDownFlag(value:Boolean):void
		{
			if (m_mouseDownFlag != value)
			{
				m_mouseDownFlag = value;
				
				if(enable)
					invalidate("mouseDownFlag");
			}
		}
		
		public function get onClick():Function
		{
			return m_onClick;
		}
		
		public function set onClick(value:Function):void
		{
			m_onClick = value;
		}
	}
}