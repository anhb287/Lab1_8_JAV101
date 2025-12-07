<%@page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>LAB 2 - Bài 3 & 4</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            background: #eef3f8;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-box {
            background: #ffffff;
            padding: 35px 45px;
            width: 420px;
            border-radius: 15px;
            box-shadow: 0 5px 18px rgba(0, 0, 0, 0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #2a4d8f;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
            color: #444;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            outline: none;
            transition: 0.2s;
        }

        input[type="text"]:focus,
        select:focus {
            border-color: #4a90e2;
            box-shadow: 0 0 5px rgba(74,144,226,0.4);
        }

        .radio-group {
            margin-top: 8px;
        }

        .radio-group label {
            margin-right: 20px;
            cursor: pointer;
        }

        hr {
            margin: 20px 0;
        }

        button {
            width: 48%;
            padding: 10px 15px;
            border: none;
            background: #4a90e2;
            color: white;
            font-size: 15px;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.2s;
        }

        button:hover:not([disabled]) {
            background: #3576c6;
        }

        button[disabled] {
            background: #9bbfe7;
            cursor: not-allowed;
        }

        .btn-row {
            display: flex;
            justify-content: space-between;
        }
    </style>

</head>
<body>

    <div class="form-box">
        <h2>-- BÀI 3 & 4 --</h2>

        <form action="/form/update" method="post"> 
            
            <div class="form-group">
                <label class="label">Fullname:</label>
                <input type="text" name="fullname" 
                       value="${user.fullname}" 
                       ${editabled ? 'readonly' : ''}>
            </div>

            <div class="form-group">
                <label class="label">Gender:</label>

                <div class="radio-group">
                    <label>
                        <input type="radio" name="gender" value="true"
                            ${user.gender == true ? 'checked' : ''}> Male
                    </label>
                    <label>
                        <input type="radio" name="gender" value="false"
                            ${user.gender == false ? 'checked' : ''}> Female
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label class="label">Country:</label>
                <select name="country"> 
                    <option value="VN" ${user.country == 'VN' ? 'selected' : ''}>Việt Nam</option>
                    <option value="US" ${user.country == 'US' ? 'selected' : ''}>United States</option>
                    <option value="CN" ${user.country == 'CN' ? 'selected' : ''}>China</option>
                </select>
            </div>

            <hr>

            <div class="btn-row">
                <button ${editabled ? 'disabled' : ''}>Create</button> 
                <button>Update</button>
            </div>

        </form>
    </div>

</body>
</html>
