<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>



    <link rel="stylesheet" href="Login_files/css/style.css">

    <style type="text/css">
        #lblFaild {
            color: red;
        }

        #button1 {
            margin-left: 50px;
        }

        body {
            background-image: url("images/hajjss.jpg");
            height: 100%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
    </style>

</head>

<body>
    <body>
        <div class="container">
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <section id="content">
                <form runat="server">


                    <h1>Login</h1>
                    <h1>Hajj Squad</h1>

                    <div>
                        <%--<input type="text" placeholder="Username" required="" id="txtusername"  runat="server"/>--%>
                        <asp:TextBox ID="txtUserName" runat="server" ToolTip="Username"></asp:TextBox>
                    </div>
                    <div>
                        <%--<input type="password" placeholder="Password" required="" id="txtpassword" runat="server" />--%>
                        <asp:TextBox TextMode="Password" ID="txtPassword" runat="server" ToolTip="Password"></asp:TextBox>

                    </div>

                    <div>

                        <asp:Label ID="lblFaild" runat="server" Visible="false">Wrong in username OR password </asp:Label>

                    </div>


                    <div id="Button1">
                        <asp:Button ID="btnSubmit" runat="server" Text="Log in" OnClick="btnSubmit_Click" />
                        <a href="#">Lost your password?</a>
                        <a href="#">Register</a>

                    </div>
                </form>
                <!-- form -->

            </section>
            <!-- content -->
        </div>
        <!-- container -->
    </body>

    <script src="Login_files/js/index.js"></script>

</body>
</html>

