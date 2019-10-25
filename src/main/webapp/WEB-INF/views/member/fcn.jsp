<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 id="order"></h1>

	<h1>파이어 메세지</h1>

	<!-- The core Firebase JS SDK is always required and must be listed first -->
	<script src="https://www.gstatic.com/firebasejs/7.2.1/firebase-app.js"></script>

	<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
	<script
		src="https://www.gstatic.com/firebasejs/7.2.1/firebase-analytics.js"></script>

	<script>
		// Your web app's Firebase configuration
		var firebaseConfig = {
			apiKey : "AIzaSyCJ8xjvugyHWwNeOfp2_Vmr2Cb2WwGupRM",
			authDomain : "teamvictory2-97703.firebaseapp.com",
			databaseURL : "https://teamvictory2-97703.firebaseio.com",
			projectId : "teamvictory2-97703",
			storageBucket : "teamvictory2-97703.appspot.com",
			messagingSenderId : "280504028560",
			appId : "1:280504028560:web:9bec29e303cc03c5bef715",
			measurementId : "G-XYJT0JEJNP"
		};
		// Initialize Firebase
		firebase.initializeApp(firebaseConfig);
		firebase.analytics();
		const messaging = firebase.messaging()
		messaging.usePublicVapidKey("AIzaSyCJ8xjvugyHWwNeOfp2_Vmr2Cb2WwGupRM");
		Notification.requestPermission().then(function(permission) {
			if (permission === 'granted') {
				console.log('Notification permission granted.');
			} else {
				console.log('Unable to get permission to notify.');
			}
		});
	</script>
</body>
</html>