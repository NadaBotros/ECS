<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logIn.aspx.cs" Inherits="ECS.logIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }
        form {
            border: 3px solid #f1f1f1;
        }
        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        button:hover {
            opacity: 0.8;
        }
       
        .lgnbtn {
            background-color: #4CAF50;
            color: white;
            padding: 14px 50%;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 50%;
        }
       
        .container {
            padding: 16px;
            width: 900px;
            margin-left:25%;
        }
        span.psw {
            float: right;
            padding-top: 16px;
        }
        /* Change styles for span and cancel button on extra small screens */
        @media screen and (max-width: 300px) {
            span.psw {
                display: block;
                float: none;
            }
            .cnbtn {
                width: 100%;
            }
            .lgnbtn {
                width: 100%;

            }
        }
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
           <div class="container">
            <center>
                <h3>Login Form </h3>
            </center>
            <label for="uname"><b>Username</b></label>
            <asp:TextBox runat="server" ID="TextBox1" placeholder="Enter Username"></asp:TextBox>
            <label for="psw"><b>Password</b></label>
            <asp:TextBox runat="server" ID="TextBox2" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
            <asp:Button runat="server" ID="btn_Login" OnClick="Button1_Click"  CssClass="lgnbtn" Text="Login" />
            <asp:Label ID="Label3" runat="server" Text="" ></asp:Label>           
        </div>
    </form>  
</body>
</html>
