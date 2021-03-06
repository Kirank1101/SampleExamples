﻿<%@ Page Title="Villages Details" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Details.aspx.cs" Inherits="Ormer_PHC.Villages.Details" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
      
        <asp:FormView runat="server"
            ItemType="Ormer_PHC.Models.Villages" DataKeyNames="VillagesID"
            SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the Villages with VillagesID <%: Request.QueryString["VillagesID"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Villages Details</legend>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>VillagesID</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="VillagesID" ID="VillagesID" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>PrimaryHCSCID</strong>
								</div>
								<div class="col-sm-4">
									<%#: Item.PrimaryHCSC != null ? Item.PrimaryHCSC.Name : "" %>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Villages</strong>
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

