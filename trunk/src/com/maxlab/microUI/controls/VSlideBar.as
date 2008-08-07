package com.maxlab.microUI.controls 
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	* The Vertical SlideBar control.
	* 
	* @author BG5SBK
	*/
	public class VSlideBar extends HSlideBar
	{
		public function VSlideBar(config:*) 
		{
			super(config);
		}
		
		override public function get slideBoxSize():Number 
		{ 
			return slideBox.height; 
		}
		
		override public function set slideBoxSize(value:Number):void
		{
			slideBox.height = value;
		}
		
		override public function get slideBarSize():Number 
		{ 
			return height; 
		}
		
		override public function get slideBoxPosition():Number 
		{ 
			return slideBox.y;
		}
		
		override public function set slideBoxPosition(value:Number):void 
		{
			if (slideBox.y != value)
			{
				slideBox.y = value;
				dispatchEvent(new Event(Event.CHANGE));
			}
		}
		
		override protected function get mousePosition():Number 
		{ 
			return stage.mouseY;
		}
		
		override protected function getMouseLocalPosition(event:MouseEvent):Number 
		{
			return event.localY;
		}
	}
}