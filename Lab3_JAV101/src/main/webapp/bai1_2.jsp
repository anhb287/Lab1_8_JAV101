<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %> 

<html>
<head>
    <title>Bài 1 & 2: Thư viện</title>
    
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
            color: #333;
        }
        
        /* Container chính cho nội dung bài tập */
        .content-area {
            max-width: 900px;
            margin: 30px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        
        /* Tiêu đề bài tập */
        .content-area h2 {
            color: #4a148c; /* Màu tím đậm */
            border-bottom: 2px solid #e0c0ff;
            padding-bottom: 8px;
            margin-top: 30px;
            font-size: 1.8em;
        }

        /* --- BÀI 1: Select Box --- */
        select[name="country"] {
            padding: 10px 15px;
            border: 2px solid #bdbdbd; 
            border-radius: 8px;
            font-size: 1em;
            width: 250px;
            background-color: #fff;
            transition: border-color 0.3s ease;
        }

        select[name="country"]:focus {
            border-color: #7b1fa2; /* Màu tím khi focus */
            box-shadow: 0 0 0 0.25rem rgba(123, 31, 162, 0.2); 
            outline: none;
        }
        
        /* Định dạng đường kẻ ngang */
        hr {
            border: 0;
            height: 1px;
            background: #e9ecef;
            margin: 30px 0;
        }

        /* --- BÀI 2: Table --- */
        table {
            width: 100%;
            border-collapse: collapse; 
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden;
        }
        
        thead th {
            background-color: #6a1b9a; /* Màu tím đậm */
            color: white;
            padding: 12px 15px;
            text-align: left;
            font-weight: 600;
        }
        
        tbody td {
            padding: 12px 15px;
            border-bottom: 1px solid #e0e0e0;
            color: #495057;
        }
        
        tbody tr:nth-child(even) {
            background-color: #f3e5f5; /* Màu tím cực nhạt */
        }
        
        tbody tr:hover {
            background-color: #ce93d8; /* Màu tím nhạt khi hover */
            cursor: pointer;
        }
    </style>
</head>
<body>
<jsp:include page="index.jsp" />
<div class="content-area">
    <h2>BÀI 1: ĐỔ DỮ LIỆU VÀO SELECT BOX</h2>
    <select name="country"> 
    <c:forEach var="ct" items="${countries}"> 
    <option value="${ct.id}"> ${ct.name} </option> 
    </c:forEach> </select>
    
    <hr>
    
    <h2>BÀI 2: ĐỔ DỮ LIỆU VÀO BẢNG</h2>
    <table> <thead> <tr> <th>No.</th> <th>Id</th> <th>Name</th> </tr>
        </thead>
        <tbody>
            <c:forEach var="ct" items="${countries}" varStatus="vs"> <tr>
                    <td>${vs.count}</td> <td>${ct.id}</td> <td>${ct.name}</td> </tr>
            </c:forEach>
        </tbody>
    </table>
</div> 

</body>
</html>