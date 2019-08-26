<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="${contextPath }/resources/css/qnatabstyle.css" />
<script type="text/javascript" src="${contextPath }/resources/js/qnatab.js"></script>
<script type="text/javascript" src="${contextPath }/resources/js/textextands.js"></script>
<script type="text/javascript">
	$(function() {
		var slideHeight = 50; // 최소 보여질 텍스트 세로폭(단위 px)
		var defHeight = $('#wrap').height();
		if (defHeight >= slideHeight) {
			$('#wrap').css('height', slideHeight + 'px');
			$('#read-more').append('<a href="#">..더 보기</a>');
			$('#read-more a').click(function() {
				var curHeight = $('#wrap').height();
				if (curHeight == slideHeight) {
					$('#wrap').animate({
						height : defHeight
					}, "normal");
					$('#read-more a').html('닫기');
					$('#gradient').fadeOut();
				} else {
					$('#wrap').animate({
						height : slideHeight
					}, "normal");
					$('#read-more a').html('..더 보기');
					$('#gradient').fadeIn();
				}
				return false;
			});
		}
	});
</script>

<title>qna</title>
<!-- QnA -->
</head>
<body>

	<div class="container">
		<section class="tabs">
			<input id="tab-1" type="radio" name="radio-set"
				class="tab-selector-1" checked="checked" /> <label for="tab-1"
				class="tab-label-1">방문펫시터</label> <input id="tab-2" type="radio"
				name="radio-set" class="tab-selector-2" /> <label for="tab-2"
				class="tab-label-2">가정펫시터</label> <input id="tab-3" type="radio"
				name="radio-set" class="tab-selector-3" /> <label for="tab-3"
				class="tab-label-3">서비스가격</label> <input id="tab-4" type="radio"
				name="radio-set" class="tab-selector-4" /> <label for="tab-4"
				class="tab-label-4">펫시터지원</label> <input id="tab-5" type="radio"
				name="radio-set" class="tab-selector-5" /> <label for="tab-5"
				class="tab-label-5">기타</label>


			<div class="clear-shadow"></div>

			<div class="content">
				<div class="content-1">
					<h2>About us</h2>
					<p id="wrap">You think water moves fast? You should see ice. It
						moves like it has a mind. Like it knows it killed the world once
						and got a taste for murder. After the avalanche, it took us a week
						to climb out. Now, I don't know exactly when we turned on each
						other, but I know that seven of us survived the slide... and only
						five made it out. Now we took an oath, that I'm breaking now. We
						said we'd say it was the snow that killed the other two, but it
						wasn't. Nature is lethal but it doesn't hold a candle to man.</p>
					<h2>How we work</h2>
					<p id="wrap">Like you, I used to think the world was this great
						place where everybody lived by the same standards I did, then some
						kid with a nail showed me I was living in his world, a world where
						chaos rules not order, a world where righteousness is not
						rewarded. That's Cesar's world, and if you're not willing to play
						by his rules, then you're gonna have to pay the price.</p>
					<div id="gradient"></div>
					<div id="read-more"></div>
				</div>


				<div class="content-2">
					<h2>Services</h2>
					<p>Do you see any Teletubbies in here? Do you see a slender
						plastic tag clipped to my shirt with my name printed on it? Do you
						see a little Asian child with a blank expression on his face
						sitting outside on a mechanical helicopter that shakes when you
						put quarters in it? No? Well, that's what you see at a toy store.
						And you must think you're in a toy store, because you're here
						shopping for an infant named Jeb.</p>
					<h3>Excellence</h3>
					<p>Like you, I used to think the world was this great place
						where everybody lived by the same standards I did, then some kid
						with a nail showed me I was living in his world, a world where
						chaos rules not order, a world where righteousness is not
						rewarded. That's Cesar's world, and if you're not willing to play
						by his rules, then you're gonna have to pay the price.</p>
				</div>
				<div class="content-3">
					<h2>Portfolio</h2>
					<p>The path of the righteous man is beset on all sides by the
						iniquities of the selfish and the tyranny of evil men. Blessed is
						he who, in the name of charity and good will, shepherds the weak
						through the valley of darkness, for he is truly his brother's
						keeper and the finder of lost children. And I will strike down
						upon thee with great vengeance and furious anger those who would
						attempt to poison and destroy My brothers. And you will know My
						name is the Lord when I lay My vengeance upon thee.</p>
					<h3>Examples</h3>
					<p>Now that we know who you are, I know who I am. I'm not a
						mistake! It all makes sense! In a comic, you know how you can tell
						who the arch-villain's going to be? He's the exact opposite of the
						hero. And most times they're friends, like you and me! I should've
						known way back when... You know why, David? Because of the kids.
						They called me Mr Glass.</p>
				</div>
				<div class="content-4">
					<h2>Contact</h2>
					<p>You see? It's curious. Ted did figure it out - time travel.
						And when we get back, we gonna tell everyone. How it's possible,
						how it's done, what the dangers are. But then why fifty years in
						the future when the spacecraft encounters a black hole does the
						computer call it an 'unknown entry event'? Why don't they know? If
						they don't know, that means we never told anyone. And if we never
						told anyone it means we never made it back. Hence we die down
						here. Just as a matter of deductive logic.</p>
					<h3>Get in touch</h3>
					<p>Well, the way they make shows is, they make one show. That
						show's called a pilot. Then they show that show to the people who
						make shows, and on the strength of that one show they decide if
						they're going to make more shows. Some pilots get picked and
						become television programs. Some don't, become nothing. She
						starred in one of the ones that became nothing.</p>
				</div>
				<div class="content-5">
					<h2>웅앵</h2>
					<p>이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이
						웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이
						웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵</p>
					<h3>Get in touch</h3>
					<p>이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이
						웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이
						웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵 이거슨 어쩌구저쩌구 큐엔에이 웅앵웅앵</p>
				</div>
			</div>
		</section>
	</div>
</body>
</html>