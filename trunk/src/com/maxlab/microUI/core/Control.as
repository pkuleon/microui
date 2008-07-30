package com.maxlab.microUI.core 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	* All UI control's base class
	* @author BG5SBK
	*/
	public class Control extends Sprite
	{
		private var m_initialized:Boolean = false;
		
		private var m_width:Number;
		private var m_height:Number;
		private var m_skin:ControlSkin;
		
		private var m_invlidateSizeFlag:Boolean = false;
		private var m_invlidatePropertiesFlag:Boolean = false;
		private var m_invlidateDisplayListFlag:Boolean = false;
		
		public function Control(config:ControlConfig) 
		{
			if (config)
			{
				if (config.owner)
					owner.addChild(this);
					
				if (config.width)
					width = config.width;
				
				if (config.height)
					height = config.height;
					
				if (config.skin)
					skin = config.skin;
				
				if (config.childs)
				{
					for (var i:int; i < m_childs.length; i++)
					{
						addChild(m_childs[i]);
					}
				}
			}
				
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			m_initialized = true;
			invlidateDisplayList();
		}
		
		override public function get width():Number 
		{ 
			return m_width; 
		}
		override public function set width(value:Number):void
		{ 
			m_height = value;
			invlidateProperties();
		}
		
		override public function get height():Number 
		{ 
			return m_height; 
		}
		override public function set height(value:Number):void 
		{ 
			m_width = value;
			invlidateProperties();
		}
		
		override public function addChildAt(child:DisplayObject, index:int):DisplayObject 
		{
			var formerParent:DisplayObjectContainer = child.parent;
			
			if (formerParent && !(formerParent is Loader))
				formerParent.removeChild(child);
				
			invlidateDisplayList();
				
			return super.addChildAt(child, index);
		}
		
		override public function removeChildAt(index:int):DisplayObject 
		{
			invlidateDisplayList();
			
			return super.removeChildAt(index);
		}
		
		public function get owner():UICompent
		{
			return parent as UICompent;
		}
		
		public function get initialized():Boolean
		{
			return m_initialized;
		}
		
		public function get skin():ControlSkin 
		{ 
			return m_skin; 
		}
		public function set skin(value:ControlSkin):void
		{
			if (m_skin)
				this.removeChild(m_skin);
				
			m_skin = value;
			addChild(m_skin);
			
			invlidateDisplayList();
		}
		
		protected function invlidateSize() :void
		{
			m_invlidateSizeFlag = true;
		}
		
		protected function invlidateProperties() :void
		{
			m_invlidatePropertiesFlag = true;
		}
		
		protected function invlidateDisplayList():void
		{
			m_invlidateDisplayListFlag = true;
		}
		
		public function paint(force:Boolean = false):void
		{
			if (initialized)
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
}