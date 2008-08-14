package com.maxlab.microUI.controls 
{
	import com.maxlab.microUI.core.Control;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	/**
	* The horizontal SlideBar control.
	* 
	* @author BG5SBK
	*/
	public class HSlideBar extends Control
	{
		private var m_initValue:Number;
		
		private var m_position:Number = 0;
		private var m_minValue:Number = 0;
		private var m_maxValue:Number = 100;
		
		private var m_slideBox:Control = null;
		private var m_slideBar:Control = null;
		
		private var m_mouseInFlag:Boolean = false;
		private var m_mouseDownFlag:Boolean = false;
		
		private var m_lastMousePosition:Number = 0;
		
		private var m_onChange:Function = null;
		
		public function HSlideBar(config:*) 
		{
			slideBar = new Control(null);
			slideBox = new Control(null);
			
			if (!config)
				config = { };
			
			if (config.minValue != null)
				minValue = config.minValue;
					
			if (config.maxValue != null)
				maxValue = config.maxValue;
					
			if (config.value != null)
				m_initValue = config.value;
					
			if (config.tabEnabled == null)
				config.tabEnabled = true;
				
			if (config.onChange != null)
				m_onChange = config.onChange;
			
			super(config);
		}
		
		override protected function initializeSelf():void 
		{
			stage.addEventListener(MouseEvent.MOUSE_UP, onStageMouseUp);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onStageMouseMove);
			
			slideBar.addEventListener(MouseEvent.MOUSE_DOWN, onBarMouseDown);
			
			addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			slideBox.addEventListener(MouseEvent.MOUSE_OUT, onBoxMouseOut);
			slideBox.addEventListener(MouseEvent.MOUSE_OVER, onBoxMouseOver);
			slideBox.addEventListener(MouseEvent.MOUSE_DOWN, onBoxMouseDown);
		}
		
		override protected function initializeChilds():void 
		{
			super.initializeChilds();
			
			if (!isNaN(m_initValue))
				value = m_initValue;
		}
		
		private function onStageMouseUp(event:MouseEvent):void
		{
			if(enable)
				this.mouseDownFlag = false;
		}
		
		private function onStageMouseMove(event:MouseEvent):void
		{
			if (mouseDownFlag)
			{
				slideBoxPosition += (mousePosition - m_lastMousePosition);
				
				m_lastMousePosition = mousePosition;
			}
		}
		
		private function onKeyDown(event:KeyboardEvent):void
		{
			if (enable)
			{
				if(event.keyCode == KeyCode1)
					slideBoxPosition += 1;
				else if(event.keyCode == KeyCode2)
					slideBoxPosition -= 1;
			}
		}
		
		private function onBoxMouseDown(event:MouseEvent):void
		{
			if (enable)
			{
				this.mouseDownFlag = true;
				this.m_lastMousePosition = mousePosition;
			}
		}
		
		private function onBoxMouseOver(event:MouseEvent):void
		{
			this.mouseInFlag = true;
		}
		
		private function onBoxMouseOut(event:MouseEvent):void
		{
			this.mouseInFlag = false;
		}
		
		private function onBarMouseDown(event:MouseEvent):void
		{
			if (!mouseDownFlag)
			{
				slideBoxPosition = (getMouseLocalPosition(event) - (slideBoxSize / 2));
			}
		}
		
		public function get slideBoxSize():Number
		{
			return slideBox.width;
		}
		
		public function set slideBoxSize(value:Number):void
		{
			slideBox.width = value;
		}
		
		public function get slideBarSize():Number
		{
			return width;
		}
		
		public function get slideBoxPosition():Number
		{
			return slideBox.x;
		}
		
		public function set slideBoxPosition(value:Number):void
		{
			if (slideBox.x != value)
			{
				slideBox.x = value;
				fixSlideBoxPosition();
				
				if (m_onChange != null)
					m_onChange();
					
				dispatchEvent(new Event(Event.CHANGE));
			}
		}
		
		protected function fixSlideBoxPosition():void
		{
			if (slideBoxPosition + slideBoxSize > slideBarSize)
				slideBoxPosition = slideBarSize - slideBoxSize;
				
			if (slideBoxPosition < 0)
				slideBoxPosition = 0;
		}
		
		protected function get KeyCode1():uint
		{
			return 39;
		}
		
		protected function get KeyCode2():uint
		{
			return 37;
		}
		
		protected function get mousePosition():Number
		{
			return stage.mouseX;
		}
		
		protected function getMouseLocalPosition(event:MouseEvent):Number
		{
			return event.localX;
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
			if (m_minValue != value && value <= maxValue)
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
			if (m_maxValue != value && value >= minValue)
			{
				m_maxValue = value;
				invalidate("maxValue");
			}
		}
		
		public function get value():Number
		{
			var t:Number = Math.round((slideBoxPosition / (slideBarSize - slideBoxSize)) * 100) * 0.01;
			
			return (maxValue - minValue) * t + minValue;
		}
		
		public function set value(v:Number):void
		{
			var t:Number = Math.round(((v - minValue) / (maxValue - minValue)) * 100) * 0.01;
			
			slideBoxPosition = (slideBarSize - slideBoxSize) * t;
			
			invalidate("value");
			
			dispatchEvent(new Event(Event.CHANGE));
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
		
		public function get slideBar():Control
		{
			return m_slideBar;
		}
		
		public function set slideBar(value:Control):void
		{
			if (m_slideBar != value)
			{
				if (m_slideBar)
					removeChild(m_slideBar);
					
				m_slideBar = value;
				addChild(value);
			}
		}
		
		public function get onChange():Function
		{
			return m_onChange;
		}
		
		public function set onChange(value:Function):void
		{
			m_onChange = value;
		}
	}
}