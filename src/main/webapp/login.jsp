<html>
<head>
 <title>
  Sign In
 </title>
 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
 <style>
  		body {
           display: flex;
           justify-content: center;
           align-items: center;
           height: 100vh;
           margin: 0;
           background-color: #f5f7fa;
           font-family: Arial, sans-serif;
           background: linear-gradient(to right, #6a11cb, #2575fc);
       }
       .container {
           background-color: #fff;
           padding: 40px;
           border-radius: 10px;
           box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
           text-align: center;
           width: 100%;
           max-width: 400px;
       }
       .container img {
           width: 60px;
           height: 60px;
           margin-bottom: 10px;
       }
       .container h2 {
           margin-bottom: 20px;
           font-size: 24px;
           color: #333;
       }
       .container input[type="text"],
       .container input[type="password"] {
           width: 100%;
           padding: 10px;
           margin: 10px 0;
           border: 1px solid #ddd;
           border-radius: 5px;
           box-sizing: border-box;
       }
       .container button {
           width: 100%;
           padding: 10px;
           background-color: #007bff;
           border: none;
           border-radius: 5px;
           color: #fff;
           font-size: 16px;
           cursor: pointer;
           margin-bottom: 10px;
       }
       .container button:hover {
           background-color: #0056b3;
       }
      
      
 </style>
</head>
<body>
 <div class="container">
  	<img alt="User icon" height="50" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Google_Contacts_icon.svg/1024px-Google_Contacts_icon.svg.png" width="50"/>
  	
  	<h2>Sign In</h2>
  	
  	<form action="ValidateLogin" method="post">
  		<input placeholder="Username" type="text" name="username" required/>
  		<input placeholder="Password" type="password" name="password" required/>
  	
  		<button>Login</button>
  	</form>

  	   
 </div>
</body>
</html>

