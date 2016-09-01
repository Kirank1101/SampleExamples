<%@ Page Title="PatientinfoDelete" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Delete.aspx.cs" Inherits="WebApplication3.Models.Patientinfoes.Delete" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <h3>Are you sure want to delete this Patientinfo?</h3>
        <asp:FormView runat="server"
            ItemType="WebApplication3.Models.Patientinfo" DataKeyNames="ID"
            DeleteMethod="DeleteItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the Patientinfo with ID <%: Request.QueryString["ID"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Delete Patientinfo</legend>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>ID</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="ID" ID="ID" Mode="ReadOnly" />
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
								<div class="col-sm-2 text-right">
									<strong>Age</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="Age" ID="Age" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Sex</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="Sex" ID="Sex" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>ContactNo</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="ContactNo" ID="ContactNo" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>BloodGroup</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="CategoryId" ID="CategoryId" Mode="ReadOnly" />
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

