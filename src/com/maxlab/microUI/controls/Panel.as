﻿package com.maxlab.microUI.controls 
{
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.core.ControlAlign;
	import com.maxlab.microUI.core.ControlLayout;
	import com.maxlab.microUI.core.IContainer;
	import com.maxlab.microUI.skins.Skin;
	import flash.display.DisplayObject;
	
	/**
	* The panel control. The penel control in MicroUI is like the Flex's LayoutContainer.
	* It can contain and layout the child controls.
	* 
	* @author BG5SBK
	*/
	public class Panel extends Control implements IContainer
	{
		private var m_autoSize:Boolean = false;
		
		private var m_layout:String = ControlLayout.ABSOLUTE;
		
		private var m_verticalGap:Number = 3;
		private var m_verticalAlign:String = ControlAlign.TOP;
		
		private var m_horizontalGap:Number = 3;
		private var m_horizontalAlign:String = ControlAlign.CENTER;
		
		private var m_paddingTop:Number = 0;
		private var m_paddingLeft:Number = 0;
		private var m_paddingRight:Number = 0;
		private var m_paddingBottom:Number = 0;
		
		public function Panel(config:*) 
		{
			if (config)
			{
				if (config.autoSize)
					autoSize = config.autoSize;
				if(config.layout)
					layout = config.layout;
				
				if (config.vGap)
					verticalGap = config.vGap;
					
				if (config.vAlign)
					verticalAlign = config.vAlign;
				
				if (config.hGap)
					horizontalGap = config.hGap;
			
				if (config.hAlign)
					horizontalAlign = config.hAlign;
					
				if (config.verticalGap)
					verticalGap = config.verticalGap;
					
				if (config.verticalAlign)
					verticalAlign = config.verticalAlign;
					
				if (config.horizontalGap)
					horizontalGap = config.horizontalGap;
					
				if (config.horizontalAlign)
					horizontalAlign = config.horizontalAlign;
					
				if (config.padding)
				{
					paddingTop = config.padding[0];
					paddingRight = config.padding[1];
					paddingBottom = config.padding[2];
					paddingLeft = config.padding[3];
				}
				
				if (config.paddingTop)
					paddingTop = config.paddingTop;
					
				if (config.paddingLeft)
					paddingLeft = config.paddingLeft;
					
				if (config.paddingRight)
					paddingRight = config.paddingRight;
					
				if (config.paddingBottom)
					paddingBottom = config.paddingBottom;
			}
			super(config);
		}
		
		public function layoutChilds():void
		{
			switch(layout)
			{
				case ControlLayout.HORIZONTAL:
					autoSizeH();
					trace("layout:" + id);
					
					switch(horizontalAlign)
					{
						case ControlAlign.LEFT:
							layoutHL();
							break;
						case ControlAlign.RIGHT:
							layoutHR();
							break;
						default:
							layoutHC();
					}
					break;
				case ControlLayout.VERTICAL:
					autoSizeV();
					
					switch(verticalAlign)
					{
						case ControlAlign.TOP:
							layoutVT();
							break;
						case ControlAlign.BOTTOM:
							layoutVB();
							break;
						default:
							layoutVM();
					}
					break;
				default:
					autoSizeA();
					break;
			}
		}
		
		private function autoSizeA():void
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
		
		private function autoSizeV():void
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
		
		private function autoSizeH():void
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
		
		private function layoutHL():void
		{
			var nextX:Number = paddingLeft;
					
			for (var i:int = 0; i < numChildren; i++)
			{
				var child:DisplayObject = getChildAt(i);
						
				if (child && !(child is Skin))
				{
					child.x = nextX;
					nextX = nextX + child.width + horizontalGap;
					
					if (verticalAlign == ControlAlign.TOP)
						child.y = paddingTop;
					else if (verticalAlign == ControlAlign.BOTTOM)
						child.y = paddingBottom;
					else
						child.y = (height - child.height) / 2;
				}
			}
		}
		
		private function layoutHR():void
		{
			var nextX:Number = width - paddingRight;
			
			for (var i:int = numChildren - 1; i >= 0; i--)
			{
				var child:DisplayObject = getChildAt(i);
				
				if (child && !(child is Skin))
				{
					if (i == numChildren - 1)
						nextX -= child.width;
					else
						nextX = nextX - horizontalGap - child.width;
					
					child.x = nextX;
					
					if (verticalAlign == ControlAlign.TOP)
						child.y = paddingTop;
					else if (verticalAlign == ControlAlign.BOTTOM)
						child.y = paddingBottom;
					else
						child.y = (height - child.height) / 2;
				}
			}
		}
		
		public function get numControl():Number
		{
			if (skin)
				return numChildren - 1;
			else
				return numChildren;
		}
		
		private function layoutHC():void
		{
			if (numControl == 0)
				return;
			
			var centerIndex:Number = -1;
			var centerChild:DisplayObject;
			var left:Number;
			var right:Number;
			
			if (numControl % 2 != 0)
			{
				centerIndex = Math.round(numControl / 2);
					
				if (centerIndex >= 0)
				{
					centerChild = getChildAt(centerIndex);
					
					if (centerChild)
					{
						centerChild.x = (width - centerChild.width) / 2;
						
						if (verticalAlign == ControlAlign.TOP)
							centerChild.y = paddingTop;
						else if (verticalAlign == ControlAlign.BOTTOM)
							centerChild.y = paddingBottom;
						else
							centerChild.y = (height - centerChild.height) / 2;
					}
				}
				
				left = centerIndex - 1;
				right = centerIndex + 1;
			}
			else
			{
				left = numControl / 2;
				right = numControl / 2 + 1;
				
				if (!skin)
				{
					left --;
					right --;
				}
			}
			
			if (left > 0)
			{
				var lastX:Number;
				
				if(centerChild)
					lastX = centerChild.x;
				else
					lastX = width / 2 - horizontalGap / 2;
				
				for (var i:int = left; i >= 1; i--)
				{
					var lChild:DisplayObject = getChildAt(i);
					
					if (lChild)
					{
						if (!centerChild && i == left)
							lChild.x = lastX - lChild.width;
						else
							lChild.x = lastX - horizontalGap - lChild.width;
							
						lastX = lChild.x;
						
						if (verticalAlign == ControlAlign.TOP)
							lChild.y = paddingTop;
						else if (verticalAlign == ControlAlign.BOTTOM)
							lChild.y = paddingBottom;
						else
							lChild.y = (height - lChild.height) / 2;
					}
				}
			}
			
			if (right < numChildren)
			{
				var nextX:Number;
				
				if(centerChild)
					nextX = centerChild.x + centerChild.width + horizontalGap;
				else
					nextX = width / 2 + horizontalGap / 2;
				
				for (var j:int = right; j < numChildren; j++)
				{
					var rChild:DisplayObject = getChildAt(j);
					
					if (rChild)
					{
						rChild.x = nextX;
						
						nextX += rChild.width + horizontalGap;
						
						if (verticalAlign == ControlAlign.TOP)
							rChild.y = paddingTop;
						else if (verticalAlign == ControlAlign.BOTTOM)
							rChild.y = paddingBottom;
						else
							rChild.y = (height - rChild.height) / 2;
					}
				}
			}
		}
		
		private function layoutVT():void
		{
			
		}
		
		private function layoutVB():void
		{
			
		}
		
		private function layoutVM():void
		{
			
		}
		
		public function get autoSize():Boolean
		{
			return m_autoSize;
		}
		
		public function set autoSize(value:Boolean):void
		{
			if (m_autoSize != value)
			{
				m_autoSize = value;
				invalidate("layout","autoSize");
			}
		}
		
		public function get layout():String 
		{ 
			return m_layout; 
		}
		
		public function set layout(value:String):void
		{
			if (m_layout != value)
			{
				m_layout = value;
				invalidate("layout");
			}
		}
		
		public function get verticalGap():Number
		{
			return m_verticalGap;
		}
		
		public function set verticalGap(value:Number):void
		{
			m_verticalGap = value;
			invalidate("layout","verticalGap");
		}
		
		public function get verticalAlign():String
		{
			return m_verticalAlign;
		}
		
		public function set verticalAlign(value:String):void
		{
			m_verticalAlign = value;
			invalidate("layout","verticalAlign");
		}
		
		public function get horizontalGap():Number
		{
			return m_horizontalGap;
		}
		
		public function set horizontalGap(value:Number):void
		{
			m_horizontalGap = value;
			invalidate("layout","horizontalGap");
		}
		
		public function get horizontalAlign():String
		{
			return m_horizontalAlign;
		}
		
		public function set horizontalAlign(value:String):void
		{
			m_horizontalAlign = value;
			invalidate("layout","horizontalAlign");
		}
		
		public function get paddingTop():Number
		{
			return m_paddingTop;
		}
		
		public function set paddingTop(value:Number):void
		{
			m_paddingTop = value;
			invalidate("layout","paddingTop");
		}
		
		public function get paddingLeft():Number
		{
			return m_paddingLeft;
		}
		
		public function set paddingLeft(value:Number):void
		{
			m_paddingLeft = value;
			invalidate("layout","paddingLeft");
		}
		
		public function get paddingRight():Number
		{
			return m_paddingRight;
		}
		
		public function set paddingRight(value:Number):void
		{
			m_paddingRight = value;
			invalidate("layout","paddingRight");
		}
		
		public function get paddingBottom():Number
		{
			return m_paddingBottom;
		}
		
		public function set paddingBottom(value:Number):void
		{
			m_paddingBottom = value;
			invalidate("layout","paddingBottom");
		}
	}
}