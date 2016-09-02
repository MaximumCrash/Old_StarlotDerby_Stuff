Thank you for purchase Tweenline Animation Engine

I hope you enjoy it as much as I enjoy making it.


First of all:
	1 - Import all included files into any Game Maker project (if you haven't done already)
	2 - Right click into any of the included files and select "Open in Explorer".
	3 - Copy all files to a secure folder outside game maker (for backup)
	
To view the demo files: 
	4 - File > New
	5 - Import. And select "Tweenline_demo_project.gmz" (from the included files you make the backup in the 3rd step)
	6 - Click import.
	
To Import the basic tweenline SDK extension into your project:
	7 - Open your existing project or create a new empty project
	8 - Drag the "tweenline.gmez" into the Game Maker Window. (from the included files you make the backup in the 3rd step)
	9 - Right click in the extension, click "Import Resources", "Import All", "ok".
	10 - Enjoy! (Check tween_to script to create your first tween)
	

That's all.

TWEENLINE DOCUMENTATION: http://ciberman.net/tweenline/docs

TWEENLINE SUPPORT: http://ciberman.net/tweenline/contact

INFO FOR RUSIAN USERS: For a reason outside my limits, the domain ciberman.net cannot be accesed from some IPs from Rusia. So, to see the tweenline online documentation you can use a special browser like "TOR Browser" (https://www.torproject.org/) or check the offline documentation inside the coments of 
EACH script in the extension. Sorry for the inconvenience. I will try to change this in the future. 

___________________________________________

>>> CHANGELOG: What is new in this version? 

== Version 1.1.4 == 
* Added new example to demo project: two ways to tween a background. 
* Fixed "Undefined variable" in cv_clear_object
* Fixed bug with tween smart colour recognition system when passing the setter script reference 


== Version 1.1.3 == 
* Fixed small memory leaks with the tween argument parser and the tweenline creation functions (Thanks Leonid Tikhomirov for reporting it). If you use a lot of tweens in your game you SHOULD update right now.
* Added two advanced functions: tween_system_get_setter_script() and tween_system_get_var_script().
* Fixed a small text order error inside the demo example. 
* Improved the order inside the code of some private functions.


== Version 1.1.2 ==
* Fixed small bug with Windows YYC in the ___private functions. 


== Version 1.1.1 == 
* Fixed a bug where the last frame of a tween was not rendered when the room_speed was too low.
* Now tween_to/from/fromto supports an array of instances or objects as "target" argument.


== Version 1.1.0 == 
* Added the instance_select_* functions: instance_select_array(), instance_select_sort(), instance_select_numb(), instance_select_filter() and instance_select_filter_sort().
* Added one example, showing the functionality of instance_select_filter_sort();
* Added optional parameter waves_amount in ALL staggers functions. Now, you can group instances in "waves" to generate groups of staggers.
* tween_stagger_* and tweenline_stagger_* functions now uses internally instance_select_array as a method to get the instances to tween.
* Added tween_progress(), tweenline_seek() and tweenline_progress().
* Docs updated with the new functions.
* Improved the order inside the extension file
* Improved the tweenline example. Now it shows the code on-screen.
* Minor bug fixing.


== Version 1.0.1 == 
* Added a patch for a GM bug when exporting extensions. 
* Added a patch (please report if the problem persist) a division by zero bug in older versions of Game Maker Studio in the basic buttons engine.
* Improved the order inside the extension file
* Added this README.txt file


== Version 1.0.0 == 
* Initial Version






