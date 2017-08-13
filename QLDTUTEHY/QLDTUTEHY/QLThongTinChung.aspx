<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="QLThongTinChung.aspx.cs" Inherits="QLDTUTEHY.QLThongTinChung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/Paging.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div class="">--%>
    <div class="page-title">
        <div class="title_left">
            <h3>Quản lý thông tin chung</h3>
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
                <div class="" role="tabpanel" data-example-id="togglable-tabs">
                    <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                        <li role="presentation" id="TacGia" class="lab active"><a href="#tab_TacGia" class="atab" id="TacGia-tab" role="tab" data-toggle="tab" aria-expanded="true">Tác giả</a>
                        </li>
                        <li role="presentation" id="TheLoai" class="lab "><a href="#tab_TheLoai" class="atab" role="tab" id="TheLoai-tab" data-toggle="tab" aria-expanded="true">Thể loại</a>
                        </li>
                        <li role="presentation" id="LinhVuc" class="lab"><a href="#tab_LinhVuc" class="atab" role="tab" id="LinhVuc-tab2" data-toggle="tab" aria-expanded="true">Lĩnh vực</a>
                        </li>
                        <li role="presentation" id="NgonNgu" class="lab"><a href="#tab_NgonNgu" class="atab" role="tab" id="NgonNgu-tab3" data-toggle="tab" aria-expanded="true">Ngôn ngữ</a>
                        </li>
                        <li role="presentation" id="NhaXB" class="lab"><a href="#tab_NhaXB" class="atab" role="tab" id="NhaXB-tab4" data-toggle="tab" aria-expanded="true">Nhà xuất bản</a>
                        </li>
                    </ul>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <input type="hidden" id="page" value="TacGia" />
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div id="myTabContent" class="tab-content">
                                <div role="tabpanel" class="tab-pane fade active in" id="tab_TacGia" aria-labelledby="home-tab">
                                    <input type="button" id="btnThemTG" class="btn btn-primary" value="Thêm" />
                                    <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Tải Lại" />
                                    <asp:GridView ID="grvTacGia" runat="server" DataKeyNames="MaTacGia" HeaderStyle-CssClass="heading" PageSize="5" OnRowCommand="grvTacGiaa_RowCommand"
                                        AllowPaging="true" OnPageIndexChanging="grvTacGia_PageIndexChanging" AutoGenerateColumns="false" CssClass="table table-striped responsive-utilities jambo_table bulk_action" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                        <Columns>
                                            <asp:BoundField DataField="MaTacGia" HeaderText="Mã tác giả" />
                                            <asp:BoundField DataField="HoTenTacGia" HeaderText="Tên tác giả" />
                                            <asp:BoundField DataField="MoTa" HeaderText="Mô tả" />
                                            <asp:TemplateField HeaderText="Hành động" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" ID="btnSua" CssClass="btnSua " CommandName='Sua'>Sửa</asp:LinkButton>/
                                                <asp:LinkButton runat="server" ID="btnXoa" CssClass="btnXoa" CommandName='Xoa'>Xóa</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                        <PagerStyle HorizontalAlign="Right" CssClass="pagination-ys" />
                                    </asp:GridView>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="tab_TheLoai" aria-labelledby="profile-tab">
                                    <input type="button" id="btnThemTL" class="btn btn-primary" value="Thêm" />
                                    <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Tải Lại" />
                                    <asp:GridView ID="grvTheLoai" runat="server" DataKeyNames="MaTheLoai" HeaderStyle-CssClass="heading" PageSize="5" OnRowCommand="grvTheLoai_RowCommand"
                                        AllowPaging="true" OnPageIndexChanging="grvTheLoai_PageIndexChanging" AutoGenerateColumns="false" CssClass="table table-striped responsive-utilities jambo_table bulk_action ">
                                        <Columns>
                                            <asp:BoundField DataField="MaTheLoai" HeaderText="Mã thể loại" />
                                            <asp:BoundField DataField="TenTheLoai" HeaderText="Tên thể loại" />
                                            <asp:BoundField DataField="MoTa" HeaderText="Mô tả" />
                                            <asp:TemplateField HeaderText="Hành động" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" ID="btnSua" CssClass="btnSua " CommandName='Sua'>Sửa</asp:LinkButton>/
                                                <asp:LinkButton runat="server" ID="btnXoa" CssClass="btnXoa" CommandName='Xoa'>Xóa</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerStyle HorizontalAlign="Right" CssClass="pagination-ys" />
                                    </asp:GridView>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="tab_LinhVuc" aria-labelledby="profile-tab">
                                    <input type="button" id="btnThemLV" class="btn btn-primary" value="Thêm" />
                                    <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Tải Lại" />
                                    <asp:GridView ID="grvLinhVuc" runat="server" DataKeyNames="MaLinhVuc" HeaderStyle-CssClass="heading" PageSize="5" OnRowCommand="grvLinhVuc_RowCommand" OnPageIndexChanging="grvLinhVuc_PageIndexChanging"
                                        AllowPaging="true" AutoGenerateColumns="false" CssClass="table table-striped responsive-utilities jambo_table bulk_action ">
                                        <Columns>
                                            <asp:BoundField DataField="MaLinhVuc" HeaderText="Mã Lĩnh Vực" />
                                            <asp:BoundField DataField="TenLinhVuc" HeaderText="Tên Lĩnh Vực" />
                                            <asp:BoundField DataField="GhiChu" HeaderText="Ghi Chú" />
                                            <asp:TemplateField HeaderText="Hành động" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" ID="btnSua" CssClass="btnSua " CommandName='Sua'>Sửa</asp:LinkButton>/
                                                <asp:LinkButton runat="server" ID="btnXoa" CssClass="btnXoa" CommandName='Xoa'>Xóa</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerStyle HorizontalAlign="Right" CssClass="pagination-ys" />
                                    </asp:GridView>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="tab_NgonNgu" aria-labelledby="profile-tab">
                                    <input type="button" id="btnThemNN" class="btn btn-primary" value="Thêm" />
                                    <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Tải Lại" />
                                    <asp:GridView ID="grvNgonNgu" runat="server" DataKeyNames="MaNgonNgu" HeaderStyle-CssClass="heading" PageSize="5" OnRowCommand="grvNgonNgu_RowCommand" OnPageIndexChanging="grvNgonNgu_PageIndexChanging"
                                        AllowPaging="true" AutoGenerateColumns="false" CssClass="table table-striped responsive-utilities jambo_table bulk_action ">
                                        <Columns>
                                            <asp:BoundField DataField="MaNgonNgu" HeaderText="Mã Ngôn Ngữ" />
                                            <asp:BoundField DataField="TenNgonNgu" HeaderText="Tên Ngôn Ngữ" />
                                            <asp:TemplateField HeaderText="Hành động" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" ID="btnSua" CssClass="btnSua " CommandName='Sua'>Sửa</asp:LinkButton>/
                                                <asp:LinkButton runat="server" ID="btnXoa" CssClass="btnXoa" CommandName='Xoa'>Xóa</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerStyle HorizontalAlign="Right" CssClass="pagination-ys" />
                                    </asp:GridView>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="tab_NhaXB" aria-labelledby="profile-tab">
                                    <input type="button" id="btnThemNXB" class="btn btn-primary" value="Thêm" />
                                    <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Tải Lại" />
                                    <asp:GridView ID="grvNXB" runat="server" DataKeyNames="MaNXB" HeaderStyle-CssClass="heading" PageSize="5" OnRowCommand="grvNXB_RowCommand"
                                        OnPageIndexChanging="grvNXB_PageIndexChanging"
                                        AllowPaging="true" AutoGenerateColumns="false" CssClass="table table-striped responsive-utilities jambo_table bulk_action ">
                                        <Columns>
                                            <asp:BoundField DataField="MaNXB" HeaderText="Mã Nhà Xuất Bản" />
                                            <asp:BoundField DataField="TenNXB" HeaderText="Tên Nhà Xuất Bản" />
                                            <asp:BoundField DataField="GhiChu" HeaderText="Ghi Chú" />
                                            <asp:TemplateField HeaderText="Hành động" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" ID="btnSua" CssClass="btnSua " CommandName='Sua'>Sửa</asp:LinkButton>/
                                                <asp:LinkButton runat="server" ID="btnXoa" CssClass="btnXoa" CommandName='Xoa'>Xóa</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerStyle HorizontalAlign="Right" CssClass="pagination-ys" />
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="modal fade bs-example-modal-lg" id="modalEdit" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button id="buttonX" type="button" class="close btnHuy" data-dismiss="modal">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                            <h4 class="modal-title" id="myModalLabel">Nhà Xuất Bản</h4>
                                        </div>
                                        <asp:HiddenField runat="server" ID="editType" />
                                        <div class="modal-body">
                                            <asp:HiddenField runat="server" ID="hdId" />
                                            <asp:HiddenField runat="server" ID="typemodal" />
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                    Tên:<span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <asp:TextBox runat="server" ID="txtTen" CssClass="form-control col-md-7 col-xs-12" required="required" />
                                                </div>
                                            </div>
                                            <div class="form-group" id="GroupLogo">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                    URL Logo:<span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <asp:FileUpload accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|images/*" runat="server" ID="fileAnh" CssClass=" form-control col-md-7 col-xs-12" />
                                                </div>
                                            </div>
                                            <div class="form-group" id="GroupGhiChu">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                    Ghi chú:<span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <asp:TextBox TextMode="MultiLine" Rows="3" runat="server" ID="txtGhichu" CssClass="form-control col-md-7 col-xs-12" />
                                                </div>
                                            </div>
                                            <div class="form-group" id="GroupMoTa">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                    Mô tả:<span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <asp:TextBox TextMode="MultiLine" Rows="3" runat="server" ID="txtMoTa" CssClass="form-control col-md-7 col-xs-12" />
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
                                            <asp:HiddenField runat="server" ID="Delete" />
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
                            <asp:AsyncPostBackTrigger ControlID="grvTacGia" EventName="PageIndexChanging" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div class="x_content">
                </div>
            </div>
        </div>
    </div>

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
            $(document).ready(function () {
                SetPAge();
                $(".atab").click(function (event) {
                    var id = event.target.id;
                    id = id.substring(0, id.indexOf('-'));
                    $("#page").val(id);
                    SetPAge();
                    return false;
                })
                function SetPAge() {
                    var id = $("#page").val();
                    $(".lab").removeClass("active");
                    $("#" + id + "").addClass("active");
                    $(".tab-pane").removeClass("active in");
                    $(".tab-pane").css("height", 0);
                    $("#tab_" + id + "").addClass("active in");
                    $("#tab_" + id + "").css("height", 'auto');
                }
                $('#modalEdit').on('hidden.bs.modal', function () {
                    $('#<%=typemodal.ClientID%>').val('hide');
                    $('.modal-backdrop').remove();
                });
                $('#modalDelete').on('hidden.bs.modal', function () {
                    $('#<%=Delete.ClientID%>').val('hide');
                    $('.modal-backdrop').remove();
                })
                ModalEditRun();
                $('#modalEdit').on('hidden.bs.modal', function () {
                    $('#<%=typemodal.ClientID%>').val('hide');
                })
                $('#modalDelete').on('hidden.bs.modal', function () {
                    $('#<%=Delete.ClientID%>').val('');
                })
                $('#btnThemTG').click(function () {
                    $('#<%=typemodal.ClientID%>').val("TG");
                    $('#<%=editType.ClientID%>').val("add");
                    ModalEditRun();
                });
                $('#btnThemTL').click(function () {
                    $('#<%=typemodal.ClientID%>').val("TL");
                    $('#<%=editType.ClientID%>').val("add");
                    ModalEditRun();
                });
                $('#btnThemLV').click(function () {
                    $('#<%=typemodal.ClientID%>').val("LV");
                    ModalEditRun();
                });
                $('#btnThemNXB').click(function () {
                    $('#<%=typemodal.ClientID%>').val("NXB");
                    $('#<%=editType.ClientID%>').val("add");
                    ModalEditRun();
                });
                $('#btnThemNN').click(function () {
                    $('#<%=typemodal.ClientID%>').val("NN");
                    $('#<%=editType.ClientID%>').val("add");
                    ModalEditRun();
                });

                function ModalEditRun() {
                    var typed = $('#<%=Delete.ClientID%>').val();

                    if (typed != '' && typed != null) {

                        $("#modalDelete").modal('show');
                    }

                    var type = $('#<%=typemodal.ClientID%>').val();
                    if (type == "hide")
                    { $('.modal-backdrop').remove(); }
                    if (type == "TG") {
                        $('#myModalLabel').html("Tác giả");
                        $('#GroupLogo').hide();
                        $('#GroupGhiChu').hide();
                        $('#GroupMoTa').show();
                        $("#modalEdit").modal('show');
                    }
                    if (type == "TL") {
                        $('#myModalLabel').html("Thể loại");
                        $('#GroupLogo').hide();
                        $('#GroupGhiChu').hide();
                        $('#GroupMoTa').show();
                        $("#modalEdit").modal('show');
                    }
                    if (type == "LV") {
                        $('#myModalLabel').html("Lĩnh vực");
                        $('#GroupLogo').hide();
                        $('#GroupGhiChu').show();
                        $('#GroupMoTa').hide();
                        $("#modalEdit").modal('show');
                    }
                    if (type == "NXB") {
                        $('#myModalLabel').html("Nhà xuất bản");
                        $('#GroupLogo').show();
                        $('#GroupGhiChu').show();
                        $('#GroupMoTa').hide();
                        $("#modalEdit").modal('show');
                    }
                    if (type == "NN") {
                        $('#myModalLabel').html("Ngôn ngữ");
                        $('#GroupLogo').hide();
                        $('#GroupGhiChu').hide();
                        $('#GroupMoTa').hide();
                        $("#modalEdit").modal('show');
                    }

                }
            })
        };
    </script>
</asp:Content>
