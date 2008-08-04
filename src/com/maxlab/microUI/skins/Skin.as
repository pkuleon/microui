package com.maxlab.microUI.skins
{
	import com.maxlab.microUI.core.Control;
	import flash.display.Sprite;
	
	/**
	* The control skin's base class.
	* Inherit Skin class and override paint function to implement yoursler's control skin.
	* 
	* NOTE: Don't direct call the skin's paint function in your control. 
	* When the control's property changed and you want to redraw the control. Just use the
	* invalidate function to tell MicroUI this control object's property was invalidated.
	* And MicroUI will invoke all the invalidated controls' skin to redraw, at the same time.
	* In Flex they call it 'Invalidate Mechanism'. It will avoid controls frequently redraw.
	* 
	* @author BG5SBK
	*/
	public class Skin extends Sprite
	{
		private var m_initialized:Boolean = false;
		
		/**
		 * Current skin's owner control
		 */
		public function get owner() : Control
		{
			return parent as Control;
		}
		
		public function get initialized():Boolean
		{
			return m_initialized;
		}
		
		public function set initialized(value:Boolean):void
		{
			m_initialized = value;
		}
		
		public function initialize():void
		{
			initialized = true;
		}
		
		/**
		* This function execute skin's redraw.
		* 
		* NOTE: Don't direct call the skin's paint function in your control. 
		* When the control's property changed and you want to redraw the control. Just use the
		* invalidate function to tell MicroUI this control object's property was invalidated.
		* And MicroUI will invoke all the invalidated controls' skin to redraw, at the same time.
		* In Flex they call it 'Invalidate Mechanism'. It will avoid controls frequently redraw.
		* 
		* @param	invalidateItems
		* This parameter be used to notify skin what items invalidated in the control.
		* For example, if the 'width' invalidated, the skin may redraw the control's border.
		* You can use invalidateItems.indexOf("width") >= 0 to check the width is invalidate or not.
		* 
		*/
		public function paint(invalidateItems:Array):void
		{
		}
	}
}