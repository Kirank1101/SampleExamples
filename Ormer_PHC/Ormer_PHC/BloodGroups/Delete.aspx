<%@ Page Title="MBloodGroupDelete" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Delete.aspx.cs" Inherits="Ormer_PHC.BloodGroups.Delete" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <h3>Are you sure want to delete this MBloodGroup?</h3>
        <asp:FormView runat="server"
            ItemType="Ormer_PHC.Models.MBloodGroup" DataKeyNames="MBloodGroupID"
            DeleteMethod="DeleteItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the MBloodGroup with MBloodGroupID <%: Request.QueryString["MBloodGroupID"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Delete MBloodGroup</legend>
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
							<asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
							<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default" />
						</div>
					</div>
                </fieldset>
            </ItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>

