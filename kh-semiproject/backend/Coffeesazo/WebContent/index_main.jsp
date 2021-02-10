<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="view/css/bootstrap.min.css">
<link rel="stylesheet" href="view/css/index.css" type="text/css">    
</head>
<body>
        <div class='main'>
            <!-- slider 시작 -->
            <div class="silder-cover"></div>
            <div class="slider" id="main-slider">
                <!-- outermost container element -->

                <div class="slider-wrapper">
                    <!-- innermost wrapper element -->
                    <img src="view/img/7-1.png" alt="First" class="slide" /><!-- slides -->
                    <img src="view/img/4-1.png" alt="Second" class="slide" />
                    <img src="view/img/5.png" alt="Third" class="slide" />
                </div>
            </div>
        </div>

        <!-- hastag 링크 걸기 -->
        <div class='hashtag'>
            <div class="title">
                <h2>키워드로 상품을 찾아보세요!</h2>
            </div>
            <div class="hashtag-box">
                <div class="tag"><a href='wholebean'>#풍부한산미</a></div>
                <div class="tag"><a href='wholebean#tag_body'>#묵직한바디감</a></div>
                <div class="tag"><a href='wholebean#tag_latin'>#중남미원두</a></div>
                <div class="tag"><a href='wholebean#tag_africa'>#아프리카원두</a></div>
            </div>
            <div class="hashtag-box">
                <div class="tag"><a href='stickcoffee'>#쉽고간편한</a></div>
                <div class="tag"><a href='capsulecoffee'>#룽고</a></div>
            </div>
        </div>
    
   

    <!-- slider script -->
    <script>
        (function () {

            function Slideshow(element) {
                this.el = document.querySelector(element);
                this.init();
            }

            Slideshow.prototype = {
                init: function () {
                    this.wrapper = this.el.querySelector(".slider-wrapper");
                    this.slides = this.el.querySelectorAll(".slide");
                    this.previous = this.el.querySelector(".slider-previous");
                    this.next = this.el.querySelector(".slider-next");
                    this.index = 0;
                    this.total = this.slides.length;
                    this.timer = null;

                    this.action();
                    this.stopStart();
                },
                _slideTo: function (slide) {
                    var currentSlide = this.slides[slide];
                    currentSlide.style.opacity = 1;

                    for (var i = 0; i < this.slides.length; i++) {
                        var slide = this.slides[i];
                        if (slide !== currentSlide) {
                            slide.style.opacity = 0;
                        }
                    }
                },
                action: function () {
                    var self = this;
                    self.timer = setInterval(function () {
                        self.index++;
                        if (self.index == self.slides.length) {
                            self.index = 0;
                        }
                        self._slideTo(self.index);

                    }, 4000);
                },
                stopStart: function () {
                    var self = this;
                    self.el.addEventListener("mouseover", function () {
                        clearInterval(self.timer);
                        self.timer = null;

                    }, false);
                    self.el.addEventListener("mouseout", function () {
                        self.action();

                    }, false);
                }

            };

            document.addEventListener("DOMContentLoaded", function () {
                var slider = new Slideshow("#main-slider");

            });


        })();
    </script>
</body>
</html>