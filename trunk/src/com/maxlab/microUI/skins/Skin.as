package com.maxlab.microUI.skins
{
	import com.maxlab.microUI.core.Control;
	import flash.display.Sprite;
	
	/**
	* 控件皮肤的基类，继承此类并重写paint方法以实现针对具体控件的皮肤样式。
	* 注意：重写paint方法时如果不使用super.paint(invalideItems);调用基类的paint方法，
	* 会使控件失去从基类继承的布局控制。
	* 
	* @author BG5SBK
	*/
	public class Skin extends Sprite
	{
		/**
		 * 当前皮肤对象的所有者
		 */
		public function get owner() : Control
		{
			return parent as Control;
		}
		
		/**
		 * 此方法用重新绘制皮肤。
		 * 注意：请不要在控件或任何代码中直接调用此方法，而应该使用控件的invalidate方法使控件失效，
		 * MicroUI将统一对失效的控件进行重绘，统一的失效控件重绘机制用于避免重复的GUI重绘带来的性能损失执行效率。
		 * 
		 * @param	invalidateItems	当前皮肤所有者失效的内容
		 */
		public function paint(invalidateItems:Array):void
		{
			if(invalidateItems.indexOf("width") >= 0 
			|| invalidateItems.indexOf("height") >= 0 
			|| invalidateItems.indexOf("addChild") >= 0 
			|| invalidateItems.indexOf("removeChild") >= 0
			|| invalidateItems.indexOf("layout") >= 0)
				owner.layoutChilds();
		}
	}
}