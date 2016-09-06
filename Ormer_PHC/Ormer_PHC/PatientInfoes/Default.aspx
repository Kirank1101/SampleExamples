<%@ Page Title="PatientInfoList" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.cs" Inherits="Ormer_PHC.PatientInfoes.Default" %>
<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">


    <h2>PatientInfoes List</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="Insert" Text="Create new" />
    </p>


    <br /><br />
<asp:Label runat="server" Text="Pateint Name :" />

    <asp:TextBox ID="txtPatientName" runat="server"  ></asp:TextBox><asp:Button ID="btnSearch" runat="server" Text="Search: " />



    <div>
        <asp:ListView id="ListView1" runat="server"
            DataKeyNames="PatientID" 
			ItemType="Ormer_PHC.Models.PatientInfo"
            SelectMethod="GetData">
            <EmptyDataTemplate>
                There are no entries found for PatientInfoes
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>
								<asp:LinkButton Text="PatientID" CommandName="Sort" CommandArgument="PatientID" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Blood Group" CommandName="Sort" CommandArgument="MBloodGroupID" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Name" CommandName="Sort" CommandArgument="PatientName" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Age" CommandName="Sort" CommandArgument="PatientAge" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Sex" CommandName="Sort" CommandArgument="Grade" runat="Server" />
							</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr runat="server" id="itemPlaceholder" />
                    </tbody>
                </table>
				<asp:DataPager PageSize="5"  runat="server">
					<Fields>
                        <asp:NextPreviousPagerField ShowLastPageButton="False" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
                        <asp:NumericPagerField ButtonType="Button"  NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" NextPreviousButtonCssClass="btn" />
                        <asp:NextPreviousPagerField ShowFirstPageButton="False" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
                    </Fields>
				</asp:DataPager>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
							<td>
								<asp:DynamicControl runat="server" DataField="PatientID" ID="PatientID" Mode="ReadOnly" />
							</td>
							<td>
								<%#: Item.bloodgroupinfos != null ? Item.bloodgroupinfos.BloodGroupName : "" %>
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="PatientName" ID="PatientName" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="PatientAge" ID="PatientAge" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Grade" ID="Grade" Mode="ReadOnly" />
							</td>
                    <td>
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/PatientInfoes/Details", Item.PatientID) %>' Text="Details" /> | 
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/PatientInfoes/Edit", Item.PatientID) %>' Text="Edit" /> | 
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/PatientInfoes/Delete", Item.PatientID) %>' Text="Delete" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

