<%@ Page Title="BloodGroupList" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.cs" Inherits="WebApplication3.Models.BloodGroups.Default" %>
<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <h2>BloodGroups List</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="Insert" Text="Create new" />
    </p>
    <div>
        <asp:ListView id="ListView1" runat="server"
            DataKeyNames="BloodGroupID" 
			ItemType="WebApplication3.Models.BloodGroup"
            SelectMethod="GetData">
            <EmptyDataTemplate>
                There are no entries found for BloodGroups
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>
								<asp:LinkButton Text="BloodGroupID" CommandName="Sort" CommandArgument="BloodGroupID" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Name" CommandName="Sort" CommandArgument="Name" runat="Server" />
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
								<asp:DynamicControl runat="server" DataField="BloodGroupID" ID="BloodGroupID" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Name" ID="Name" Mode="ReadOnly" />
							</td>
                    <td>
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Models/BloodGroups/Details", Item.BloodGroupID) %>' Text="Details" /> | 
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Models/BloodGroups/Edit", Item.BloodGroupID) %>' Text="Edit" /> | 
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Models/BloodGroups/Delete", Item.BloodGroupID) %>' Text="Delete" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

