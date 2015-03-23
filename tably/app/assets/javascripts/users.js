
console.log('linked');

$button = $('#hello');
$upload = $('#user_avatar');

$button.on('click', function() {
	$('#user_avatar').trigger('click');
})