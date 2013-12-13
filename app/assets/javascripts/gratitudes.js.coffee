# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	csrf = $('meta[name="csrf-token"]').attr('content')

	if $('#gratitude_form').length
		$('.action-of-day').on 'click', '.submit-button', (e) ->

			$('.total-cells-num').html(parseInt($('.total-cells-num').html(), 10)+100)

			# show brain points animation and light up brain
			$("body").append("<div class='points-anime'>100</div>")
			$(".points-anime").animate
				fontSize: "150px"
			, 2000, ->
				$(".points-anime").animate
					fontSize: "18px"
					, 1000, ->
						$(".points-anime").fadeOut()
						$('.your-brain').after("<div class='brain-activity-1 brain-activity-gratitude'></div>")
						$('.brain-activity-gratitude').hide().fadeIn()

			gratitudeBody = $('#gratitude_text').val()
			if gratitudeBody != ''
				$.ajax
					type: 'post'
					url: "/gratitudes.json"
					data:
					  authenticity_token: csrf
					  body: gratitudeBody
					success: (res) ->
						console.log res
						if res.success
							$('.action-of-day').replaceWith(res.html)



