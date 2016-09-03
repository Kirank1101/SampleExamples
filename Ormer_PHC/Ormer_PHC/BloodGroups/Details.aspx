<%@ Page Title="MBloodGroup Details" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Details.aspx.cs" Inherits="Ormer_PHC.BloodGroups.Details" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
      
        <asp:FormView runat="server"
            ItemType="Ormer_PHC.Models.MBloodGroup" DataKeyNames="MBloodGroupID"
            SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the MBloodGroup with MBloodGroupID <%: Request.QueryString["MBloodGroupID"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>MBloodGroup Details</legend>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>MBloodGroupID</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="MBloodGroupID" ID="MBloodGroupID" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>BloodGroup</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="BloodGroupName" ID="BloodGroupName" Mode="ReadOnly" />
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

