<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="QLDonVi.aspx.cs" Inherits="QLDTUTEHY.QLDonVi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Quản lý Đơn Vị</h3>
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
                                <asp:GridView ID="grvDV" runat="server" OnPageIndexChanging="grvDV_PageIndexChanging" HeaderStyle-CssClass="heading" AllowPaging="True" PageSize="5" DataKeyNames="MaDonVi"
                                    CssClass="table table-striped responsive-utilities jambo_table bulk_action col-lg-12 col-md-12 col-xs-12 col-sm-12"
                                    AutoGenerateColumns="False" OnRowCommand="grvDV_RowCommand">
                                    <HeaderStyle CssClass="headings" />
                                    <Columns>
                                        <asp:BoundField DataField="MaDonVi" HeaderText="Mã đơn vị" />
                                        <asp:BoundField DataField="TenDonVi" HeaderText="Tên đơn vị" />
                                        <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ" />
                                        <asp:BoundField DataField="SoDienThoai" HeaderText="Số điện thoại" />
                                        <asp:BoundField DataField="TruongDonVI" HeaderText="Trưởng đơn vị" />
                                        <asp:BoundField DataField="Email" HeaderText="Email" />
                                        <asp:BoundField DataField="Website" HeaderText="Website" />
                                        <asp:TemplateField HeaderText="Hành động" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="btnSua" CssClass="btnSua " CommandName='Sua'>Sửa</asp:LinkButton>/
                                                <asp:LinkButton runat="server" ID="btnXoa" CssClass="btnXoa" CommandName='Xoa'>Xóa</asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Right" CssClass="pagination-ys" />
                                </asp:GridView>
                                <asp:HiddenField ID="EditState" runat="server" />
                                <asp:HiddenField ID="deleteState" runat="server" />
                                <div class="modal fade bs-example-modal-lg" id="modalEdit" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button id="buttonX" type="button" class="close btnHuy" data-dismiss="modal">
                                                    <span aria-hidden="true">×</span>
                                                </button>
                                                <h4 class="modal-title" id="myModalLabel">Đơn Vị</h4>
                                            </div>
                                            <asp:HiddenField runat="server" ID="editType" />
                                            <div class="modal-body">
                                                <div class="form-group" id="divMa">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Mã đơn vị:<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" ID="txtMaDonVi" CssClass="form-control col-md-7 col-xs-12" required="required" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Tên đơn vị:<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" ID="txtTenDV" CssClass="form-control col-md-7 col-xs-12" required="required" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Địa chỉ:
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" ID="txtDiaChi" CssClass="form-control col-md-7 col-xs-12" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Số điện thoại:
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" ID="txtSDT" CssClass="form-control col-md-7 col-xs-12" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Trưởng đơn vị:<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" ID="txtTruongDonVi" CssClass="form-control col-md-7 col-xs-12" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Email:<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control col-md-7 col-xs-12" required="required" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Website:<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" ID="txtWeb" CssClass="form-control col-md-7 col-xs-12" required="required" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <div>
                                                    <button type="button" id="btnHuy" class="btn btn-default btnHuy" style="margin-bottom: 0px;" data-dismiss="modal">Hủy</button>
                                                    <asp:Button CssClass="btn btn-primary" runat="server" OnClick="btnSave_Click" Text="Lưu" ID="btnSave" />
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
                $("#<%=txtMaDonVi.ClientID%>").removeAttr('disabled');
                $('#<%=editType.ClientID%>').val("add");
                $("#modalEdit").modal('show');
                return false;
            });
            $('.btnHuy').click(function () {
                $('#<%=EditState.ClientID%>').val('hide');


            });
            $('#<%=txtMaDonVi.ClientID%>').change(function () {
                var id = $('#<%=txtMaDonVi.ClientID%>').val();
                $.ajax({
                    type: "POST",
                    url: "SV/CheckID.asmx/CheckIDDV",
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
                    var inputma = $('#<%=txtMaDonVi.ClientID%>').parsley();
                    window.ParsleyUI.addError(inputma, 'myerror', 'Mã đã tồn tại');
                    $("#<%=btnSave.ClientID%>").attr('disabled', true);
                }
                function CheckTrue() {
                    var inputma = $('#<%=txtMaDonVi.ClientID%>').parsley();
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
