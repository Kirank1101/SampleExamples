<%@ Page Title="MDrugsList" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.cs" Inherits="Ormer_PHC.MDrugs.Default" %>
<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <h2>MDrugs List</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="Insert" Text="Create new" />
    </p>
    <div>
        <asp:ListView id="ListView1" runat="server"
            DataKeyNames="MDrugID" 
			ItemType="Ormer_PHC.Models.MDrugs"
            SelectMethod="GetData">
            <EmptyDataTemplate>
                There are no entries found for MDrugs
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>
								<asp:LinkButton Text="MDrugID" CommandName="Sort" CommandArgument="MDrugID" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Drug Name" CommandName="Sort" CommandArgument="DrugName" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="BatchNo" CommandName="Sort" CommandArgument="BatchNo" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Manufactured date" CommandName="Sort" CommandArgument="MFdate" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Expiry date" CommandName="Sort" CommandArgument="EXdate" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Quantity" CommandName="Sort" CommandArgument="Quantity" runat="Server" />
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
								<asp:DynamicControl runat="server" DataField="MDrugID" ID="MDrugID" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="DrugName" ID="DrugName" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="BatchNo" ID="BatchNo" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="MFdate" ID="MFdate" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="EXdate" ID="EXdate" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Quantity" ID="Quantity" Mode="ReadOnly" />
							</td>
                    <td>
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/MDrugs/Details", Item.MDrugID) %>' Text="Details" /> | 
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/MDrugs/Edit", Item.MDrugID) %>' Text="Edit" /> | 
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/MDrugs/Delete", Item.MDrugID) %>' Text="Delete" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

