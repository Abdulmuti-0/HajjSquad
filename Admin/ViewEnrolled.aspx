<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="ViewEnrolled.aspx.cs" Inherits="Admin_ViewEnrolled" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    
    <div class="alert alert-info alert-dismissible" role="alert" runat="server" visible="false" id="divMsg">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<i class="fa fa-info-circle"></i> <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
	</div>


    <div class="col-md-10">
							<!-- TIMELINE -->
							<div class="panel panel-scrolling">
								<div class="panel-heading">
									<h3 class="panel-title">Recent User Activity</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
								</div>
								<div class="panel-body">
									

                                        <asp:Repeater ID="repOper" runat="server">
                                            <HeaderTemplate>
                                                <ul class="list-unstyled activity-list">
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                 <li>
											        <asp:Image ID="img" runat="server" ImageUrl="~/img/user1.png" alt="Avatar" class="img-circle pull-left avatar" />
											        <p><a href="#"><%#Eval("Name") %></a> <%#Eval("Description") %> <span class="timestamp">20 minutes ago</span></p> 
                                                     <br />

                                                       <asp:Button ID="lbtnAccept" runat="server" Text="Accept" class="btn btn-success" OnClick="lbtnAccept_Click" CommandName='<%#Eval("Id") %>' />
                                                    <asp:Button ID="lbtnReject" runat="server" Text="Reject" class="btn btn-danger" OnClick="lbtnReject_Click" CommandName='<%#Eval("Id") %>' />

                                               
                                                     
                                                     
										         </li>
                                                      
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </ul>
                                            </FooterTemplate>
                                        </asp:Repeater>

										
							
								</div>
							</div>
							<!-- END TIMELINE -->
						</div>
</asp:Content>

