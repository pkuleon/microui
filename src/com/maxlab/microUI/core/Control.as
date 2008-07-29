package com.maxlab.microUI.core 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	* All UI control's base class
	* @author DaDa
	*/
	public class Control extends Sprite
	{
		private var m_width:Number;
		private var m_height:Number;
		private var m_skin:ControlSkin;
		private var m_mouseState:MouseState;
		
		public function Control(config:ControlConfig) 
		{
			if (config)
			{
				if (config.owner)
					owner.addChild(this);
					
				if (config.width)
					m_width = config.width;
				
				if (config.height)
					m_height = config.height;
					
				if (config.skin)
				{
					m_skin = config.skin;
					addChild(m_skin);
				}
				
				if (config.childs)
				{
					for (var i:int; i < m_childs.length; i++)
					{
						addChild(m_childs[i]);
					}
				}
			}
			
			m_mouseState = new MouseState();
				
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			if (autoManageMouse)
			{
				stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
				this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
				this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
				this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
				this.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			}
		}
		
		protected function onMouseUp(event:MouseEvent):void
		{
			m_mouseState.isMouseDown = false;
			m_mouseState.lastX = stage.mouseX;
			m_mouseState.lastY = stage.mouseY;
			paint();
		}
		
		protected function onMouseOut(event:MouseEvent):void
		{
			m_mouseState.isMouseOn = false;
			m_mouseState.lastX = stage.mouseX;
			m_mouseState.lastY = stage.mouseY;
			paint();
		}
		
		protected function onMouseDown(event:MouseEvent):void
		{
			m_mouseState.isMouseDown = true;
			m_mouseState.lastX = stage.mouseX;
			m_mouseState.lastY = stage.mouseY;
			paint();
		}
		
		protected function onMouseOver(event:MouseEvent):void
		{
			m_mouseState.isMouseOn = true;
			m_mouseState.lastX = stage.mouseX;
			m_mouseState.lastY = stage.mouseY;
			paint()
		}
		
		protected function onMouseMove(event:MouseEvent):void
		{
			m_mouseState.lastX = stage.mouseX;
			m_mouseState.lastY = stage.mouseY;
			paint();
		}
		
		override public function get width():Number { return m_width; }
		override public function set width(value:Number):void
		{ 
			m_height = value;
			paint(true);
		}
		
		override public function get height():Number { return m_height; }
		override public function set height(value:Number):void 
		{ 
			m_width = value;
			paint(true);
		}
		
		override public function addChildAt(child:DisplayObject, index:int):DisplayObject 
		{
			var result:DisplayObject = super.addChildAt(child, index);
			
			paint();
			
			return result;
		}
		
		override public function removeChildAt(index:int):DisplayObject 
		{
			var child:DisplayObject = super.removeChildAt(index);
			
			paint();
			
			return child;
		}
		
		public function get skin():ControlSkin { return m_skin; }
		
		public function set skin(value:ControlSkin):void
		{
			if (m_skin)
				this.removeChild(m_skin);
				
			m_skin = value;
			
			addChild(m_skin);
		}
		
		public function get owner():UICompent
		{
			return parent as UICompent;
		}
		
		public function get autoManageMouse():Boolean { return false; }
		
		public function get mouseState():MouseState { return m_mouseState; }
		
		public function paint(force:Boolean = false):void
		{
			if (m_skin)
				m_skin.paint(force);
				
			for (var i:int = 0; i < numChildren; i++)
			{
				var child:UICompent = getChildAt(i) as UICompent;
				
				if(child)
					child.paint(force);
			}
		}
	}
}