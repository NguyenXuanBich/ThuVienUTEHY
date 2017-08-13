<%@ Page Title="" Language="C#" MasterPageFile="~/NguoiDung.Master" AutoEventWireup="true" CodeBehind="ChiTietNguoiDung.aspx.cs" Inherits="QLDTUTEHY.ChiTietNguoiDung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>

    <div class="container body">
        <div class="main_container">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>Chi tiết người dùng</h3>
                    </div>

                    <div class="title_right">
                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search for...">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">Go!</button>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Thông tin</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#">Settings 1</a>
                                            </li>
                                            <li><a href="#">Settings 2</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="col-md-3 col-sm-3 col-xs-12 profile_left">
                                    <div class="profile_img">
                                        <div id="crop-avatar">
                                            <img class="img-responsive avatar-view" src="images/picture.jpg" alt="Avatar" title="Change the avatar">
                                            <div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>
                                        </div>
                                    </div>
                                    <h3 runat="server" id="hTen"></h3>

                                    <ul class="list-unstyled user_data">
                                        <li>Mã độc giả: <i runat="server" id="hMa"></i></li>

                                        <li>
                                            <i class="fa fa-briefcase user-profile-icon"></i>Lớp Tk11.1
                                        </li>

                                        <li class="m-top-xs">
                                            <i class="fa fa-external-link user-profile-icon"></i>
                                            <a href="http://www.kimlabs.com/profile/" target="_blank">https://www.facebook.com/</a>
                                        </li>
                                    </ul>

                                    <a class="btn btn-success"><i class="fa fa-edit m-right-xs"></i>Chỉnh Sửa</a>
                                    <br />
                                </div>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h2>Danh sách sách mượn</h2>
                                            <div class="clearfix"></div>
                                        </div>
                                        <asp:GridView ID="grvSachMuon" runat="server" OnPageIndexChanging="grvSachMuon_PageIndexChanging" HeaderStyle-CssClass="heading" AllowPaging="True" PageSize="5"
                                            CssClass="table table-striped responsive-utilities jambo_table bulk_action col-lg-12 col-md-12 col-xs-12 col-sm-12"
                                            AutoGenerateColumns="False" OnRowCommand="grvSachMuon_RowCommand" HeaderStyle-BackColor="#ffffcc" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
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
                                            </Columns>
                                            <HeaderStyle CssClass="heading" />
                                            <PagerStyle HorizontalAlign="Right" CssClass="pagination-ys" />
                                        </asp:GridView>
                                    </div>
                                    <div id="graph_bar" style="width: 100%; height: 280px;"></div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <div class="pull-right">
                Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
            </div>
            <div class="clearfix"></div>
        </footer>
    </div>
    </div>
    <script src="Teamplate/js/jquery.min.js"></script>
    <script src="Teamplate/js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>
</asp:Content>
