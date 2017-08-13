<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="QLDTUTEHY.DangNhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập</title>
    <link href="Teamplate/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Teamplate/fonts/css/font-awesome.min.css" rel="stylesheet" />
    <link href="Teamplate/css/custom.css" rel="stylesheet" />
    <style>
        .form-control {
            border-radius: 0;
            width: 100%;
            margin-bottom: 20px;
        }
    </style>
</head>
<body style="background: #F7F7F7;">
    <form id="form1" runat="server">
        <div>
            <div class="">
                <a class="hiddenanchor" id="toregister"></a>
                <a class="hiddenanchor" id="tologin"></a>

                <div id="wrapper">
                    <div id="login" class="animate form">
                        <section class="login_content">

                            <h1>Đăng nhập hệ thống
                            </h1>
                            <div>
                                <asp:TextBox runat="server" ID="txtAccount" CssClass="form-control" placeholder="Tên đăng nhập" required="" />
                            </div>
                            <div>
                                <asp:TextBox runat="server" TextMode="Password" ID="txtPass" class="form-control" placeholder="Mật khẩu" required="" />
                            </div>
                            <div>
                                <asp:CheckBox runat="server" ID="chkTT" Checked="false" Text="Thủ Thư" style="margin-right:10px" />
                                <asp:Button runat="server" ID="btnLogin" class="btn btn-default submit" OnClick="btnLogin_Click" Text="Đăng nhập" />
                            </div>
                            <div class="clearfix"></div>
                            <div class="separator">
                                <div class="clearfix"></div>
                                <br />
                                <div>
                                    <h1><i class="fa fa-institution" style="font-size: 26px;"></i>Quản lý thư viện</h1>

                                    <p>©Quản lý thư viện-Đại học sư phạm kỹ thuật Hưng Yên</p>
                                </div>
                            </div>

                            <!-- form -->
                        </section>
                        <!-- content -->
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
