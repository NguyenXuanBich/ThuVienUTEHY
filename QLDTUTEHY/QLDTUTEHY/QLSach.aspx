<%@ Page Title="Quản lý sách" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="QLSach.aspx.cs" Inherits="QLDTUTEHY.QLSach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Teamplate/js/select/select2.full.js"></script>
    <link href="Teamplate/css/select/select2.min.css" rel="stylesheet" />

    <style type="text/css">
        .scroll_checkboxes {
            height: 120px;
            padding: 5px;
            overflow: scroll;
            border: 1px solid #ccc;
        }

        .FormText {
            FONT-SIZE: 11px;
            FONT-FAMILY: tahoma,sans-serif;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Quản lý sách</h3>
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

                    <div class="x_content">

                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <input type="button" id="btnThem" class="btn btn-primary btnThem" value="Thêm" />                              
                                <asp:GridView ID="grvSach" runat="server" HeaderStyle-CssClass="heading" AllowPaging="true" PageSize="8" DataKeyNames="MaSach"
                                    CssClass="table table-striped responsive-utilities jambo_table bulk_action col-lg-12 col-md-12 col-xs-12 col-sm-12"
                                    AutoGenerateColumns="false" OnPageIndexChanging="grvSach_PageIndexChanging" OnRowCommand="grvSach_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Tên Sách">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="cTen" Text='<%#Eval("TenSach") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Tác giả">
                                            <ItemTemplate>
                                                <asp:Repeater ID="rpTacGia" runat="server" DataSource='<%# DataBinder.Eval(Container.DataItem,"DSTacGia") %>'>
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="lbTacGia" Text='<%# DataBinder.Eval(Container.DataItem,"HoTenTacGia") %>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Thể loại">
                                            <ItemTemplate>
                                                <asp:Repeater ID="rpTheLoai" runat="server" DataSource='<%# DataBinder.Eval(Container.DataItem,"DSTheLoai") %>'>
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="lbTacGia" Text='<%# DataBinder.Eval(Container.DataItem,"TenTheLoai") %>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="MS Phân loại">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="cPhanLoai" Text='<%#Eval("MaPhanLoai") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Tập">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="cTap" Text='<%#Eval("Tap") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Số Lượng">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="cLuong" Text='<%#Eval("SoLuong") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bản Scan">
                                            <ItemTemplate>
                                                <a href="<%#string.Format("Images/"+Eval("DuongDanBanScan")) %>" target="_blank">Tải xuông</a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Hành động" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="btnSua" CssClass="btnSua " CommandArgument='<%#DataBinder.Eval(Container,"RowIndex") %>' CommandName='Sua'>Sửa</asp:LinkButton>/
                                                <asp:LinkButton runat="server" ID="btnXoa" CssClass="btnXoa" CommandName='Xoa'>Xóa</asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Right" CssClass="pagination-ys" />
                                </asp:GridView>
                                <asp:HiddenField runat="server" ID="EditState" />
                                <asp:HiddenField runat="server" ID="DeleteState" />

                                <div class="modal fade bs-example-modal-lg" id="modalSach" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">

                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">
                                                    <span aria-hidden="true">×</span>
                                                </button>
                                                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div id="wizard" class="form_wizard wizard_horizontal">
                                                    <asp:Button runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" CssClass="hidden btn-submit" />
                                                    <ul class="wizard_steps">
                                                        <li>
                                                            <a href="#step-1">
                                                                <span class="step_no">1</span>
                                                                <span class="step_descr">Bước 1<br />
                                                                </span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#step-2">
                                                                <span class="step_no">2</span>
                                                                <span class="step_descr">Bước 2<br />
                                                                </span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#step-3">
                                                                <span class="step_no">3</span>
                                                                <span class="step_descr">Bước 3<br />
                                                                </span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#step-4">
                                                                <span class="step_no">4</span>
                                                                <span class="step_descr">Bước 4<br />
                                                                </span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="#step-5">
                                                                <span class="step_no">5</span>
                                                                <span class="step_descr">Bước 5<br />
                                                                </span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                    <div id="step-1">
                                                        <asp:HiddenField runat="server" ID="hdId" />
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                                Tên sách:<span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <asp:TextBox runat="server" ID="Ten" CssClass="form-control col-md-7 col-xs-12" required="required" data-parsley-group="step1" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                                Nhà xuất bản <span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <asp:DropDownList runat="server" ID="NhaXB" CssClass="form-control col-md-7 col-xs-12">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                                Mã số phân loại<span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <asp:TextBox runat="server" ID="MsPhanLoai" CssClass="form-control col-md-7 col-xs-12" required="required" data-parsley-group="step1"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                                Tập<span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <asp:TextBox runat="server" ID="Tap" type="number" name="Tap" CssClass="form-control col-md-7 col-xs-12" required="required" data-parsley-group="step1" />
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                                Ngôn ngữ <span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <asp:DropDownList runat="server" ID="NgonNgu" CssClass="form-control col-md-7 col-xs-12">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                                Năm xuất bản<span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <asp:TextBox runat="server" ID="NamXuatBan" type="number" CssClass="form-control col-md-7 col-xs-12" required="required" data-parsley-length="[4,4]" data-parsley-group="step1" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                                Nước xuất bản<span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <asp:TextBox runat="server" ID="NuocXuatBan" CssClass="form-control col-md-7 col-xs-12" required="required" data-parsley-group="step1" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="step-2">
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                                Tác giả<span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                <asp:ListBox runat="server" ID="tacgia" CssClass="select2_multiple form-control col-md-9 col-sm-9 col-xs-12 tacgia" Style="width: auto; min-width: 100px;" SelectionMode="Multiple"></asp:ListBox>
                                                                <asp:TextBox runat="server" ID="txtDSTG" CssClass="hidden"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                                Thể loại<span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                <asp:ListBox runat="server" ID="TheLoai" CssClass="select2_multiple form-control col-md-9 col-sm-9 col-xs-12 theloai" Style="width: auto" SelectionMode="Multiple"></asp:ListBox>
                                                                <asp:TextBox runat="server" ID="txtDSTL" CssClass="hide"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                                Lĩnh vực<span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                <asp:ListBox runat="server" ID="LinhVuc" CssClass="select2_multiple form-control col-md-9 col-sm-9 col-xs-12 linhvuc" Style="width: auto" SelectionMode="Multiple"></asp:ListBox>
                                                                <asp:TextBox runat="server" ID="txtDSLV" CssClass="hide"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="step-3">
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                                ISBN-ISSN<span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <asp:TextBox runat="server" ID="MaVach" CssClass="form-control col-md-7 col-xs-12" required="required" data-parsley-group="step3" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                                Lần xuất bản<span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <asp:TextBox runat="server" ID="LanXuatBan" type="number" CssClass="form-control col-md-7 col-xs-12" required="required" data-parsley-group="step3" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                                Số trang<span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <asp:TextBox runat="server" ID="SoTrang" type="number" CssClass="form-control col-md-7 col-xs-12" required="required" data-parsley-group="step3" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                                Số lượng<span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <asp:TextBox runat="server" ID="SoLuong" type="number" CssClass="form-control col-md-7 col-xs-12" required="required" data-parsley-group="step3" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                                Giá bìa<span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <asp:TextBox ID="GiaBia" runat="server" type="number" CssClass="form-control col-md-7 col-xs-12" required="required" data-parsley-group="step3" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                                Kích thước<span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <asp:TextBox runat="server" ID="KichThuoc" CssClass="form-control col-md-7 col-xs-12" required="required" data-parsley-group="step3" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div id="step-4">
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                                Từ khóa
                                                            </label>
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <asp:TextBox runat="server" ID="TuKhoa" CssClass="form-control  col-md-7 col-xs-12" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                                Sách dịch:
                                                            </label>
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <div id="gender" class="btn-group" data-toggle="buttons">

                                                                    <asp:RadioButton runat="server" ID="CoDich" Text="Có" GroupName="dich" />
                                                                    <asp:RadioButton runat="server" ID="KhongDich" Text="Không" GroupName="dich" />

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                                Tóm tắt nội dung
                                                            </label>
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <asp:TextBox runat="server" ID="NoiDung" TextMode="MultiLine" CssClass="form-control  col-md-7 col-xs-12" Rows="5"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="step-5">
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                                Ảnh bìa
                                                            </label>
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <asp:FileUpload runat="server" ID="Anh" accept="image/*" />

                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                                Bản scan
                                                            </label>
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <asp:FileUpload runat="server" ID="Scan" accept="application/pdf" />
                                                                <asp:LinkButton runat="server" href="#" ID="linkScan">Tải xuống</asp:LinkButton>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">
                                                                Ghi chú
                                                            </label>
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <asp:TextBox runat="server" TextMode="MultiLine" ID="GhiChu" CssClass="form-control  col-md-7 col-xs-12" Rows="4"></asp:TextBox>
                                                            </div>
                                                        </div>
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
                                                <asp:Button runat="server" ID="btnXoa" OnClick="btnXoa_Click" class="btn btn-primary" Text="Xóa" />
                                            </div>

                                        </div>
                                    </div>
                                </div>

                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="grvSach" EventName="PageIndexChanging" />
                                <asp:AsyncPostBackTrigger ControlID="grvSach" EventName="RowCommand" />
                                <asp:PostBackTrigger ControlID="btnSubmit" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>

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
    <script type="text/javascript" src="Teamplate/js/wizard/jquery.smartWizard.js"></script>
    <script src="Teamplate/js/parsley/parsley.min.js"></script>
    <!-- pace -->
    <script src="Teamplate/js/pace/pace.min.js"></script>
    <script type="text/javascript"></script>
    <%-- tag --%>
    <script src="Teamplate/js/tags/jquery.tagsinput.min.js"></script>
    <%-- Custom --%>
    <script>
        $(document).ready(function () {
            Load();
        });
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm != null) {

            prm.add_endRequest(function (sender, e) {
                if (sender._postBackSettings.panelsToUpdate != null) {
                    Load();
                }
            });
        };
        function Load() {
            init();
            $(".btnThem").click(function () {
                var wz = $('#wizard');
                $("#<%=SoLuong.ClientID%>").removeAttr('disabled');
                $('#<%=hdId.ClientID%>').val('');
                wz.smartWizard('goToStep', 1);
                wz.smartWizard('enableFinish', false);
                $('#wizard').find('input').val('');
                $('#modalSach').modal('show');
                init();
            });
            $('#modalSach').on('hidden.bs.modal', function () {
                $('#<%=EditState.ClientID%>').val('hide');
                $('.modal-backdrop').remove();
            });
                $('#modalDelete').on('hidden.bs.modal', function () {
                    $('#<%=DeleteState.ClientID%>').val('hide');
                    $('.modal-backdrop').remove();
                });
                if ($('#<%=DeleteState.ClientID%>').val() == 'delete') {
                $('#modalDelete').modal('show');
            }
            else {
                $('#modalDelete').modal('hide');
                $('.modal-backdrop').remove();
            };
            if ($('#<%=EditState.ClientID%>').val() == "show") {
                var wz = $('#wizard');
                wz.smartWizard('goToStep', 1);
                wz.smartWizard('enableFinish', false);
                $('#modalSach').modal('show')
            };

            function initWizard() {
                var wz = $('#wizard');
                wz.smartWizard('goToStep', 1);
                wz.smartWizard('enableFinish', false);
                $('#modalSach').modal('show')
            }
            $(".select2_single").select2({
                placeholder: "Select a state",
                allowClear: true
            });
            $(".select2_group").select2({});
            $(".tacgia").select2({
                placeholder: "Tác giả",
                allowClear: true
            });
            $(".theloai").select2({
                placeholder: "Thể loại",
                allowClear: true
            });
            $(".linhvuc").select2({
                placeholder: "Lĩnh vực",
                allowClear: true
            });
            function init() {

                $('#form').parsley();
                // Smart Wizard

                $('#wizard').smartWizard({
                    onLeaveStep: leaveAStepCallback,
                    selected: 0,
                    onFinish: onFinishCallback
                });

                function leaveAStepCallback(obj, context) {
                    var ISvalid = true;
                    if (context.fromStep < context.toStep) {
                        ISvalid = validateSteps(context.fromStep);
                    }
                    return ISvalid
                }

                function onFinishCallback(objs, context) {
                    if (validateAllSteps()) {
                        {
                            var tg = $('#<%=tacgia.ClientID%>').val();
                            $('#<%=txtDSTG.ClientID%>').val(tg);
                            var tl = $('#<%=TheLoai.ClientID%>').val();
                            $('#<%=txtDSTL.ClientID%>').val(tl);
                            var lv = $('#<%=LinhVuc.ClientID%>').val();
                            $('#<%=txtDSLV.ClientID%>').val(lv);
                            $(".btn-submit").click();

                        }
                    }
                }
                //lấy data từ form

                // Your Step validation logic
                function validateSteps(stepnumber) {
                    var isStepValid = true;
                    $('.frmmain').parsley().validate("step" + stepnumber);
                    if ($('.frmmain').parsley().isValid("step" + stepnumber)) {
                        isStepValid = true;
                    } else {
                        isStepValid = false;
                    }
                    return isStepValid;
                }
                function validateAllSteps() {
                    var isStepValid = true;
                    $('.frmmain').parsley().validate();
                    if ($('.frmmain').parsley().isValid()) {
                        isStepValid = true;
                    } else {
                        isStepValid = false;
                    }
                    return isStepValid;
                }
            }
        }
    </script>
</asp:Content>
