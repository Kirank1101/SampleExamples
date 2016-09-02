<%@ Page Title="PrimaryHCSCList" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.cs" Inherits="WebApplication3.PrimaryHCSCs.Default" %>
<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <h2>PrimaryHCSCs List</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="Insert" Text="Create new" />
    </p>
    <div>
        <asp:ListView id="ListView1" runat="server"
            DataKeyNames="PrimaryHCSCID" 
			ItemType="WebApplication3.Models.PrimaryHCSC"
            SelectMethod="GetData">
            <EmptyDataTemplate>
                There are no entries found for PrimaryHCSCs
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>
								<asp:LinkButton Text="PrimaryHCSCID" CommandName="Sort" CommandArgument="PrimaryHCSCID" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="PrimaryHCID" CommandName="Sort" CommandArgument="PrimaryHCID" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Primary Sub Sector" CommandName="Sort" CommandArgument="Name" runat="Server" />
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
								<asp:DynamicControl runat="server" DataField="PrimaryHCSCID" ID="PrimaryHCSCID" Mode="ReadOnly" />
							</td>
							<td>
								<%#: Item.PrimaryHC != null ? Item.PrimaryHC.Name : "" %>
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Name" ID="Name" Mode="ReadOnly" />
							</td>
                    <td>
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/PrimaryHCSCs/Details", Item.PrimaryHCSCID) %>' Text="Details" /> | 
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/PrimaryHCSCs/Edit", Item.PrimaryHCSCID) %>' Text="Edit" /> | 
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/PrimaryHCSCs/Delete", Item.PrimaryHCSCID) %>' Text="Delete" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

