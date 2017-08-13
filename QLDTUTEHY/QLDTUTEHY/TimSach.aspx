<%@ Page Title="" Language="C#" MasterPageFile="~/NguoiDung.Master" AutoEventWireup="true" CodeBehind="TimSach.aspx.cs" Inherits="QLDTUTEHY.TimSach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>Tìm kiếm sách</h3>
                    </div>
                    <div class="title_right">
                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                            <div class="input-group">
                                <asp:TextBox runat="server" ID="txtKey" CssClass="form-control" placeholder="Tìm"></asp:TextBox>
                                <span class="input-group-btn">

                                    <asp:Button runat="server" ID="btnSearch" CssClass=" btn btn-default" Text="Tìm" Style="border-radius: 0px 25px 25px 0px;" OnClick="Unnamed_Click" />
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
                                <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Tải Lại" />
                                <asp:GridView ID="grvTimSach" runat="server" HeaderStyle-CssClass="heading" AllowPaging="true" PageSize="8" DataKeyNames="MaSach"
                                    CssClass="table table-striped responsive-utilities jambo_table bulk_action col-lg-12 col-md-12 col-xs-12 col-sm-12"
                                    AutoGenerateColumns="false" OnPageIndexChanging="grvTimSach_PageIndexChanging" OnRowCommand="grvTimSach_RowCommand">
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
                                                        <asp:LinkButton runat="server" ID="lbTheLoai" Text='<%# DataBinder.Eval(Container.DataItem,"TenTheLoai") %>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Lĩnh vực">
                                            <ItemTemplate>
                                                <asp:Repeater ID="rpLinhVuc" runat="server" DataSource='<%# DataBinder.Eval(Container.DataItem,"DSLinhVuc") %>'>
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="lbLinhVuc" Text='<%# DataBinder.Eval(Container.DataItem,"TenLinhVuc") %>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ngôn ngữ">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="NgonNgu" Text='<%#Eval("MaNgonNgu") %>'></asp:Label>
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
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Right" CssClass="pagination-ys" />
                                </asp:GridView>

                                <div class="modal fade bs-example-modal-lg" id="modalSach" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">

                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">
                                                    <span aria-hidden="true">×</span>
                                                </button>
                                                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                                            </div>

                                        </div>
                                    </div>
                                </div>


                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
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
    <script>
        $('#btnSearchC').click(function () {

            $('#<%=btnSearch.ClientID%>').click();

        });
    </script>
    <%-- Custom --%>
</asp:Content>

