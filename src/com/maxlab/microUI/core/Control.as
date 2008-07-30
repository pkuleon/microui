package com.maxlab.microUI.core 
{
	import com.maxlab.microUI.skins.Skin;
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
		private static var s_invalidateItems:Array;
		
		private var m_initialized:Boolean = false;
		
		private var m_skin:Skin;
		private var m_width:Number;
		private var m_height:Number;
		
		public function Control(config:*) 
		{
			if (config)
			{
				if (config.x)
					x = config.x;
					
				if (config.y)
					y = config.y;
					
				if (config.width)
					width = config.width;
				
				if (config.height)
					height = config.height;
					
				if (config.skin && config.skin is Skin)
					skin = config.skin;
					
				if (config.owner && config.owner is Control)
					config.owner.addChild(this);
				
				if (config.childs && config.childs is Array)
				{
					for (var i:int; i < config.childs.length; i++)
					{
						addChild(config.childs[i]);
					}
				}
			}
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			if (!s_invalidateItems)
			{
				s_invalidateItems = new Array();
				addEventListener(Event.ENTER_FRAME, onEnterFrame);
			}
		}
		
		private function onAddedToStage(event:Event):void
		{
			initialize();
		}
		
		private static function onEnterFrame(event:Event):void
		{
			Validate();
		}
		
		private static function Invalidate(target:Control, name:String):void
		{
			var index:Number = -1;
			
			for (var i:int = 0; i < s_invalidateItems.length; i++)
			{
				if (s_invalidateItems[i].target == target)
				{
					index = i;
					break;
				}
			}
			
			if (index < 0)
			{
				index = 0;
				s_invalidateItems.push( { target:target, names:new Array() } );
			}
			
			s_invalidateItems[index].names.push(name);
		}
		
		private static function Validate():void
		{
			if (s_invalidateItems.length > 0)
			{
				var count:Number = s_invalidateItems.length;
				
				for (var i:int = 0; i < count; i++)
				{
					var item:* = s_invalidateItems.pop();
					
					if(Control(item.target).skin)
						Control(item.target).skin.paint(item.names);
						
					var c:Number = item.names.length;
						
					for (var j:int; j < c; j++)
						item.names.pop();
				}
			}
		}
		
		override public function get width():Number 
		{ 
			return m_width; 
		}
		
		override public function set width(value:Number):void
		{ 
			m_width = value;
			invalidate("width");
		}
		
		override public function get height():Number 
		{ 
			return m_height; 
		}
		
		override public function set height(value:Number):void 
		{ 
			m_height = value;
			invalidate("height");
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
				
				invalidate("addChild");
					
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
			invalidate("removeChild");
			
			return super.removeChildAt(index);
		}
		
		protected final function initialize():void
		{
			if (m_initialized)
				return;
				
			initializeSelf();
			initializeChilds();
			
			m_initialized = true;
			
			invalidate("initialize");
		}
		
		protected function initializeSelf():void
		{
		}
		
		protected function initializeChilds():void
		{
			for (var i:int; i < numChildren; i++)
			{
				var child:Control = getChildAt(i) as Control;
				
				if (child && !child.initialized)
				{
					child.initialize();
				}
			}
		}
		
		protected function invalidate(name:String) :void
		{
			Control.Invalidate(this, name);
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
			addChild(m_skin);
			
			invalidate("skin");
		}
	}
}