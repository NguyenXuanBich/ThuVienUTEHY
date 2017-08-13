<%@ Page Title="Quản lý Lớp Học" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="QLLop.aspx.cs" Inherits="QLDTUTEHY.QLLop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Quản lý lớp</h3>
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
                                <asp:GridView ID="grvLop" runat="server" OnPageIndexChanging="grvLop_PageIndexChanging" HeaderStyle-CssClass="heading" AllowPaging="True" PageSize="5" DataKeyNames="MaLop"
                                    CssClass="table table-striped responsive-utilities jambo_table bulk_action col-lg-12 col-md-12 col-xs-12 col-sm-12"
                                    AutoGenerateColumns="False" OnRowCommand="grvLop_RowCommand" HeaderStyle-BackColor="#ffffcc" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                    <Columns>
                                        <asp:BoundField DataField="MaLop" HeaderText="Mã lớp" />
                                        <asp:BoundField DataField="MaKhoa" HeaderText="Mã khoa" />
                                        <asp:BoundField DataField="TenLop" HeaderText="Tên Lớp" />
                                        <asp:BoundField DataField="HeDaoTao" HeaderText="Hệ đào tạo" />
                                        <asp:BoundField DataField="Khoa" HeaderText="Khóa" />
                                        <asp:TemplateField HeaderText="Hành động" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="btnSua" CssClass="btnSua " CommandName='Sua'>Sửa</asp:LinkButton>/
                                                <asp:LinkButton runat="server" ID="btnXoa" CssClass="btnXoa" CommandName='Xoa'>Xóa</asp:LinkButton>
                                            </ItemTemplate>
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
                                                <button id="buttonX" type="button" class="close btnHuy" data-dismiss="modal">
                                                    <span aria-hidden="true">×</span>
                                                </button>
                                                <h4 class="modal-title" id="myModalLabel">Lớp</h4>
                                            </div>
                                            <asp:HiddenField runat="server" ID="editType" />
                                            <div class="modal-body">
                                                <div class="form-group" runat="server" id="divMa">

                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Mã lớp:<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" ID="txtMaLop" CssClass="form-control col-md-7 col-xs-12" required="required" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Mã khoa:<span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:DropDownList runat="server" ID="ddlDonvi" CssClass="form-control col-md-7 col-xs-12"></asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Tên lớp
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" ID="txtTenLop" CssClass="form-control col-md-7 col-xs-12" required="required" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Hệ đào tạo
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" ID="txtHeDaoTao" CssClass="form-control col-md-7 col-xs-12" required="required" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                        Khóa
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <asp:TextBox runat="server" ID="txtKhoa" CssClass="form-control col-md-7 col-xs-12" required="required" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <div>
                                                    <button type="button" id="btnHuy" class="btn btn-default btnHuy" style="margin-bottom: 0px;" data-dismiss="modal">Hủy</button>
                                                    <asp:Button CssClass="btn btn-primary" runat="server" OnClick="btnSave_Click1" Text="Lưu" ID="btnSave" />
                                                </div>
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
                                            <asp:Button runat="server" ID="btnXoa" OnClick="btnXoa_Click1" class="btn btn-primary" Text="Xóa" />
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
                $("#<%=txtMaLop.ClientID%>").removeAttr('disabled');
                $('#<%=editType.ClientID%>').val("add");
                $("#modalEdit").modal('show');
                return false;
            });
            $('.btnHuy').click(function () {
                $('#<%=EditState.ClientID%>').val('hide');

            });
            $('#<%=txtMaLop.ClientID%>').change(function () {
                var id = $('#<%=txtMaLop.ClientID%>').val();
                $.ajax({
                    type: "POST",
                    url: "SV/CheckID.asmx/CheckIDLH",
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
                    var inputma = $('#<%=txtMaLop.ClientID%>').parsley();
                    window.ParsleyUI.addError(inputma, 'myerror', 'Mã đã tồn tại');
                    $("#<%=btnSave.ClientID%>").attr('disabled', true);
                }
                function CheckTrue() {
                    var inputma = $('#<%=txtMaLop.ClientID%>').parsley();
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
