window.onload = function() {


	function imageClick() {

		var $likeButton = $('#like');
		var $dislikeButton = $('#dislike');
		var checkedHeart = '/assets/heart.png';
		var uncheckedHeart = '/assets/unchecked_heart.png';

		$likeButton.on('click', function(){
			$('#button_true').trigger('click');
			$('#like').attr('src', checkedHeart);
		});

		$dislikeButton.on('click', function(){
			$('#button_false').trigger('click');
			$('#like').attr('src', uncheckedHeart);
		});
	};

	imageClick();
}

	