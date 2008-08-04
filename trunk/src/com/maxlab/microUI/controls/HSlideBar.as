package com.maxlab.microUI.controls 
{
	import com.maxlab.microUI.core.Control;
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	
	/**
	* The horizontal SlideBar control.
	* 
	* @author BG5SBK
	*/
	public class HSlideBar extends Control
	{
		private var m_position:Number = 0;
		private var m_minValue:Number = 0;
		private var m_maxValue:Number = 100;
		
		private var m_slideBox:Control = null;
		
		private var m_mouseInFlag:Boolean = false;
		private var m_mouseDownFlag:Boolean = false;
		
		private var m_lastMouseX:Number = 0;
		
		public function HSlideBar(config:*) 
		{
			slideBox = new Control(null);
			
			if (config)
			{
				if (config.minValue != null)
					minValue = config.minValue;
					
				if (config.maxValue != null)
					maxValue = config.maxValue;
					
				if (config.value != null)
					value = config.value;
			}
			
			super(config);
		}
		
		override protected function initializeSelf():void 
		{
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			slideBox.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			slideBox.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			slideBox.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
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
				this.m_lastMouseX = stage.mouseX;
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
		
		private function onMouseMove(event:MouseEvent):void
		{
			if (mouseDownFlag)
			{
				slideBox.x += stage.mouseX - m_lastMouseX;
				
				if (slideBox.x + slideBox.width > width)
					slideBox.x = width - slideBox.width;
					
				if (slideBox.x < 0)
					slideBox.x = 0;
				
				m_lastMouseX = stage.mouseX;
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
				invalidate("mouseDownFlag");
			}
		}
		
		public function get minValue():Number
		{
			return m_minValue;
		}
		
		public function set minValue(value:Number):void
		{
			if (m_minValue != value && value < maxValue)
			{
				m_minValue = value;
				invalidate("minValue");
			}
		}
		
		public function get maxValue():Number
		{
			return m_maxValue;
		}
		
		public function set maxValue(value:Number):void
		{
			if (m_maxValue != value && value > minValue)
			{
				m_maxValue = value;
				invalidate("maxValue");
			}
		}
		
		public function get value():Number
		{
			var t:Number = Math.round((m_slideBox.x / (width - m_slideBox.width)) * 100) * 0.01;
			
			return (maxValue - minValue) * t + minValue;
		}
		
		public function set value(v:Number):void
		{
			var t:Number = Math.round(((v - minValue) / (maxValue - minValue)) * 100) * 0.01;
			
			slideBox.x = (width - slideBox.width) * t;
			
			invalidate("value");
		}
		
		public function get slideBox():Control
		{
			return m_slideBox;
		}
		
		public function set slideBox(value:Control):void
		{
			if (m_slideBox != value)
			{
				if (m_slideBox)
					removeChild(m_slideBox);
				
				m_slideBox = value;
				addChild(value);
			}
		}
	}
}