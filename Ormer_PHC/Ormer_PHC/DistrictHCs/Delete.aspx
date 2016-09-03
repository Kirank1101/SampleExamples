<%@ Page Title="DistrictHCDelete" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Delete.aspx.cs" Inherits="Ormer_PHC.DistrictHCs.Delete" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <h3>Are you sure want to delete this DistrictHC?</h3>
        <asp:FormView runat="server"
            ItemType="Ormer_PHC.Models.DistrictHC" DataKeyNames="DistricHCID"
            DeleteMethod="DeleteItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the DistrictHC with DistricHCID <%: Request.QueryString["DistricHCID"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Delete DistrictHC</legend>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>DistricHCID</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="DistricHCID" ID="DistricHCID" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>StateHCID</strong>
								</div>
								<div class="col-sm-4">
									<%#: Item.StateHC != null ? Item.StateHC.Name : "" %>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>District</strong>
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
							<asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
							<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default" />
						</div>
					</div>
                </fieldset>
            </ItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>

