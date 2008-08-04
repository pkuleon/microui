package com.maxlab.microUI.controls 
{
	import com.maxlab.microUI.core.ControlAlign;
	import com.maxlab.microUI.core.ControlLayout;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	
	/**
	* The TextBox control.
	* 
	* @author BG5SBK
	*/
	public class TextBox extends Label
	{
		private var m_readOnly:Boolean = false;
		
		public function TextBox(config:*) 
		{
			if (!config)
				config = { };
			
			config.autoSize = false;
			
			if(config.text == null)
				config.text = "";
			
			if(config.width == null)
				config.width = 130;
			
			if(config.height == null)
				config.height = 25;
				
			if (config.padding == null
			&& config.paddingTop == null
			&& config.paddingLeft == null
			&& config.paddingRight == null
			&& config.paddingBottom == null)
				config.padding = [3, 4, 2, 4];
			
			super(config);
				
			if (config.readOnly != null)
				readOnly = config.readOnly;
				
			if (config.passwordMode != null)
				passwordMode = config.passwordMode;
		}
		
		override protected function initializeSelf():void 
		{
			textField.selectable = true;
			textField.mouseEnabled = true;
			
			if(enable && !readOnly)
				textField.type = TextFieldType.INPUT;
			else
				textField.type = TextFieldType.DYNAMIC;
				
			textField.autoSize = TextFieldAutoSize.NONE;
			textField.width = width - paddingLeft - paddingRight;
			textField.height = height - paddingTop - paddingBottom;
			
			if (icon)
				textField.width = textField.width - horizontalGap - icon.width;
			
			invalidate("layout");
		}
		
		override public function get layout():String 
		{ 
			return ControlLayout.HORIZONTAL;
		}
		
		override public function get horizontalAlign():String 
		{ 
			return ControlAlign.LEFT;
		}
		
		override public function get verticalAlign():String 
		{ 
			return ControlAlign.MIDDLE;
		}
		
		override public function set enable(value:Boolean):void 
		{
			if (enable != value)
			{
				super.enable = value;
				
				if (enable)
					textField.type = TextFieldType.INPUT;
				else
					textField.type = TextFieldType.DYNAMIC;
			}
		}
		
		public function get readOnly():Boolean
		{
			return m_readOnly;
		}
		
		public function set readOnly(value:Boolean):void
		{
			if (m_readOnly != value)
			{
				m_readOnly = value;
				
				if (readOnly)
					textField.type = TextFieldType.DYNAMIC;
				else
					textField.type = TextFieldType.INPUT;
			}
		}
		
		public function get passwordMode():Boolean
		{
			return textField.displayAsPassword;
		}
		
		public function set passwordMode(value:Boolean):void
		{
			textField.displayAsPassword = value;
		}
	}
}