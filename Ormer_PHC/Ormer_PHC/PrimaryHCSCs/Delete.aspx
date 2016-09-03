<%@ Page Title="PrimaryHCSCDelete" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Delete.aspx.cs" Inherits="Ormer_PHC.PrimaryHCSCs.Delete" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <h3>Are you sure want to delete this PrimaryHCSC?</h3>
        <asp:FormView runat="server"
            ItemType="Ormer_PHC.Models.PrimaryHCSC" DataKeyNames="PrimaryHCSCID"
            DeleteMethod="DeleteItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the PrimaryHCSC with PrimaryHCSCID <%: Request.QueryString["PrimaryHCSCID"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Delete PrimaryHCSC</legend>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>PrimaryHCSCID</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="PrimaryHCSCID" ID="PrimaryHCSCID" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>PrimaryHCID</strong>
								</div>
								<div class="col-sm-4">
									<%#: Item.PrimaryHC != null ? Item.PrimaryHC.Name : "" %>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Primary Sub Sector</strong>
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

