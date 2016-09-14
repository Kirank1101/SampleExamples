<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ReportBloodGroup.aspx.cs" Inherits="Ormer_PHC.ReportBloodGroup" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <table>
        <tr>
            <td>

                <asp:ListView ID="ListView1" runat="server">
                </asp:ListView>

            </td>
        </tr>
    </table>
</asp:Content>
