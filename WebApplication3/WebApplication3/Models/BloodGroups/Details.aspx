<%@ Page Title="BloodGroup Details" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Details.aspx.cs" Inherits="WebApplication3.Models.BloodGroups.Details" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
      
        <asp:FormView runat="server"
            ItemType="WebApplication3.Models.BloodGroup" DataKeyNames="BloodGroupID"
            SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the BloodGroup with BloodGroupID <%: Request.QueryString["BloodGroupID"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>BloodGroup Details</legend>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>BloodGroupID</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="BloodGroupID" ID="BloodGroupID" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Name</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="Name" ID="Name" Mode="ReadOnly" />
								</div>
							</div>
                 	<div class="row">
					  &nbsp;
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Back" CssClass="btn btn-default" />
						</div>
					</div>
                </fieldset>
            </ItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>

