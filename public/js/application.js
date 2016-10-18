$(document).ready(function() {


	$(".upvote_form").submit(function(e) {
		// console.log( $(this).serialize() );
		// console.log( $(this).attr("method") );
		// console.log( $(this).attr("action") );
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

				$('#bla_' + object[2]).html('Up Votes: ' + object[1]);
				if (object[0] === true) { // the vote has been casted by user and will change the value of box to indicate to remove vote
					console.log("good")
					$('#upvote_box_' + object[2]).html(
						'<button type=submit class="btn btn-primary"><span class="glyphicon glyphicon-remove"> Remove up vote</span></button>');}
					// '<input type=submit value="Remove up vote">');}
				else {
					console.log("nice")
					$('#upvote_box_' + object[2]).html(
						'<button type=submit class="btn btn-primary"><span class="glyphicon glyphicon-thumbs-up"> Up vote</span></button>');
					// '<input type=submit value="Up vote">');
				};
				// 	$('#bla').html(count);
				// $('#upvote_box').html(
				// 	'<input type=submit value="Vote down" >'
			}
			// end of success
		});
		// end of ajax(upvote)
	});
	// end of submit

	$(".downvote_form").submit(function(e) {
		e.preventDefault();

		$.ajax({
			type: $(this).attr("method"),
			url: $(this).attr("action"),
			data: $(this).serialize(),
			dataType: "json",

			success: function(array){
				console.log(array);

				$('#dvt_' + array[2]).html(' | Down Votes: ' + array[1]);
				if (array[0] ===true) {
					console.log("voted, now change to remove")
					$('#downvote_box_' + array[2]).html(
						'<button type=submit class="btn btn-primary"><span class="glyphicon glyphicon-remove"> Remove your Down vote</span></button>'
					);}
        else {
        	console.log("have not voted, change to add")
        	$('#downvote_box_' + array[2]).html(
        		'<button type=submit class="btn btn-primary"><span class="glyphicon glyphicon-thumbs-down"> Down vote</span></button>'
        		);
        };
			}
			// end of success
		});
		// end of ajax(downvote)
	});
	// end of submit













});
// end of ready

