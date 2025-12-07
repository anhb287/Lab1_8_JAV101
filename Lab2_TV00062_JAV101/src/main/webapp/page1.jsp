<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<!DOCTYPE html> 
<html> 
<head> 
    <meta charset="UTF-8">
    <title>LAB 2 - Bài 1</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #eef3f8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            text-align: center;
            padding: 25px 40px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.15);
        }

        h2 {
            margin: 10px 0;
            font-weight: 600;
            color: #444;
        }

        h1 {
            color: #2a4d8f;
            font-size: 30px;
            margin: 15px 0;
        }
    </style>

</head> 
<body> 
    
    <div class="container">
        <h2>-- BÀI 1 --</h2>
        <h1>${message}</h1>
        <h2>Ngày trong tháng: ${now.date}</h2>
    </div>

</body> 
</html>
