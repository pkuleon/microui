﻿package com.maxlab.microUI.core 
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
		private static var s_invalidateItems:Array;
		private static var s_currenInvalidateItemArray:Number = 0;
		
		private var m_initialized:Boolean = false;
		
		private var m_skin:Skin;
		private var m_width:Number;
		private var m_height:Number;
		private var m_autoSize:Boolean;
		
		private var m_layout:String = ControlLayout.ABSOLUTE;
		
		private var m_verticalGap:Number = 3;
		private var m_verticalAlign:String = ControlAlign.TOP;
		
		private var m_horizontalGap:Number = 3;
		private var m_horizontalAlign:String = ControlAlign.CENTER;
		
		private var m_paddingTop:Number = 0;
		private var m_paddingLeft:Number = 0;
		private var m_paddingRight:Number = 0;
		private var m_paddingBottom:Number = 0;
		
		public function Control(config:*) 
		{
			if (config)
			{
				if (config.x)
					x = config.x;
					
				if (config.y)
					y = config.y;
					
				if (config.skin)
					skin = config.skin;
					
				if (config.width)
					width = config.width;
				
				if (config.height)
					height = config.height;
					
				if (config.autoSize)
					autoSize = config.autoSize;
					
				if (config.owner)
					config.owner.addChild(this);
				
				if(config.layout)
					layout = config.layout;
				
				if (config.verticalGap)
					verticalGap = config.verticalGap;
					
				if (config.verticalAlign)
					verticalAlign = config.verticalAlign;
				
				if (config.horizontalGap)
					horizontalGap = config.horizontalGap;
				
				if (config.horizontalAlign)
					horizontalAlign = config.horizontalAlign;
					
				if (config.paddingTop)
					paddingTop = config.paddingTop;
					
				if (config.paddingLeft)
					paddingLeft = config.paddingLeft;
					
				if (config.paddingRight)
					paddingRight = config.paddingRight;
					
				if (config.paddingBottom)
					paddingBottom = config.paddingBottom;
					
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
				if (invalidateItems[i].target == target)
				{
					index = i;
					break;
				}
			}
			
			if (index < 0)
			{
				index = 0;
				invalidateItems.push( { target:target, names:new Array() } );
			}
			
			if(invalidateItems[index].names.indexOf(name) < 0)
				invalidateItems[index].names.push(name);
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
					
					if(item.names.indexOf("width") >= 0 
					|| item.names.indexOf("height") >= 0
					|| item.names.indexOf("layout") >= 0
					|| item.names.indexOf("autoSize") >= 0
					|| item.names.indexOf("addChild") >= 0 
					|| item.names.indexOf("removeChild") >= 0
					|| item.names.indexOf("paddingTop") >= 0 
					|| item.names.indexOf("paddingLeft") >= 0
					|| item.names.indexOf("paddingRight") >= 0
					|| item.names.indexOf("paddingBottom") >=0)
						Control(item.target).layoutChilds();
					
					if(Control(item.target).skin)
						Control(item.target).skin.paint(item.names);
						
					var c:Number = item.names.length;
						
					for (var j:int; j < c; j++)
						item.names.pop();
				}
			}
		}
		
		protected function invalidate(name:String) :void
		{
			Control.addInvalidateItem(this, name);
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
		
		public function get autoSize():Boolean
		{
			return m_autoSize;
		}
		
		public function set autoSize(value:Boolean):void
		{
			m_autoSize = value;
			invalidate("autoSize");
		}
		
		public function get layout():String 
		{ 
			return m_layout; 
		}
		
		public function set layout(value:String):void
		{
			m_layout = value;
			invalidate("layout");
		}
		
		public function layoutChilds():void
		{
			if (layout == ControlLayout.HORIZONTAL)
			{
				autoSizeForHorizontal();
			}
			else if (layout == ControlLayout.VERTICAL)
			{
				autoSizeForVertical();
			}
			else 
				autoSizeForAbsolute();
		}
		
		private function autoSizeForAbsolute():void
		{
			if(autoSize)
			{
				var maxX:Number = 0;
				var maxY:Number = 0;
				
				for (var i:int = 0; i < numChildren; i++)
				{
					var child:DisplayObject = getChildAt(i);
					
					if (child && !(child is Skin))
					{
						if(child.x && child.width && child.x + child.width > maxX)
							maxX = child.x + child.width;
					
						if (child.y && child.height && child.y + child.height > maxY)
							maxY = child.y + child.height;
					}
				}
				
				width = maxX;
				height = maxY;
			}
		}
		
		private function autoSizeForVertical():void
		{
			if (autoSize)
			{
				var maxWidth:Number = 0;
				var totalHeight:Number = 0;
					
				for (var i:int = 0; i < numChildren; i++)
				{
					var child:DisplayObject = getChildAt(i);
						
					if (child && !(child is Skin))
					{
						if (child.width && child.width > maxWidth)
							maxWidth = child.width;
							
						if (child.height)
							totalHeight += child.height;
								
						if (i < numChildren - 1)
							totalHeight += verticalGap;
					}
				}
					
				width = maxWidth + paddingLeft + paddingRight;
				height = totalHeight + paddingTop + paddingBottom;
			}
		}
		
		private function autoSizeForHorizontal():void
		{
			if (autoSize)
			{
				var totalWidth:Number = 0;
				var maxHeight:Number = 0;
						
				for (var i:int=0; i < numChildren; i++)
				{
					var child:DisplayObject = getChildAt(i);
							
					if (child && !(child is Skin))
					{
						if (child.width)
							totalWidth += child.width;
						
						if (i < numChildren -1)
							totalWidth += horizontalGap;
						
						if (child.height && child.height > maxHeight)
							maxHeight = child.height;
					}
				}
				
				width = totalWidth + paddingLeft + paddingRight;
				height = maxHeight + paddingTop + paddingBottom;
			}
		}
		
		public function get verticalGap():Number
		{
			return m_verticalGap;
		}
		
		public function set verticalGap(value:Number):void
		{
			m_verticalGap = value;
			invalidate("verticalGap");
		}
		
		public function get verticalAlign():String
		{
			return m_verticalAlign;
		}
		
		public function set verticalAlign(value:String):void
		{
			m_verticalAlign = value;
			invalidate("verticalAlign");
		}
		
		public function get horizontalGap():Number
		{
			return m_horizontalGap;
		}
		
		public function set horizontalGap(value:Number):void
		{
			m_horizontalGap = value;
			invalidate("horizontalGap");
		}
		
		public function get horizontalAlign():String
		{
			return m_horizontalAlign;
		}
		
		public function set horizontalAlign(value:String):void
		{
			m_horizontalAlign = value;
			invalidate("horizontalAlign");
		}
		
		public function get paddingTop():Number
		{
			return m_paddingTop;
		}
		
		public function set paddingTop(value:Number):void
		{
			m_paddingTop = value;
			invalidate("paddingTop");
		}
		
		public function get paddingLeft():Number
		{
			return m_paddingLeft;
		}
		
		public function set paddingLeft(value:Number):void
		{
			m_paddingLeft = value;
			invalidate("paddingLeft");
		}
		
		public function get paddingRight():Number
		{
			return m_paddingRight;
		}
		
		public function set paddingRight(value:Number):void
		{
			m_paddingRight = value;
			invalidate("paddingRight");
		}
		
		public function get paddingBottom():Number
		{
			return m_paddingBottom;
		}
		
		public function set paddingBottom(value:Number):void
		{
			m_paddingBottom = value;
			invalidate("paddingBottom");
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
				invalidate("width");
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
				invalidate("height");
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
	}
}