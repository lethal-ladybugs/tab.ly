
console.log('linked');
$button = $('#hello');
$upload = $('input:file');

$button.on('change', function() {
	$upload.trigger('click');
})


