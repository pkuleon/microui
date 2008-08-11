package com.maxlab.microUI.core 
{
	import com.maxlab.microUI.managers.InvalidationManager;
	import com.maxlab.microUI.skins.Skin;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.Stage;
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
		private var m_percentWidth:Number = 0;
		private var m_percentHeight:Number = 0;
		
		public function Control(config:*) 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
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
					
				if (config.pWidth != null)
					percentWidth = config.pWidth;
					
				if (config.pHeight != null)
					percentHeight = config.pHeight;
					
				if (config.percentWidth != null)
					percentWidth = config.percentWidth;
					
				if (config.percentHeight != null)
					percentHeight = config.percentHeight;
					
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
		}
		
		private function onAddedToStage(event:Event):void
		{
			InvalidationManager.registerToStage(stage);
			parent.addEventListener(Event.RESIZE, onParentResize);
			initialize();
		}
		
		private function onParentResize(event:Event):void
		{
			if(percentWidth || percentHeight)
			{
				invalidate("size", "layout");
				dispatchEvent(new Event(Event.RESIZE));
			}
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
		
		public function get percentWidth():Number
		{
			return m_percentWidth;
		}
		
		public function set percentWidth(value:Number):void
		{
			if (percentWidth != value)
			{
				m_percentWidth = value;
				invalidate("size", "layout");
				
				if (parent is IContainer)
					owner.invalidate("layout");
			}
		}
		
		public function get percentHeight():Number
		{
			return m_percentHeight;
		}
		
		public function set percentHeight(value:Number):void
		{
			if (percentHeight != value)
			{
				m_percentHeight = value;
				invalidate("size", "layout");
				
				if (parent is IContainer)
					owner.invalidate("layout");
			}
		}
		
		override public function get width():Number 
		{ 
			if (percentWidth && parent is IContainer && IContainer(parent).layout != ControlLayout.ABSOLUTE)
			{
				var hopeWidth:Number = parent.width * percentWidth - IContainer(parent).paddingLeft - IContainer(parent).paddingRight;
				
				if (IContainer(parent).layout == ControlLayout.VERTICAL)
					return hopeWidth;
				
				var seatWidth:Number = parent.width - IContainer(parent).paddingLeft - IContainer(parent).paddingRight;
				var percentBrotherNum:Number = 0;
				
				for (var i:int = 0; i < parent.numChildren; i++)
				{
					var brother:DisplayObject = parent.getChildAt(i);
					
					if (brother && !(brother is Skin) && brother is Control)
					{
						if(brother != this && !Control(brother).percentWidth)
							seatWidth = seatWidth - brother.width;
						else
							percentBrotherNum ++;
							
						if (i < parent.numChildren - 1)
							seatWidth = seatWidth - IContainer(parent).horizontalGap;
					}
				}
				
				seatWidth = seatWidth / percentBrotherNum;
				
				if (seatWidth < hopeWidth)
					return seatWidth;
					
				return hopeWidth;
			}
			
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
			if (percentHeight && parent is IContainer && IContainer(parent).layout != ControlLayout.ABSOLUTE)
			{
				var hopeHeight:Number = parent.height * percentHeight - IContainer(parent).paddingTop - IContainer(parent).paddingBottom;
				
				if (IContainer(parent).layout == ControlLayout.HORIZONTAL)
					return hopeHeight;
					
				var seatHeight:Number = parent.height - IContainer(parent).paddingTop - IContainer(parent).paddingBottom;
				var percentBrotherNum:Number = 0;
				
				for (var i:int = 0; i < parent.numChildren; i++)
				{
					var brother:DisplayObject = parent.getChildAt(i);
					
					if (brother && !(brother is Skin) && brother is Control)
					{
						if (brother != this && !Control(brother).percentHeight)
							seatHeight = seatHeight - brother.height;
						else
							percentBrotherNum ++;
							
						if (i < parent.numChildren - 1)
							seatHeight = seatHeight - IContainer(parent).verticalGap;
					}
				}
				
				seatHeight = seatHeight / percentBrotherNum;
				
				if (seatHeight < hopeHeight)
					return seatHeight;
					
				return hopeHeight;
			}
			
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