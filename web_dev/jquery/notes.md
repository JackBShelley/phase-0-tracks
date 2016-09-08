Step 1. Google it!
Step 2. Start with videos for jquery basic
Step 3. I'll probably have questions so keep looking stuff up
-Take break in 45 min intervals


I actually ended up just watching this channel
s https://www.youtube.com/channel/UCVTlvUkGslCV_h-nSAId8Sw jquery tutorials for about an hour and a half, then spent a good while trying to get jquery to work.
The videos were extremely informative though, and i practiced sort of the basics of it in release 2. Despite being really basic, it definitely helped with my jquery uderstanding. 

Syntax:

<div>

	html stuff

</div>

<script src="/Users/Jack/node_modules/jquery/dist/jquery.js "></script>

<script>
	$(document).ready(function() {

		//example code
		$('thing').fadeOut(1000).delay(1000).slideDown(1000);

		//event
		$('thing').on('click', function() {
			//action
		})

	});

</script>


Dom traversal

$('li')		all lists
$('li').first()
$('li').first().eq(0)	shows at that index
$('li:first').children 

https://jqueryui.com/toggle/

