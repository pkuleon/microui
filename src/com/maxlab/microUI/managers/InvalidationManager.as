package com.maxlab.microUI.managers 
{
	import com.maxlab.microUI.core.Control;
	import com.maxlab.microUI.core.IContainer;
	import flash.display.Stage;
	import flash.events.Event;
	
	/**
	* Manage the invalidated controls and redraw them together.
	* Use by MicroUI inner, you should not use it.
	* 
	* NOTE: Don't direct call the skin's paint function in your control. 
	* When the control's property changed and you want to redraw the control. Just use the
	* invalidate function to tell MicroUI this control object's property was invalidated.
	* And MicroUI will invoke all the invalidated controls' skin to redraw, at the same time.
	* In Flex they call it 'Invalidate Mechanism'. It will avoid controls frequently redraw.
	* 
	* @author BG5SBK
	*/
	public class InvalidationManager 
	{
		private static var s_inited:Boolean = false;
		private static var s_invalidateItems:Array = null;
		private static var s_currenInvalidateItemArray:Number = 0;
		
		public static function registerToStage(stage:Stage):void
		{
			if (!s_inited)
			{
				s_inited = true;
				stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			}
		}
		
		private static function onEnterFrame(event:Event):void
		{
			validate();
		}
		
		private static function get invalidateItems() :Array
		{
			if (!s_invalidateItems)
			{
				s_invalidateItems = new Array();
				s_invalidateItems.push(new Array());
				s_invalidateItems.push(new Array());
			}
			
			return s_invalidateItems[s_currenInvalidateItemArray];
		}
		
		public static function invalidate(target:Control, name:String):void
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
	}
}