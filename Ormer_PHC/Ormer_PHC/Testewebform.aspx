<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Testewebform.aspx.cs" MasterPageFile="~/Site.Master" Inherits="Ormer_PHC.Testewebform" %>

<asp:Content ID="cntid" runat="server" ContentPlaceHolderID="MainContent">
    <h3>Patient Prescription</h3>
    <br />

    <table>
        <tr>
            <td>

                <fieldset>
                    <legend>Drugs Details</legend>

                    <asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="itemPlaceHolder1"
                       DataKeyNames="AutoId"
                        OnPagePropertiesChanging="ListView1_PagePropertiesChanging">
                        <EmptyDataTemplate>
                            There are no entries found for MDrugs
                        </EmptyDataTemplate>
                        <LayoutTemplate>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th style="color: #428bca">
                                            <asp:LinkButton Text="Drug Name" CommandName="Sort" CommandArgument="DrugName" runat="Server" />
                                        </th>
                                        <th style="color: #428bca">Quantity
                                        </th>
                                        <th style="color: #428bca">Dosage
                                        </th>
                                        <th style="color: #428bca">Action
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:PlaceHolder ID="itemPlaceHolder1" runat="server"></asp:PlaceHolder>
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%# Eval("DrugName") %>
                                </td>
                                <td>
                                    <%# Eval("Quantity") %>
                                </td>
                                <td>
                                    <%# Eval("Dosage") %>
                                </td>
                                <td>
                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" />

                                    <span onclick="return confirm('Are you sure to delete?')">
                                        <asp:LinkButton ID="lnkDel" runat="server" Text="Delete" CommandName="Delete" />
                                    </span>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                    <asp:DataPager ID="DPLV1" PageSize="5" runat="server" PagedControlID="ListView1">
                        <Fields>
                            <asp:NextPreviousPagerField ShowLastPageButton="False" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
                            <asp:NumericPagerField ButtonType="Button" NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" NextPreviousButtonCssClass="btn" />
                            <asp:NextPreviousPagerField ShowFirstPageButton="False" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
                        </Fields>
                    </asp:DataPager>
                </fieldset>
            </td>
        </tr>
    </table>
</asp:Content>
