<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ThemTheMuon.aspx.cs" Inherits="QLDTUTEHY.ThemTheMuon" %>

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
                <h3>Quản lý mượn trả</h3>
            </div>
            <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Button runat="server" ID="btnXong" OnClick="btnXong_Click" CssClass="btn btn-primary pull-right" Text="Xong" />
                    </div>
                    <div class="col-md-5 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Thông tin</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                        Mã độc giả:<span class="required">*</span>
                                    </label>
                                    <h4 style="color: red; padding-left: 140px;" runat="server" id="lblMa" class="lbMa"></h4>
                                </div>
                                <div class="form-group" id="divMa">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                        Tên độc giả:<span class="required">*</span>
                                    </label>
                                    <h4 style="color: red; padding-left: 140px;" runat="server" id="lbTen">Trần văn Chiến</h4>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                        Ghi chú:
                                    </label>
                                    <div class="col-md-7 col-sm-6 col-xs-12">
                                        <asp:TextBox runat="server" ID="txtGhiChu" CssClass="form-control col-md-7 col-xs-12" Rows="3" TextMode="MultiLine" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>DS sách mượn trả</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content"></div>
                            <input type="button" id="btnThem" class="btn btn-success pull-right" value="Thêm" />
                            <asp:GridView ID="grvMuonTra" runat="server" OnPageIndexChanging="grvMuonTra_PageIndexChanging" HeaderStyle-CssClass="heading" AllowPaging="True" PageSize="5"
                                CssClass="table table-striped responsive-utilities jambo_table bulk_action col-lg-12 col-md-12 col-xs-12 col-sm-12"
                                AutoGenerateColumns="False" OnRowCommand="grvMuonTra_RowCommand" HeaderStyle-BackColor="#ffffcc" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                <Columns>
                                    <asp:BoundField HeaderText="Mã sách" DataField="MaSach" />
                                    <asp:BoundField HeaderText="Mã số cá biệt" DataField="MaSoCaBiet" />
                                    <asp:BoundField HeaderText="Tình trạng" DataField="TinhTrang" />
                                    <asp:BoundField HeaderText="Loại" DataField="MuonHayTra" ItemStyle-CssClass="giItem" />
                                    <asp:BoundField HeaderText="Số ngày mượn" DataField="SoNgayMuon" />
                                    <asp:TemplateField HeaderText="Hành động" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="btnXoa" CssClass="btnXoa" CommandName='Xoa'>Xóa</asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle CssClass="heading" />
                                <PagerStyle HorizontalAlign="Right" CssClass="pagination-ys" />
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>DS sách mượn trả</h2>
                                <div class="title_right">
                                    <div class="col-md-4 col-sm-5 col-xs-12 form-group pull-right top_search">
                                        <div class="input-group">
                                          <asp:TextBox runat="server" ID="txtTimKiem" CssClass="form-control" placeholder="Tìm kiếm"></asp:TextBox>
                                            <span class="input-group-btn">
                                               
                                                <asp:Button runat="server" ID="btnTimKiem" CssClass=" btn btn-default" Text="Tìm" style="border-radius: 0px 25px 25px 0px;" OnClick="btnTimKiem_Click" />
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                                <asp:GridView ID="grvSachNo" runat="server" OnPageIndexChanging="grvSachNo_PageIndexChanging" HeaderStyle-CssClass="heading" AllowPaging="True" PageSize="5"
                                    CssClass="table table-striped responsive-utilities jambo_table bulk_action col-lg-12 col-md-12 col-xs-12 col-sm-12"
                                    AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" HeaderStyle-BackColor="#ffffcc" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                    <Columns>
                                        <asp:BoundField HeaderText="Mã QT" DataField="MaQuaTrinhMuonTra" />
                                        <asp:BoundField HeaderText="Sách" DataField="TenSach" />
                                        <asp:BoundField HeaderText="MS cá biệt" DataField="MaSoCaBiet" />
                                        <asp:BoundField HeaderText="Thủ thư" DataField="HoTen" />
                                        <asp:TemplateField HeaderText="Ngày Mượn">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lbNgayMuon" Text='<%#DateTime.Parse(Eval("ThoiGianMuonTra").ToString()).ToShortDateString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ngày Trả">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lbNgayTra" Text='<%#DateTime.Parse(Eval("Han").ToString()).ToShortDateString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Hành động" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="btnBaoMat" CommandName='BaoMat'>Báo mất</asp:LinkButton>
                                                /<asp:LinkButton runat="server" ID="btnTra" CommandName='Tra'>Trả</asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle CssClass="heading" />
                                    <PagerStyle HorizontalAlign="Right" CssClass="pagination-ys" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 text-center">
                </div>
                <div class="modal fade bs-example-modal-lg" id="modalEdit" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button id="buttonX" type="button" class="close btnHuy" data-dismiss="modal">
                                    <span aria-hidden="true">×</span>
                                </button>
                                <h4 class="modal-title" id="myModalLabel">Thêm</h4>
                            </div>
                            <asp:HiddenField runat="server" ID="editType" />
                            <div class="modal-body">
                                <label style="color: red; text-align: center;" class="col-md-12 col-sm-12 col-xs-12" id="lbThongBao"></label>
                                <div class="form-group">

                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                        Mã Sách:<span class="required">*</span>
                                    </label>
                                    <div class="col-md-7 col-sm-6 col-xs-12">
                                        <asp:TextBox runat="server" ID="txtMaSach" CssClass="MS form-control col-md-7 col-xs-12" required="required" data-parsley-group="sach" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                        Mã số cá biệt:<span class="required">*</span>
                                    </label>
                                    <div class="col-md-7 col-sm-6 col-xs-12">
                                        <asp:TextBox runat="server" ID="txtMSCaBiet" CssClass="CB form-control col-md-7 col-xs-12" required="required" data-parsley-group="sach" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                        Số ngày mượn:
                                    </label>
                                    <div class="col-md-7 col-sm-6 col-xs-12">
                                        <asp:TextBox runat="server" ID="txtSoNgay" type="number" CssClass="form-control col-md-7 col-xs-12" data-parsley-min="1" required="required" data-parsley-group="sach" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                        Ghi chú:
                                    </label>
                                    <div class="col-md-7 col-sm-6 col-xs-12">
                                        <asp:TextBox runat="server" ID="txtTinhTrang" CssClass="form-control col-md-7 col-xs-12" TextMode="MultiLine" Rows="3" />
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div>
                                    <button type="button" id="btnHuy" class="btn btn-default btnHuy" style="margin-bottom: 0px;" data-dismiss="modal">Hủy</button>
                                    <input type="button" id="btnSaveClient" value="Lưu" class="btn btn-primary" />
                                    <asp:Button CssClass="hidden" runat="server" OnClick="btnSave_Click" Text="Lưu" ID="btnSave" />
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
                                <h3>Bạn có chắc muốn xóa</h3>
                                <asp:HiddenField runat="server" ID="idXoa" />
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default btnHuy" style="margin-bottom: 0px;" data-dismiss="modal">Hủy</button>
                                <asp:Button runat="server" ID="btnXoa" OnClick="btnXoa_Click" class="btn btn-primary" Text="Xóa" />
                            </div>

                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div id="custom_notifications" class="custom-notifications dsp_none">
        <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
        </ul>
        <div class="clearfix"></div>
        <div id="notif-group" class="tabbed_notifications"></div>
    </div>

    <script src="Teamplate/js/jquery.min.js"></script>
    <script src="Teamplate/js/bootstrap.min.js"></script>
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
            $('#btnSaveClient').click(function () {
                var isSValid = true;
                $('.frmmain').parsley().validate("sach");
                if ($('.frmmain').parsley().isValid("sach")) {
                    isValid = true;
                } else {
                    isValid = false;
                }
                if (isValid) $('#<%=btnSave.ClientID%>').click();
            });
            $('.giItem').each(function () {
                var t = $(this).html();
                switch (t) {
                    case '0': $(this).html('Mượn'); break;
                    case '1': $(this).html('Trả'); break;
                    case '2': $(this).html('Báo mất'); break;
                }
            });
            $('.modal-backdrop').remove();
            $('#btnThem').click(function () {
                $('#modalEdit').modal('show');
            })
            $('#<%=txtMaSach.ClientID%>').change(function () {
                Check();
            });
            $('#<%=txtMSCaBiet.ClientID%>').change(function () {
                Check();
            });
            function Check() {

                var dg = $('.lbMa').html();
                var ms = $('.MS').val();
                var cb = $('.CB').val();
                var datag = '{"DG":"' + dg + '","MS":"' + ms + '","CB":"' + cb + '"}';
                $.ajax({
                    type: "POST",
                    url: "SV/CheckID.asmx/CheckMuon",
                    data: datag,
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: function (mgs) {
                        if (mgs.d == 'true') {
                            $("#lbThongBao").html("");
                            $('#btnSaveClient').removeAttr('disabled');
                        }
                        else {
                            $('#btnSaveClient').attr('disabled', true);
                            $("#lbThongBao").html(mgs.d);
                        }
                    }

                })
            }
        };
    </script>
</asp:Content>
