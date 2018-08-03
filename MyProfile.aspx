<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-profile">
        <div class="clearfix">
            <!-- LEFT COLUMN -->
            <div class="profile-left">
                <!-- PROFILE HEADER -->
                <div class="profile-header">
                    <div class="overlay">
                    </div>
                    <div class="profile-main">
                        <img src="img/user-medium.png" width="90px" hight="90px" class="img-circle" alt="Avatar">
                        <br />
                        <asp:Label ID="TextName" runat="server" CssClass="name"></asp:Label>
                    </div>
                    <div class="profile-stat">
                        <div class="row">
                            <div class="col-md-4 stat-item">
                                45 <span>volunteers</span>
                            </div>
                            <div class="col-md-4 stat-item">
                                15 <span>Awards</span>
                            </div>
                            <div class="col-md-4 stat-item">
                                2174 <span>Points</span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END PROFILE HEADER -->
                <!-- PROFILE DETAIL -->
                <div class="profile-detail">
                    <div class="profile-info">
                        <h4 class="heading">Information</h4>
                        <ul class="list-unstyled list-justify">
                            <li>Name :<asp:Label ID="txtname1" Style="text-align: left" Width="80%" runat="server"></asp:Label></li>
                            <li>Mobile :<asp:Label ID="txtphone1" Style="text-align: left" Width="80%" runat="server"></asp:Label></li>
                            <li>Email :<asp:Label ID="txtemail1" Style="text-align: left" Width="80%" runat="server"></asp:Label></li>
                        </ul>
                    </div>
                    <div class="profile-info">
                        <h4 class="heading">Social</h4>
                        <ul class="list-inline social-icons text-center">
                            <li><a href="#" class="twitter-bg"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#" class="google-plus-bg"><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                    <div class="profile-info">
                        <h4 class="heading">About</h4>
                        <p>
                            a b c
                        </p>
                    </div>
                    <div class="text-center">
                        <a href="#" class="btn btn-primary">Edit Profile</a>
                    </div>
                </div>
                <!-- END PROFILE DETAIL -->
            </div>
            <!-- END LEFT COLUMN -->
            <!-- RIGHT COLUMN -->
            <div class="profile-right">
                <h4 class="heading">Awards</h4>
                <!-- AWARDS -->
                <div class="awards">
                    <div class="row">
                        <div class="col-md-3 col-sm-6">
                            <div class="award-item">
                                <div class="hexagon">
                                    <span class="lnr lnr-sun award-icon"></span>
                                </div>
                                <span>Most Bright Idea</span>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="award-item">
                                <div class="hexagon">
                                    <span class="lnr lnr-clock award-icon"></span>
                                </div>
                                <span>Most On-Time</span>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="award-item">
                                <div class="hexagon">
                                    <span class="lnr lnr-magic-wand award-icon"></span>
                                </div>
                                <span>Problem Solver</span>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="award-item">
                                <div class="hexagon">
                                    <span class="lnr lnr-heart award-icon"></span>
                                </div>
                                <span>Most Loved</span>
                            </div>
                        </div>
                    </div>
                    <div class="text-center">
                        <a href="#" class="btn btn-default">See all awards</a>
                    </div>
                </div>
                <!-- END AWARDS -->
                <!-- TABBED CONTENT -->
                <div class="custom-tabs-line tabs-line-bottom left-aligned">
                    <ul class="nav" role="tablist">
                        <li class="active"><a href="#tab-bottom-left1" role="tab" data-toggle="tab">Recent work</a></li>
                        <li><a href="#tab-bottom-left2" role="tab" data-toggle="tab">Projects <span class="badge">
                            <asp:Label runat="server" ID="txtTotalCounts"></asp:Label>
                        </span></a></li>
                    </ul>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="tab-bottom-left1">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <ul class="list-unstyled activity-timeline">
                                    <li><i class="fa fa-comment activity-icon"></i>
                                        <p>
                                            <%#Eval("ActivityName") %>
                                        </p>
                                        <p>
                                            <%#Eval("ActivityDesc") %>
                                        </p>
                                    </li>
                                </ul>
                            </ItemTemplate>
                        </asp:Repeater>
                        <div class="margin-top-30 text-center">
                            <a href="#" class="btn btn-default">See all activity</a>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tab-bottom-left2">
                        <div class="table-responsive">
                            <table class="table project-table">
                                <thead>
                                    <tr>
                                        <th>Name
                                        </th>
                                        <th>Description
                                        </th>
                                        <th>Company
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Repeater2" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <a href="#"><%#Eval("Name") %></a>
                                                </td>
                                                <td>
                                                    <p><%#Eval("Description") %></p>
                                                </td>
                                                <td>

                                                    <a href="#"><%#Eval("Name") %></a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- END TABBED CONTENT -->
            </div>
            <!-- END RIGHT COLUMN -->
        </div>
    </div>
</asp:Content>
