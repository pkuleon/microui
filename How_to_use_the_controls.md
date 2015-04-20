## The config object ##

All of the controls in MicroUI. Can use a config object to set init value.

The usage like this:

```
var button1:Button = new Button({
    x:20,
    y:20,
    owner:this,
    textSize: 11,
    skin: new ButtonSkin(),
    icon: new icons.Accept(),
    text: "This is a button"
});
```

Of course, you can use the controls in normal way, if you don't like the config object style.

This normal way to create control:

```
var button1:Button = new Button(null);
button1.x = 20;
button1.y = 20;
button1.textSize = 11;
button1.skin = new ButtonSkin();
button1.icon = new icons.Accept();
button1.text = "This is a button";
			
addChild(button1);
```

Control inherit config field support from base class because it's a constructor parameter.
But control can override the config field to make invalid or add some new field support.
So know what config fileds a control support is very important.

I will list the supported config fields of each control in MicroUI.

To Be Continue....