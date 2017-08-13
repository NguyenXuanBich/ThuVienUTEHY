<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="QLTaiKhoan.aspx.cs" Inherits="QLDTUTEHY.QLTaiKhoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Quản lý tài khoản</h3>
            </div>
            <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Tìm kiếm" />
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">Tìm!</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="x_content">
                                <input type="button" id="btnThem" data-toggle="modal" data-target=".bs-example-modal-lg" class="btn btn-success btnSua" value="Thêm" />
                                <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Tải Lại" />
                                <asp:GridView ID="grvTK" runat="server" OnPageIndexChanging="grvTK_PageIndexChanging" HeaderStyle-CssClass="heading" AllowPaging="True" PageSize="5" DataKeyNames="TenDangNhap"
                                    CssClass="table table-striped responsive-utilities jambo_table bulk_action col-lg-12 col-md-12 col-xs-12 col-sm-12"
                                    AutoGenerateColumns="False" OnRowCommand="grvTK_RowCommand">
                                    <Columns>
                                        <asp:BoundField DataField="TenDangNhap" HeaderText="Tên đăng nhập" />
                                        <asp:BoundField DataField="HoVaTen" HeaderText="Họ và tên" />
                                        <%--<asp:BoundField DataField="MatKhau" HeaderText="Mật Khẩu" />--%>
                                        <asp:BoundField DataField="QuyenHan" HeaderText="Quyền hạn" />
                                        <asp:CheckBoxField DataField="TrangThai" HeaderText="Trạng thái" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="MoTa" HeaderText="Mô tả" />
                                        <asp:TemplateField HeaderText="Hành động" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="btnSua" CssClass="btnSua glyphicon glyphicon-edit" CommandName='Sua'></asp:LinkButton>
                                                <asp:LinkButton runat="server" ID="btnXoa" CssClass="btnXoa glyphicon glyphicon-remove-circle" CommandName='Xoa'></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--<asp:ButtonField CommandName="Sua" ButtonType="Link" Text="Sửa" HeaderText="Sửa" />
                                        <asp:ButtonField CommandName="Xoa" ButtonType="Link" Text="Xóa" HeaderText="Xóa" />--%>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Right" CssClass="pagination-ys" />
                                </asp:GridView>
                                <div class="modal fade bs-example-modal-lg" id="modalTK" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">
                                                    <span aria-hidden="true">×</span>
                                                </button>
                                                <h4 class="modal-title" id="myModalLabel">Tài Khoản</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group" runat="server" id="divTen">
                                                    <asp:HiddenField runat="server" ID="hdTenDN" />
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Tên đăng nhập:<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" ID="txtTenDangNhap" CssClass="form-control col-md-7 col-xs-12" required="required" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Họ và Tên:<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" ID="txtHoVaTen" CssClass="form-control col-md-7 col-xs-12" required="required" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Mật khẩu:
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" TextMode="Password" ID="txtMatKhau" required="required" CssClass="form-control col-md-7 col-xs-12" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                         Quyền hạn:
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" type="number" ID="txtQuyenHan" required="required" CssClass="form-control col-md-7 col-xs-12" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Trạng thái:
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <div id="gender" class="btn-group" data-toggle="buttons">
                                                            <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                                <asp:RadioButton runat="server" ID="rdTK" name="gender" value="co" />
                                                                &nbsp; Hoạt động &nbsp;               
                                                            </label>
                                                            <label class="btn btn-primary active" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                                <asp:RadioButton runat="server" ID="rdKTK" Checked="true" />
                                                                Không hoạt động                   
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Mô tả:<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" TextMode="MultiLine" Rows="4" ID="txtMoTa" CssClass="form-control col-md-7 col-xs-12" />
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" id="btnHuy" class="btn btn-default" data-dismiss="modal">Hủy</button>
                                                <button type="button" id="btncSave" class="btn btn-primary">Lưu</button>
                                                <asp:Button CssClass="hidden" runat="server" OnClick="btnSave_Click" ID="btnSave" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>

    <div id="custom_notifications" class="custom-notifications dsp_none">
        <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
        </ul>
        <div class="clearfix"></div>
        <div id="notif-group" class="tabbed_notifications"></div>
    </div>
    <script src="Teamplate/js/parsley/parsley.min.js"></script>
    <script>

        $(document).ready(function () {
            CheckValidate();
        });
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm != null) {
            prm.add_endRequest(function (sender, e) {
                if (sender._postBackSettings.panelsToUpdate != null) {
                    CheckValidate();
                }
            });
        };
        function CheckValidate() {
            $("#btnThem").click(function () {
                $("#modalTK").find("input:text").val("");
                $("#<%=txtTenDangNhap.ClientID%>").removeAttr('disabled');
            });
            $("#btncSave").click(function () {
                $('.frmmain').parsley().validate();
                if ($('.frmmain').parsley().isValid())
                    $("#<%=btnSave.ClientID%>").click();
            });
        };
    </script>
</asp:Content>
