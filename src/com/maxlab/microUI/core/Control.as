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
	* The controls' base class.
	* Every control object in your program must have a skin to display.
	* 
	* @author BG5SBK
	*/
	public class Control extends Sprite
	{
		private static var s_invalidateItems:Array = null;
		private static var s_currenInvalidateItemArray:Number = 0;
		
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
				if (config.x)
					x = config.x;
					
				if (config.y)
					y = config.y;
					
				if (config.id)
					id = config.id;
				
				if (!isNaN(config.enable))
					enable = config.enable;
					
				if (config.skin)
					skin = config.skin;
					
				if (config.size)
				{
					width = config.size[0];
					height = config.size[1];
				}
				
				if (config.width)
					width = config.width;
				
				if (config.height)
					height = config.height;
					
				if (config.owner)
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
				s_invalidateItems.push(new Array());
				s_invalidateItems.push(new Array());
				addEventListener(Event.ENTER_FRAME, onEnterFrame);
			}
		}
		
		private function onAddedToStage(event:Event):void
		{
			initialize();
		}
		
		private static function onEnterFrame(event:Event):void
		{
			validate();
		}
		
		private static function get invalidateItems() :Array
		{
			return s_invalidateItems[s_currenInvalidateItemArray];
		}
		
		private static function addInvalidateItem(target:Control, name:String):void
		{
			var index:Number = -1;
			
			for (var i:int = 0; i < invalidateItems.length; i++)
			{
				if (invalidateItems[i].t == target)
				{
					index = i;
					break;
				}
			}
			
			if (index < 0)
			{
				index = invalidateItems.length;
				invalidateItems.push( { t:target, n:new Array() } );
			}
			
			if(invalidateItems[index].n.indexOf(name) < 0)
				invalidateItems[index].n.push(name);
		}
		
		private static function validate():void
		{
			if (invalidateItems.length > 0)
			{
				var items:Array = invalidateItems;
				var count:Number = invalidateItems.length;
				
				s_currenInvalidateItemArray = (s_currenInvalidateItemArray + 1) % 2;
				
				for (var i:int = 0; i < count; i++)
				{
					var item:* = items.pop();
					
					if (item.t is IContainer)
					{
						if(item.n.indexOf("layout") >= 0)
							IContainer(item.t).layoutChilds();
					}
					
					if(Control(item.t).skin)
						Control(item.t).skin.paint(item.n);
						
					var c:Number = item.n.length;
						
					for (var j:int; j < c; j++)
						item.n.pop();
				}
			}
		}
		
		protected function invalidate(...name:Array) :void
		{
			for (var i:int = 0; i < name.length; i++)
			{
				Control.addInvalidateItem(this, name[i]);
			}
		}
		
		protected final function initialize():void
		{
			trace(this);
			
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
			for (var i:int = 0; i < numChildren; i++)
			{
				var child:Control = getChildAt(i) as Control;
				
				if (child && !child.initialized)
				{
					child.initialize();
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
				invalidate("width","layout","size");
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
				invalidate("height","layout","size");
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