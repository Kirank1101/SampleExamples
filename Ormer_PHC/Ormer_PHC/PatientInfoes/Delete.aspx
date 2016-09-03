﻿<%@ Page Title="PatientInfoDelete" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Delete.aspx.cs" Inherits="Ormer_PHC.PatientInfoes.Delete" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <h3>Are you sure want to delete this PatientInfo?</h3>
        <asp:FormView runat="server"
            ItemType="Ormer_PHC.Models.PatientInfo" DataKeyNames="PatientID"
            DeleteMethod="DeleteItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the PatientInfo with PatientID <%: Request.QueryString["PatientID"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Delete PatientInfo</legend>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>PatientID</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="PatientID" ID="PatientID" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Blood Group</strong>
								</div>
								<div class="col-sm-4">
									<%#: Item.bloodgroupinfos != null ? Item.bloodgroupinfos.BloodGroupName : "" %>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Name</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="PatientName" ID="PatientName" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Age</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="PatientAge" ID="PatientAge" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Sex</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="Grade" ID="Grade" Mode="ReadOnly" />
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

