<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="NavBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{
background-color: linen;
}
article {
	font-size: 70px;
	max-width: 100%;
	margin: 1em auto;
	overflow: hidden;
	position: relative;
	min-height: 4em;
	color: black;
	margin-top: 250px;
}

.example-left {
	white-space: nowrap;
	position: absolute;
	text-transform: uppercase;
}

.example-left {
	-webkit-animation: mymove 4s linear infinite; /* Safari 4.0 - 8.0 */
	white-space: nowrap;
	animation: mymove 4s linear infinite alternate;
}
/* Safari 4.0 - 8.0 */
@
-webkit-keyframes mymove {from { left:0;
	
}

to {
	left: -50px;
}

}
@
keyframes mymove {from { left:0;
	
}

to {
	left: -50px;
}

}

/* Safari 4.0 - 8.0 */
@
-webkit-keyframes urmove {from { right:0;
	
}

to {
	right: -50px;
}

}
@
keyframes urmove {from { right:0;
	
}

to {
	right: -50px;
}

}
@
keyframes early {from { opacity:1;
	
}

to {
	opacity: 0;
}

}
.early {
	animation: fadeIn ease-in 1;
	/* call our keyframe named fadeIn, use animation ease-in and repeat it only 1 time */
	animation-fill-mode: forwards;
	/* this makes sure that after animation is done we remain at the last keyframe value (opacity: 1)*/
	animation-duration: 1s;
	animation-delay: 1s;
}
</style>
</head>
<body>
	<section class="early">

		<article>
			<marquee behavior="scroll" direction="left">WELCOME TO
				ONLINE VOTING SYSTEM</marquee>
		</article>

	</section>
</body>
</html>