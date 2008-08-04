package com.maxlab.microUI.core 
{
	import com.maxlab.microUI.managers.InvalidationManager;
	import com.maxlab.microUI.skins.Skin;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	* The controls' base class.
	* Every control object in your program must have a skin to display.
	* 
	* @author BG5SBK
	*/
	public class Control extends Sprite
	{
		private var m_initialized:Boolean = false;
		
		private var m_id:String = null;
		private var m_enable:Boolean = true;
		
		private var m_skin:Skin = null;
		private var m_width:Number = 0;
		private var m_height:Number = 0;
		
		public function Control(config:*) 
		{
			if (config)
			{
				if (config.x != null)
					x = config.x;
					
				if (config.y != null)
					y = config.y;
					
				if (config.id != null)
					id = config.id;
				
				if (config.enable != null)
					enable = config.enable;
					
				if (config.skin != null)
					skin = config.skin;
					
				if (config.size != null)
				{
					width = config.size[0];
					height = config.size[1];
				}
				
				if (config.width != null)
					width = config.width;
				
				if (config.height != null)
					height = config.height;
					
				if (config.owner != null)
					config.owner.addChild(this);
				
				if (config.childs != null && config.childs is Array)
				{
					for (var i:int; i < config.childs.length; i++)
					{
						addChild(config.childs[i]);
					}
				}
			}
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			InvalidationManager.registerToStage(stage);
			initialize();
		}
		
		protected function invalidate(...name:Array) :void
		{
			for (var i:int = 0; i < name.length; i++)
			{
				InvalidationManager.invalidate(this, name[i]);
			}
		}
		
		protected final function initialize():void
		{
			if (m_initialized)
				return;
				
			initializeSelf();
			initializeChilds();
			
			m_initialized = true;
		}
		
		protected function initializeSelf():void
		{
		}
		
		protected function initializeChilds():void
		{
			for (var i:int = 0; i < numChildren; i++)
			{
				var child:DisplayObject = getChildAt(i);
				
				if (child)
				{
					if(child is Control && !Control(child).initialized)
					{
						Control(child).initialize();
					}
					else if(child is Skin && !Skin(child).initialized)
					{
						Skin(child).initialize();
					}
				}
			}
		}
		
		public function get id():String
		{
			return m_id;
		}
		
		public function set id(value:String):void
		{
			m_id = value;
		}
		
		public function get enable():Boolean
		{
			return m_enable;
		}
		
		public function set enable(value:Boolean):void
		{
			if (m_enable != value)
			{
				m_enable = value;
				invalidate("enable");
			}
		}
		
		public function get owner():Control
		{
			return parent as Control;
		}
		
		public function get initialized():Boolean
		{
			return m_initialized;
		}
		
		public function get skin():Skin
		{ 
			return m_skin;
		}
		
		public function set skin(value:Skin):void
		{
			if (m_skin) 
				this.removeChild(m_skin);
			
			m_skin = value;
			addChildAt(m_skin, 0);
			
			invalidate("skin");
		}
		
		override public function get width():Number 
		{ 
			return m_width; 
		}
		
		override public function set width(value:Number):void
		{ 
			if (m_width != value)
			{
				m_width = value;
				invalidate("width", "layout", "size");
				
				if (owner)
					owner.invalidate("layout");
			}
		}
		
		override public function get height():Number 
		{ 
			return m_height; 
		}
		
		override public function set height(value:Number):void 
		{ 
			if (m_height != value)
			{
				m_height = value;
				invalidate("height", "layout", "size");
				
				if (owner)
					owner.invalidate("layout");
			}
		}
		
		override public function addChild(child:DisplayObject):DisplayObject 
		{
			return addChildAt(child, numChildren);
		}
		
		override public function addChildAt(child:DisplayObject, index:int):DisplayObject 
		{
			if (child)
			{
				var formerParent:DisplayObjectContainer = child.parent;
				
				if (formerParent && !(formerParent is Loader))
					formerParent.removeChild(child);
				
				if (initialized && child is Control && !Control(child).initialized)
					Control(child).initialize();
				
				invalidate("layout","addChild");
					
				return super.addChildAt(child, index);
			}
			
			return child;
		}
		
		override public function removeChild(child:DisplayObject):DisplayObject 
		{
			return removeChildAt(getChildIndex(child));
		}
		
		override public function removeChildAt(index:int):DisplayObject 
		{
			invalidate("layout","removeChild");
			
			return super.removeChildAt(index);
		}
	}
}