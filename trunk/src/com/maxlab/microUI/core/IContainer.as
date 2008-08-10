package com.maxlab.microUI.core 
{
	
	/**
	* Control implement this interface to present a Container.
	* The layoutChilds method will auto invoke before MicroUI redraw a Control.
	* 
	* @author BG5SBK
	*/
	public interface IContainer 
	{
		function layoutChilds():void;
		function get paddingTop():Number;
		function get paddingLeft():Number;
		function get paddingRight():Number;
		function get paddingBottom():Number;
	}
}