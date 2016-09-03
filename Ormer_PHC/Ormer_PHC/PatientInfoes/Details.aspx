<%@ Page Title="PatientInfo Details" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Details.aspx.cs" Inherits="Ormer_PHC.PatientInfoes.Details" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
      
        <asp:FormView runat="server"
            ItemType="Ormer_PHC.Models.PatientInfo" DataKeyNames="PatientID"
            SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the PatientInfo with PatientID <%: Request.QueryString["PatientID"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>PatientInfo Details</legend>
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
							<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Back" CssClass="btn btn-default" />
						</div>
					</div>
                </fieldset>
            </ItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>

