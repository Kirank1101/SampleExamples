<%@ Page Title="PrimaryHCSC Details" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Details.aspx.cs" Inherits="WebApplication3.PrimaryHCSCs.Details" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
      
        <asp:FormView runat="server"
            ItemType="WebApplication3.Models.PrimaryHCSC" DataKeyNames="PrimaryHCSCID"
            SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the PrimaryHCSC with PrimaryHCSCID <%: Request.QueryString["PrimaryHCSCID"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>PrimaryHCSC Details</legend>
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
							<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Back" CssClass="btn btn-default" />
						</div>
					</div>
                </fieldset>
            </ItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>

