﻿<%@ Page Title="PatientInfoEdit" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Edit.aspx.cs" Inherits="Ormer_PHC.PatientInfoes.Edit" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <asp:FormView runat="server"
            ItemType="Ormer_PHC.Models.PatientInfo" DefaultMode="Edit" DataKeyNames="PatientID"
            UpdateMethod="UpdateItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the PatientInfo with PatientID <%: Request.QueryString["PatientID"] %>
            </EmptyDataTemplate>
            <EditItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Edit PatientInfo</legend>
					<asp:ValidationSummary runat="server" CssClass="alert alert-danger"  />                 
							<asp:DynamicControl Mode="Edit" 
								DataField="MBloodGroupID" 
								DataTypeName="Ormer_PHC.Models.MBloodGroup" 
								DataTextField="BloodGroupName" 
								DataValueField="MBloodGroupID" 
								UIHint="ForeignKey" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="PatientName" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="PatientAge" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Grade" runat="server" />
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

