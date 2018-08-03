<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="MyOpertunities.aspx.cs" Inherits="Admin_MyOpertunities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <div class="col-md-12">
        <!-- PANEL NO PADDING -->
        <div class="panel">
            <div class="panel-body no-padding bg-primary text-center">
                <div class="padding-top-30 padding-bottom-30">
                    <h3>Oppertunities</h3>
                </div>
            </div>
        </div>
        <!-- END PANEL NO PADDING -->
    </div>

    
    <div class="alert alert-info alert-dismissible" role="alert" runat="server" visible="false" id="divMsg">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<i class="fa fa-info-circle"></i> <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
	</div>

    <div class="col-md-12">
        <div class="row">
            <asp:Repeater ID="repOper" runat="server">
                <ItemTemplate>
                    <div class="col-md-4">
                        <!-- PANEL NO CONTROLS -->
                        <div class="panel">
                            <div class="panel-footer">

                                <h3 class="title text-center"><span class="icon"><i class="fa fa-shopping-bag"></i></span><%#Eval("Name") %></h3>
                            </div>
                            <div class="panel-body">
                                <p><%#Eval("Description") %>. <span class="timestamp small "><a>learn more...</a></span></p>

                                <span class="timestamp small alert-info"><%#Eval("RemainOpertunities") %> valunter Enroll</span>
                            </div>
                            <hr />
                            <div class="row">
                                <div class="col-md-12 margin-bottom-30">
                                    <div class="col-md-6"><span class="panel-note"><i class="fa fa-clock-o"></i>Last 24 hours</span></div>
                                    <div class="col-md-6 text-right"><asp:LinkButton ID="lbtnViewEnrolled" runat="server" 
                                        OnClick="lbtnViewEnrolled_Click" class="btn btn-success" CommandName='<%#Eval("Id") %>' >View Enrolled</asp:LinkButton></div>
                                </div>
                            </div>
                        </div>
                        <!-- END PANEL NO CONTROLS -->
                    </div>

                </ItemTemplate>
            </asp:Repeater>


        </div>
    </div>


    <%--  --%>


    <%--
    <script src="assets2/js/scripts.min.js"></script>
    <script src="assets2/js/main.min.js"></script>
    <script src="assets2/js/custom.js"></script>--%>


</asp:Content>

