<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="patientprescription.aspx.cs" Inherits="Ormer_PHC.patientprescription" %>

<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <style>
        /*Here I will add some css for looks good*/

        .myGrid {
            border: 1px solid #ddd;
            margin: 15px;
            -webkit-border-radius: 3px 3px 0 0;
            -moz-border-radius: 3px 3px 0 0;
            border-radius: 3px 3px 0 0;
        }

            .myGrid td {
                vertical-align: top;
            }

        .header {
            overflow: hidden;
            position: relative;
            border-bottom: 1px solid #ff0000;
            height: 30px;
        }

            .header th {
                color: #428bca;
                font-weight: bold;
                line-height: 40px;
                text-align: left;
                /* text-shadow: 0 1px #FFFFFF; */
                white-space: nowrap;
                border-right: none;
                border-bottom: 2px solid #ddd;
                padding: 0px 15px 0px 15px;
            }

        .trow1 {
            background: #f9f9f9;
        }

        .trow2 {
            background: #fff;
        }

            .trow1 td, .trow2 td {
                color: #555;
                line-height: 18px;
                padding: 9px 5px;
                text-align: left;
                border-right: 1px solid #ddd;
                border-bottom: 1px solid #ddd;
                text-align: left;
            }

        input[type='text'], select {
            border: 1px solid #b8b8b8;
            border-radius: 3px;
            color: #999999;
            float: left;
            height: 22px;
            padding: 0 5px;
            position: relative;
        }
    </style>
    <h3>patient Prescription</h3>
    <div id="divpatientsearch" runat="server">
        <table>

            <tr>
                <td>
                    <asp:Label runat="server" Text="Pateint Name :" CssClass="control-label" />
                </td>
                <td style="width: 280px">
                    <div class="form-horizontal">
                        <asp:TextBox ID="txtPatientName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </td>

                <td>
                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-10">
                            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-default" />
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>


    <table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td></td>
                        <td></td>

                        <td></td>
                        <td></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>

                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div class="form-group"></div>
                <table>

                    <tr>
                        <td>
                            <div class="form-group">
                                <asp:Label runat="server" Text="Disease" CssClass="col-sm-2 control-label" />
                            </div>
                        </td>

                        <td>
                            <div class="form-group">
                                <asp:DropDownList ID="ddlDisease" runat="server" CssClass="form-control"
                                    DataTextField="DiseaseName" DataValueField="MDiseaseID">
                                    <asp:ListItem Text="Select An Option" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="form-group">
                                <asp:Label runat="server" Text="Description" CssClass="col-sm-2 control-label" />
                            </div>
                        </td>

                        <td style="width: 400px">
                            <div class="form-group">
                                <asp:TextBox ID="txtdescription" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <h4>Drugs Details:</h4>
                        </td>
                        <td>
                            <div>
                                <asp:GridView ID="myGridview" runat="server" AutoGenerateColumns="false"
                                     CellPadding="10" CellSpacing="0" ShowFooter="true" OnRowCommand="myGridview_RowCommand"
                                    CssClass="myGrid" HeaderStyle-CssClass="header" RowStyle-CssClass="trow1"
                                    AlternatingRowStyle-CssClass="trow2">

                                    <Columns>
                                        <asp:TemplateField >
                                            <HeaderTemplate>Drug Name</HeaderTemplate>
                                            <ItemTemplate><%#Eval("DrugName") %></ItemTemplate>
                                            <FooterTemplate>
                                                <asp:DropDownList ID="ddldrugname" runat="server"   CssClass="form-control">
                                                    <asp:ListItem Text="Select Drugs" Value="0"></asp:ListItem>
                                                </asp:DropDownList><asp:RequiredFieldValidator ID="rfC" runat="server" ErrorMessage="*"
                                                    ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="ddldrugname" InitialValue="0"></asp:RequiredFieldValidator>

                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>Quantity</HeaderTemplate>
                                            <ItemTemplate><%#Eval("Quantity") %></ItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="rfCN" runat="server" ErrorMessage="*"
                                                    ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtQuantity"></asp:RequiredFieldValidator>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>Dosage</HeaderTemplate>
                                            <ItemTemplate><%#Eval("Dosage") %></ItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="txtDosage" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="rfDG" runat="server" ErrorMessage="*"
                                                    ForeColor="Red" Display="Dynamic" ValidationGroup="Add" ControlToValidate="txtDosage"></asp:RequiredFieldValidator>
                                            </FooterTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-Width="130px">
                                            <HeaderTemplate>Action</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbEdit" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                                                &nbsp;|&nbsp;
                        <asp:LinkButton ID="lbDelete" runat="server" CommandName="Delete">Delete</asp:LinkButton>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Button ID="btnInsert" runat="server" Text="Save" CommandName="Insert" ValidationGroup="Add"  CssClass="btn btn-default" />
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                    </Columns>

                                </asp:GridView>
                            </div>

                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <h4>LabTest Details </h4>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </td>
        </tr>


    </table>

</asp:Content>
