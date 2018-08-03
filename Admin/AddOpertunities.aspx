<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="AddOpertunities.aspx.cs" Inherits="Admin_AddOpertunities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="alert alert-info alert-dismissible" role="alert" runat="server" visible="false" id="divMsg">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<i class="fa fa-info-circle"></i> <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
	</div>

	<!-- WRAPPER -->
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box ">
					
                    
    


						<div class="content">
							<div class="header">
								<%--<div class="logo text-center"><img src="assets/img/logo-dark.png" alt="Klorofil Logo"></div>--%>
								<p class="lead">Add Opertunity</p>
							</div>
							<div class="form-auth-small" action="index.php">
								<div class="form-group">
									<label for="signin-Categories" class="control-label sr-only">Category</label>
									<asp:DropDownList ID="Categories" runat="server" CssClass="form-control" placeholder="" DataSourceID="SqlDsCategories" DataTextField="CategoryName" DataValueField="Id"></asp:DropDownList>
								    <asp:SqlDataSource ID="SqlDsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:DBConStr %>" SelectCommand="SELECT * FROM [Categories]"></asp:SqlDataSource>
								</div>
								
                                <div class="form-group">
									<label for="signin-Name" class="control-label sr-only">Job Title</label>
									<asp:TextBox ID="Name" runat="server" CssClass="form-control" placeholder="Job Title"></asp:TextBox>
								</div>
                                <div class="form-group">
									<label for="signin-Descriptions" class="control-label sr-only">Description</label>
									<asp:TextBox ID="Descriptions" TextMode="MultiLine" runat="server" CssClass="form-control" placeholder="Description"></asp:TextBox>
								</div>
                                <div class="form-group">
									<label for="signin-MaxNoOfValunter" class="control-label sr-only">Max No Of Valunter</label>
									<asp:TextBox ID="MaxNoOfValunter" TextMode="Number" runat="server" CssClass="form-control" placeholder="Max No Of Valunter"></asp:TextBox>
								</div>
                                
								<asp:Button ID="btnAddOpertunity" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Add Opertunity" OnClick="btnAddOpertunity_Click" />
								
							</div>
						</div>
					
					
				</div>
			</div>
		</div>
	</div>
	<!-- END WRAPPER -->
</asp:Content>

