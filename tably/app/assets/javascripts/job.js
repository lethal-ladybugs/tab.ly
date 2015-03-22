window.onload = function() {


	function imageClick() {

		var $likeButton = $('#like');
		var $dislikeButton = $('#dislike');
		var checkedHeart = '/assets/heart.png';
		var uncheckedHeart = '/assets/unchecked_heart.png';
		var checkedX = '/assets/x_checked.png';
		var uncheckedX = '/assets/x_unchecked.png';

		$likeButton.on('click', function(){
			$('#button_true').trigger('click');
			$('#like').attr('src', checkedHeart);
			$('#dislike').attr('src', uncheckedX);
		});

		$dislikeButton.on('click', function(){
			$('#button_false').trigger('click');
			$('#dislike').attr('src', checkedX);
			$('#like').attr('src', uncheckedHeart);
		});
	};
	imageClick();
}

	