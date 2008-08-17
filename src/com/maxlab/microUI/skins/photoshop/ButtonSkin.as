package com.maxlab.microUI.skins.photoshop 
{
	import com.maxlab.microUI.controls.Button;
	import flash.display.CapsStyle;
	import flash.display.GradientType;
	import flash.display.JointStyle;
	import flash.display.Shape;
	import flash.geom.Matrix;
	
	/**
	* ...
	* @author BG5SBK
	*/
	public class ButtonSkin extends LabelSkin
	{
		private var m_border:Shape;
		private var m_background:Shape;
		
		private var m_normalTextColor:Number;
		
		override public function initialize():void 
		{
			m_background = new Shape();
			m_border = new Shape();
				
			addChild(m_background);
			addChild(m_border);
			
			super.initialize();
		}
		
		override public function paint(invalidateItems:Array):void 
		{
			super.paint(invalidateItems);
			
			var needRedraw:Boolean = false;
			
			if (invalidateItems.indexOf("size") >= 0
			|| invalidateItems.indexOf("focusFlag") >= 0
			|| invalidateItems.indexOf("mouseInFlag") >= 0
			|| invalidateItems.indexOf("mouseDownFlag") >= 0)
			{
				needRedraw = true;
			}
			else if (invalidateItems.indexOf("enable") >=  0)
			{
				if(owner.enable)
					Button(owner).textField.textColor = 0xFFFFFF;
				else
					Button(owner).textField.textColor = 0xAAB3B3;
					
				needRedraw = true;
			}
			
			if (needRedraw)
			{
				if (owner.enable)
				{
					if (Button(owner).mouseDownFlag)
						paintMouseDownMode();
					else if (Button(owner).mouseInFlag)
						paintMouseOnMode();
					else
						paintNormalMode();
				}
				else
					paintDisableMode();
			}
		}
		
		private function paintDisableMode():void
		{
		}
		
		private function paintNormalMode():void
		{
			if (!ownerInToolBar)
			{
				var m:Matrix = new Matrix();
				m.createGradientBox(owner.width, (owner.height - 6)*3, Math.PI / 2, 0, 0);
				
				m_background.graphics.clear();
				m_background.graphics.beginGradientFill(GradientType.LINEAR, [0x686868, 0x5A5A5A], [1, 1], [0, 127], m);
				m_background.graphics.drawRect(3, 3, owner.width - 6, owner.height - 6);
				m_background.graphics.endFill();
			
				m_border.graphics.clear();
				m_border.graphics.lineStyle(1, 0x616161, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
				m_border.graphics.drawRect(0, 0, owner.width - 1, owner.height - 1);
				m_border.graphics.lineStyle(1, 0x242424, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
				m_border.graphics.drawRect(1, 1, owner.width - 3, owner.height - 3);
				m_border.graphics.lineStyle(1, 0x757575, 1, false, "normal", CapsStyle.NONE, JointStyle.MITER);
				m_border.graphics.drawRect(2, 2, owner.width - 5, owner.height - 5);
			}
			else
			{
				m_background.graphics.clear();
				m_border.graphics.clear();
			}
		}
		
		private function paintMouseOnMode():void
		{
			if (!ownerInToolBar)
			{
				var m:Matrix = new Matrix();
				m.createGradientBox(owner.width, (owner.height - 6)*3, Math.PI / 2, 0, 0);
					
				m_background.graphics.clear();
				m_background.graphics.beginGradientFill(GradientType.LINEAR, [0x777777, 0x5B5B5B], [1, 1], [0, 127], m);
				m_background.graphics.drawRect(3, 3, owner.width - 6, owner.height - 6);
				m_background.graphics.endFill();
			}
			else
			{
				m_background.graphics.clear();
				m_background.graphics.beginFill(0x777777);
				m_background.graphics.drawRect(1, 1, owner.width - 2, owner.height - 2);
				m_background.graphics.endFill();
			}
		}
		
		private function paintMouseDownMode():void
		{
		}
	}
	
}