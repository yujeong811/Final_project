<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Rater Js Example</title>
</head>
<body>
 
<h1>Rater Js Example</h1> 
<a href="https://fredolss.github.io/rater-js/">Back to home page</a>
<h2>Basic 5 star rater</h2>

<div id="rater"></div>
<pre>
    <code>
    {
        starSize:32,
        element:document.querySelector("#rater"),
        rateCallback:function rateCallback(rating, done) {
            this.setRating(rating); 
            done(); 
        }
    }
</code>
</pre>

<hr>

<h2>5 star rater with step</h2>

<div id="rater-step"></div>
<div><span class="live-rating"></span></div>
<pre>
    <code>
    {
        element:document.querySelector("#rater"),
        rateCallback:function rateCallback(rating, done) {
            this.setRating(rating); 
            done(); 
        },
        starSize:32,
        step:0.5
    }
</code>
</pre>

<hr>


<h2>Custom messages</h2>

<div id="rater2"></div>

<pre>
    <code>
    {
        max:5, 
        rating:4, 
        element:document.querySelector("#rater2"), 
        disableText:"Custom disable text!", 
        ratingText:"My custom rating text {rating}",
        showToolTip:true,
        rateCallback:function rateCallback(rating, done) {
            starRating.setRating(rating); 
            starRating.disable(); 
            done(); 
        }
    }
</code>
</pre>


<hr>

<h2>You can have unlimited number of stars. Example with 16 stars. readOnly option is set to true.</h2>

<div id="rater3"></div>

<pre>
    <code>
    {
        max:16, 
        readOnly:true, 
        rating:4.4, 
        element:document.querySelector("#rater3")
    }
</code>
</pre>

<hr>

<h2>5 Star rater with custom isBusyText and simulated backend. A random number betweeen 1 and 5 is set as the rating.</h2>

<div id="rater4"></div>

<pre>
    <code>
    { 
        isBusyText: "Rating in progress. Please wait...",
        element:document.querySelector("#rater4"),
        rateCallback: function rateCallback(rating, done) {
        starRating.setRating(rating); 
            myDataService.rate().then(function (avgRating) {
                starRating.setRating(avgRating); 
                done(); 
            });
        }    
    }
    </code>
</pre>

<hr>

<h2>On hover event</h2>

<div>
    <span id="rater5"></span>
    <span class="live-rating"></span>
</div>

<pre>
    <code>
    {
        element:document.querySelector("#rater5"),
        rateCallback:function rateCallback(rating, done) {
            this.setRating(rating); 
            done(); 
        },
        onHover: function(currentIndex, currentRating){
			document.querySelector('.live-rating').textContent = currentIndex;
        },
        onLeave: function(currentIndex, currentRating){
            document.querySelector('.live-rating').textContent = currentRating;
        }
    }
</code>
</pre>

<hr>

<h2>Clear/reset rater</h2>

<div>
    <span id="rater6"></span>
    <span class="clear-rating"></span>
    <button id="rater6-button">Reset</button>
</div>

<pre>
    <code>
    {
        element:document.querySelector("#rater6"),
        rateCallback:function rateCallback(rating, done) {
            this.setRating(rating); 
            done(); 
        }
    }

    document.querySelector('#rater6-button').addEventListener("click", function() {
        starRating6.clear();
    }, false); 

</code>
</pre>

<h2>Right to left support</h2>

<pre>
    <code>
       {
            max:6, 
            reverse:true, //this enable rtl
            element:document.querySelector("#rater7"),
            rateCallback:function rateCallback(rating, done) {
                this.setRating(rating); 
                done(); 
            }
       )
    </code>
</pre>

<div dir="rtl">
    <span id="rater7"></span>
</div>
<script>

</script>
<!-- <script src="../index3.js?v=2"></script> -->
<!-- <script src="index2.js?v=2"></script> -->
</body>
</html>