<%@ Page Title="MDrugsEdit" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Edit.aspx.cs" Inherits="WebApplication3.MDrugs.Edit" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <asp:FormView runat="server"
            ItemType="WebApplication3.Models.MDrugs" DefaultMode="Edit" DataKeyNames="MDrugID"
            UpdateMethod="UpdateItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the MDrugs with MDrugID <%: Request.QueryString["MDrugID"] %>
            </EmptyDataTemplate>
            <EditItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Edit MDrugs</legend>
					<asp:ValidationSummary runat="server" CssClass="alert alert-danger"  />                 
						    <asp:DynamicControl Mode="Edit" DataField="DrugName" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="BatchNo" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="MFdate" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="EXdate" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Quantity" runat="server" />
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
							<asp:Button runat="server" ID="UpdateButton" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
							<asp:Button runat="server" ID="CancelButton" CommandName="Cancel" Text="Cancel" CausesValidation="false" CssClass="btn btn-default" />
						</div>
					</div>
                </fieldset>
            </EditItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>

