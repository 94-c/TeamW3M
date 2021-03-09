jQuery(document).ready(function() {
	/* ���� �����̵� */
	jQuery(".contentslider-main").sliderkit({
		auto:1, /* 0 : Ŭ���ϸ� ����, 1 : �ڵ� ���� */
		circular:1,
		navitemshover:false,
		panelfx:"fading", // fading , sliding, none ��밡��
		panelfxfirst:"none",
		panelfxeasing:"easeInOutExpo",
		keyboard:1,
		autospeed: 6000
	});

    /* ��Ϲ�� */
    jQuery(".contentslider-look").sliderkit({
        auto:1, /* 0 : Ŭ���ϸ� ����, 1 : �ڵ� ���� */
        tabs:1,
        circular:1,
        panelfx:"sliding", // fading , sliding, none ��밡��
        panelfxfirst:"none",
        panelfxeasing:"easeInCubic",
        fastchange:0,
        keyboard:1,
        autospeed:6000
    });

    /* �����󿵿� */
        jQuery(".contentslider-tab").sliderkit({
        auto:0, /* 0 : Ŭ���ϸ� ����, 1 : �ڵ� ���� */
        autospeed:6000, // ��ȯ�ӵ�
        tabs:3,
        navitemshover:true, // true:���콺 ������ ����. false:���콺 Ŭ���� ����
        circular:1,
        panelfx:"fading", // fading , sliding, none ��밡��
        panelfxfirst:"none",
        panelfxeasing:"easeInCubic",
        panelfxspeed:200, //��ȯȿ���ӵ�
        fastchange:1,
        keyboard:1
    });

	/* morenvy.com ���콺������ǰ ���̾� */
	$('.fade').mosaic();
});


jQuery(".tab01").mouseover(function() {
	stopYoutube1();
});
jQuery(".tab02").mouseover(function() {
	stopYoutube1();
});
jQuery(".tab03").mouseover(function() {
	stopYoutube1();
});

/* morenvy.com ��Ʃ�� ����� */
var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var player1;
var player2;
var player3;
function onYouTubeIframeAPIReady() {
	player1 = new YT.Player('video1', {
		height: '400',            // ����ũ��
		width: '710',             // ����ũ��
		videoId: 'KmCJCZHE1eY',   // ������1 ���̵�
		origin : 'welkeeps.com',
		playerVars: {             
		controls: '2'
		}
	});

	player2 = new YT.Player('video2', {
		height: '400',            
		width: '710',             
		videoId: 'yVIwI8Iosto',   // ������2 ���̵�
		origin : 'welkeeps.com',
		playerVars: {             
		controls: '2'
		}
	});
}

function onPlayerReady(event) {
	event.target.playVideo();	
}

function stopYoutube1() {
	player1.seekTo(0, true);     
	player1.stopVideo();
	player2.seekTo(0, true);     
	player2.stopVideo();
	player3.seekTo(0, true);     
	player3.stopVideo();
}


var bannerFunc = function(){
    $('.promoBanner .btnClose').bind("click", function(){
        $('.promoBanner').animate({height: 0}, 500);
    });
};
$(function($){
    bannerFunc();
});
