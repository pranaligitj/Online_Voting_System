<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style type="text/css">
        #navbar{
            width: 100%;
            height: 70px;
            border: 2px solid;
            display: flex;
            background-color: gray;
            justify-content:space-evenly;
            
        }
        #nav{
            width: 900px;
            height: 100%;
            /* border: 1px solid; */
            display:flex;
            justify-content: space-evenly;
            align-items: center;
            background-color: gray;
            margin-left: 400px;

        }
        #nav a{
            text-decoration:none;
            font-size:18px;
            color: white;
        }
        #nav a:hover{
            color: black;
            font-weight: bold;
            
        }
    </style>
</head>
<body>
    <div id="navbar">
        <div id="logo"></div>
        <div id="nav">
            <div class="button" id="button1"><a href="./home">Home</a></div>
            <div class="button" id="button1"><a href="./login">Login</a></div>
            <div class="button" id="button3"><a href="./register">Register</a></div>
            <div class="button" id="button2"><a href="./logout">logout</a></div>
        </div>
    </div>
</body>
</html>