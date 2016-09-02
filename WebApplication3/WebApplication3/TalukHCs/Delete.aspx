<%@ Page Title="TalukHCDelete" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Delete.aspx.cs" Inherits="WebApplication3.TalukHCs.Delete" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <h3>Are you sure want to delete this TalukHC?</h3>
        <asp:FormView runat="server"
            ItemType="WebApplication3.Models.TalukHC" DataKeyNames="TalukHCID"
            DeleteMethod="DeleteItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the TalukHC with TalukHCID <%: Request.QueryString["TalukHCID"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Delete TalukHC</legend>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>TalukHCID</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="TalukHCID" ID="TalukHCID" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>DistricHCID</strong>
								</div>
								<div class="col-sm-4">
									<%#: Item.DistricHC != null ? Item.DistricHC.Name : "" %>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Taluk</strong>
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

