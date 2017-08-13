<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="QLMuonTra.aspx.cs" Inherits="QLDTUTEHY.QLMuonTra" %>

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

        .modal-sm {
            width: 451px;
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
        </div>
        <div class="row">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel runat="server" ID="updt">
                <ContentTemplate>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Danh sách phiếu mượn</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content"></div>
                            <input type="button" id="btnThem" class="btn btn-primary pull-right" value="Thêm" />
                            <asp:GridView ID="grvMuonTra" runat="server" OnPageIndexChanging="grvMuonTra_PageIndexChanging" HeaderStyle-CssClass="heading" AllowPaging="True" PageSize="4" DataKeyNames="MaQuaTrinhMuonTra"
                                CssClass="table table-striped responsive-utilities jambo_table bulk_action col-lg-12 col-md-12 col-xs-12 col-sm-12"
                                AutoGenerateColumns="False" OnRowCommand="grvMuonTra_RowCommand">
                                <Columns>
                                    <asp:BoundField HeaderText="Mã quá trình" DataField="MaQuaTrinhMuonTra" />
                                    <asp:BoundField HeaderText="Tên độc giả" DataField="MaCanBo_HSSV" />
                                    <asp:BoundField HeaderText="Tên thủ thư" DataField="MaThuThu" />
                                    <asp:TemplateField HeaderText="Ngày Mượn">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lbNgaySinh" Text='<%#DateTime.Parse(Eval("ThoiGianMuonTra").ToString()).ToShortDateString() %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Ghi chú" DataField="GhiChu" />
                                    <asp:BoundField HeaderText="Trả" DataField="Tra" />
                                    <asp:BoundField HeaderText="Mượn" DataField="Muon" />
                                    <asp:TemplateField HeaderText="Xóa" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="btnXoa" CssClass="btnXoa" CommandName='Xoa'>Xóa</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle HorizontalAlign="Right" CssClass="pagination-ys" />
                            </asp:GridView>
                            <asp:HiddenField runat="server" ID="delete" />
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
                            <div class="modal fade bs-example-modal-sm" id="modalDocGia" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">

                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                            <h4 class="modal-title">Thêm thẻ mượn</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">
                                                    Mã độc giả:<span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="txtMaDG" class="form-control col-md-7 col-xs-12" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" id="btnTiep" disabled="disabled">Tiếp</button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
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
            $('#btnThem').click(function () {
                $('#modalDocGia').modal('show');
            });
            $('#txtMaDG').change(function () {
                var id = $('#txtMaDG').val();             
                $.ajax({
                    type: "POST",
                    url: "SV/CheckID.asmx/CheckIDDG",
                    data: "{'id':'" + id + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: function (mgs) {
                        if(mgs.d!=null&&mgs.d!='')
                            $('#btnTiep').removeAttr('disabled');
                        else $("#btnTiep").attr('disabled', true);
                    }

                })
            });
            $('#btnTiep').click(function () {
                var url = 'ThemTheMuon.aspx?ID=' + $('#txtMaDG').val();
                window.open(url,'_blank');
            });
            var deletestate = $('#<%=delete.ClientID%>').val();
            if(deletestate=='show')
            {
                $("#modalDelete").modal('show');
            }
            else {
                $("#modalDelete").modal('hide');
                $('.modal-backdrop').remove();
                $('#modalDelete').on('hidden.bs.modal', function () {
                    $('#<%=delete.ClientID%>').val('hide');
                    $('.modal-backdrop').remove();
                })
            }
        }
    </script>
</asp:Content>
