package com.maxlab.microUI.controls 
{
	
	/**
	* The LinkLabel Control.
	* 
	* @author BG5SBK
	*/
	public class LinkLabel extends Label
	{
		private var m_url:String;
		
		public function LinkLabel(config:*) 
		{
			super(config);
			
			if (config)
			{
				if (config.url != null)
					url = config.url;
			}
		}
		
		public function get url():String
		{
			return m_url;
		}
		
		public function set url(value:String):void
		{
			m_url = value;
			
			textField.htmlText = '<a href="' + url + '">' + textField.text + "</a>";
		
			invalidate("url", "text");
		}
		
		override protected function createTextField():void 
		{
			super.createTextField();
			
			textField.mouseEnabled = true;
		}
	}
}