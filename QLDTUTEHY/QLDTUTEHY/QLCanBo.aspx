<%@ Page Title="Quản lý Cán Bộ" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="QLCanBo.aspx.cs" Inherits="QLDTUTEHY.QLCanBo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Quản lý cán bộ</h3>
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
                                <input type="button" id="btnThem" class="btn btn-primary" value="Thêm" />
                                <asp:GridView ID="grvCanBo" runat="server" OnPageIndexChanging="grvCanBo_PageIndexChanging" HeaderStyle-CssClass="heading" AllowPaging="True" PageSize="5" DataKeyNames="MaCanBo"
                                    CssClass="table table-striped responsive-utilities jambo_table bulk_action col-lg-12 col-md-12 col-xs-12 col-sm-12"
                                    AutoGenerateColumns="False" OnRowCommand="grvCanBo_RowCommand" HeaderStyle-BackColor="#ffffcc" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                    <Columns>
                                        <asp:BoundField DataField="MaCanBo" HeaderText="Mã cán bộ" />
                                        <asp:BoundField DataField="HoVaTen" HeaderText="Họ và tên" />
                                        <asp:BoundField DataField="QueQuan" HeaderText="Quê quán" />
                                        <asp:TemplateField HeaderText="Ngày Sinh">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lbNgaySinh" Text='<%#DateTime.Parse(Eval("NgaySinh").ToString()).ToShortDateString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CheckBoxField DataField="GioiTinh" HeaderText="Giới tính" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="MaDonVi" HeaderText="Mã đơn vị" />
                                        <asp:BoundField DataField="SoDienThoai" HeaderText="Số điện thoại" />
                                        <asp:BoundField DataField="DiaChiEMail" HeaderText="Email" />
                                        <asp:BoundField DataField="GhiChu" HeaderText="Ghi chú" />
                                        <asp:CheckBoxField DataField="TrangThai" HeaderText="Trạng thái" ItemStyle-HorizontalAlign="Center" />
                                        <asp:TemplateField HeaderText="Hành động" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="btnSua" CssClass="btnSua " CommandName='Sua'>Sửa</asp:LinkButton>/
                                                <asp:LinkButton runat="server" ID="btnXoa" CssClass="btnXoa" CommandName='Xoa'>Xóa</asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle CssClass="heading" />
                                    <PagerStyle HorizontalAlign="Right" CssClass="pagination-ys" />
                                </asp:GridView>
                                <asp:HiddenField ID="EditState" runat="server" />
                                <asp:HiddenField ID="deleteState" runat="server" />
                                <div class="modal fade bs-example-modal-lg" id="modalEdit" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close btnHuy" data-dismiss="modal">
                                                    <span aria-hidden="true">×</span>
                                                </button>
                                                <h4 class="modal-title" id="myModalLabel">Cán bộ</h4>
                                            </div>
                                            <asp:HiddenField runat="server" ID="editType" />
                                            <div class="modal-body">
                                                <div class="form-group" id="divMa">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Mã cán bộ:<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" ID="txtMaCB" CssClass="form-control col-md-7 col-xs-12" required="required" />
                                                        <%--<asp:Button runat="server" ID="CheckKey" OnClick="CheckKey_Click" CssClass="hidden" />--%>
                                                        <asp:HiddenField runat="server" ID="idState" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Họ và Tên:<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" ID="txtHovaTen" CssClass="form-control col-md-7 col-xs-12" required="required" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Quê quán
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" ID="txtQuequan" required="required" CssClass="form-control col-md-7 col-xs-12" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Trạng thái
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <div id="gender" class="btn-group" data-toggle="buttons">
                                                            <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                                <asp:RadioButton runat="server" ID="rdbNam" Text="Nam" GroupName="gender" />

                                                            </label>
                                                            <label class="btn btn-primary active" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                                <asp:RadioButton runat="server" ID="rdbNu" Text="Nữ" GroupName="gender" />
                                                            </label>
                                                        </div>

                                                    </div>
                                                </div>
                                                <%--   <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Giới tính
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <div id="gender" class="btn-group" data-toggle="buttons">
                                                            <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                                <asp:RadioButton runat="server" ID="rdbNam" name="gender" value="co" />
                                                                &nbsp; Nam &nbsp;               
                                                            </label>
                                                            <label class="btn btn-primary active" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                                <asp:RadioButton runat="server" ID="rdbNu" Checked="true" />
                                                                Nữ                      
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>--%>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Ngày sinh:<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <%--type=number--%>
                                                        <asp:TextBox runat="server" ID="txtNgaysinh" CssClass="form-control col-md-7 col-xs-12" required="required" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Ảnh:<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:FileUpload accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|images/*" runat="server" ID="filAnh" CssClass=" form-control col-md-7 col-xs-12" />
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Tên đơn vị:<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:DropDownList runat="server" ID="ddlDonVi" CssClass="form-control col-md-7 col-xs-12">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Điện thoại:<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" ID="txtDienthoai" CssClass="form-control col-md-7 col-xs-12" required="required" />
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Địa chỉ Email:<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control col-md-7 col-xs-12" required="required" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Ghi chú:<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" ID="txtGhichu" CssClass="form-control col-md-7 col-xs-12" required="required" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Mật khẩu:<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" ID="txtMatKhau" CssClass="form-control col-md-7 col-xs-12" />
                                                    </div>
                                                </div>
                                                <%--  <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                        Sách dịch:
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <div id="trangthai" class="btn-group" data-toggle="buttons">

                                                            <asp:RadioButton runat="server" ID="CoDich" Text="Có" GroupName="dich" />
                                                            <asp:RadioButton runat="server" ID="KhongDich" Text="Không" GroupName="dich" />

                                                        </div>
                                                    </div>
                                                </div>--%>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Trạng thái
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <div id="trangthai" class="btn-group" data-toggle="buttons">
                                                            <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                                <asp:RadioButton runat="server" ID="rdHD" Text="Hoạt động" GroupName="trangthai" />

                                                            </label>
                                                            <label class="btn btn-primary active" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                                                <asp:RadioButton runat="server" ID="rdKHD" Text="Không hoạt động" GroupName="trangthai" />
                                                            </label>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="modal-footer">
                                                    <button type="button" id="btnHuy" class="btn btn-default" data-dismiss="modal">Hủy</button>
                                                    <asp:Button CssClass="btn btn-primary" runat="server" Text="Lưu" OnClick="btnSave_Click" ID="btnSave" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal fade bs-example-modal-sm" id="modalDelete" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-sm">
                                        <div class="modal-content">

                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">×</span>
                                                </button>
                                                <h4 class="modal-title" id="myModalLabel2">Xóa</h4>
                                            </div>
                                            <div class="modal-body">
                                                <asp:HiddenField runat="server" ID="idDelete" />
                                                <h4>Bạn có chắc muốn xóa</h4>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default btnHuy" style="margin-bottom: 0px;" data-dismiss="modal">Hủy</button>
                                                <asp:Button runat="server" ID="btnXoa" OnClick="btnXoa_Click" class="btn btn-primary" Text="Xóa" />
                                            </div>

                                        </div>
                                    </div>
                                </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="btnSave" />
                        </Triggers>
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
            $('#btnThem').click(function () {
                $('#<%=EditState.ClientID%>').val('edit');
                $("#modalEdit").find("input:text").val("");
                $("#<%=txtMaCB.ClientID%>").removeAttr('disabled');
                $('#<%=editType.ClientID%>').val("add");
                $("#modalEdit").modal('show');
                return false;
            });
            $('.btnHuy').click(function () {
                $('#<%=EditState.ClientID%>').val('hide');

            });
            $('#<%=txtMaCB.ClientID%>').change(function () {
                var id = $('#<%=txtMaCB.ClientID%>').val();
                $.ajax({
                    type: "POST",
                    url: "SV/CheckID.asmx/CheckIDCB",
                    data: "{'id':'" + id + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: function (mgs) {
                        CheckTrue();

                        if (mgs.d == "False")
                            CheckFalse();
                    }

                })
            });
            $('#modalEdit').on('hidden.bs.modal', function () {
                $('#<%=EditState.ClientID%>').val('hide');
                $('.modal-backdrop').remove();
            })
                $('#modalDelete').on('hidden.bs.modal', function () {
                    $('#<%=EditState.ClientID%>').val('hide');
                })

                function CheckFalse() {
                    var inputma = $('#<%=txtMaCB.ClientID%>').parsley();
                    window.ParsleyUI.addError(inputma, 'myerror', 'Mã đã tồn tại');
                    $("#<%=btnSave.ClientID%>").attr('disabled', true);
            }
            function CheckTrue() {
                var inputma = $('#<%=txtMaCB.ClientID%>').parsley();
                window.ParsleyUI.removeError(inputma, 'myerror');
                $("#<%=btnSave.ClientID%>").removeAttr('disabled');
            }
            $("#<%=btnSave.ClientID%>").click(function () {

                $('.frmmain').parsley().validate();
                return ($('.frmmain').parsley().isValid())

            });
            var editstate = $('#<%=EditState.ClientID%>').val();
            if (editstate == 'edit') {
                $("#modalEdit").modal('show');
            }
            else if (editstate == 'delete') {
                $("#modalDelete").modal('show');
            }
            else {
                $("#modalEdit").modal('hide');
                $('.modal-backdrop').remove();
            }
        };
    </script>
</asp:Content>

