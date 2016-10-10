$(document).ready(function() {


	$("#upvote_form").submit(function(e) {
		console.log( $(this).serialize() );
		console.log( $(this).attr("method") );
		console.log( $(this).attr("action") );
		e.preventDefault();

		$.ajax({
			type: $(this).attr("method"),
			url: $(this).attr("action"),
			data: $(this).serialize(),
// 			//Serialize a form to a query string that could be sent
// 			//to a server in an Ajax request.
// 			//http[://api.jquery.com/serialize/
			dataType: "json",

			success: function(object){

				console.log(object);

				$('#bla').html('Up Votes: ' + object[1]);
				if (object[0] === true) { // the vote has been casted by user and will change the value of box to indicate to remove vote
					console.log("good")
				$('#upvote_box').empty().append(
					'<input type=submit value="Remove up vote">');}
				else {
					console.log("nice")
					$('#upvote_box').empty().append(
					'<input type=submit value="Up vote">');
					};
					

				// 	$('#bla').html(count);
				// $('#upvote_box').empty().append(
				// 	'<input type=submit value="Vote down" >'
				// }
			}
			// end of success
			
// end of ajax
		});
	});

});

// $("#results").empty().append(myHtml);