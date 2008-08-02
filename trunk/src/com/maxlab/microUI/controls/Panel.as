package com.maxlab.microUI.controls 
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
				if (config.autoSize != null)
					autoSize = config.autoSize;
					
				if(config.layout != null)
					layout = config.layout;
				
				if (config.vGap != null)
					verticalGap = config.vGap;
					
				if (config.vAlign != null)
					verticalAlign = config.vAlign;
				
				if (config.hGap != null)
					horizontalGap = config.hGap;
			
				if (config.hAlign != null)
					horizontalAlign = config.hAlign;
					
				if (config.verticalGap != null)
					verticalGap = config.verticalGap;
					
				if (config.verticalAlign != null)
					verticalAlign = config.verticalAlign;
					
				if (config.horizontalGap != null)
					horizontalGap = config.horizontalGap;
					
				if (config.horizontalAlign != null)
					horizontalAlign = config.horizontalAlign;
					
				if (config.padding != null)
				{
					paddingTop = config.padding[0];
					paddingRight = config.padding[1];
					paddingBottom = config.padding[2];
					paddingLeft = config.padding[3];
				}
				
				if (config.paddingTop != null)
					paddingTop = config.paddingTop;
					
				if (config.paddingLeft != null)
					paddingLeft = config.paddingLeft;
					
				if (config.paddingRight != null)
					paddingRight = config.paddingRight;
					
				if (config.paddingBottom != null)
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
						child.y = height - paddingBottom - child.height;
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
						child.y = height - paddingBottom - child.height;
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
				
			var totalWidth:Number = 0;
			
			for (var i:int = 0; i < numChildren; i++)
			{
				var child:DisplayObject = getChildAt(i);
				
				if (child && !(child is Skin))
				{
					if(child.width)
						totalWidth += child.width;
						
					if (i < numChildren - 1)
						totalWidth += horizontalGap;
				}
			}
			
			var nextX:Number = (width - totalWidth) / 2;
			
			for (var j:int = 0; j < numChildren; j++)
			{
				var child2:DisplayObject = getChildAt(j);
				
				if (child2 && !(child2 is Skin))
				{
					child2.x = nextX;
					nextX += child2.width + horizontalGap;
					
					if (verticalAlign == ControlAlign.TOP)
						child2.y = paddingTop;
					else if (verticalAlign == ControlAlign.BOTTOM)
						child2.y = height - paddingBottom - child2.height;
					else
						child2.y = (height - child2.height) / 2;
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