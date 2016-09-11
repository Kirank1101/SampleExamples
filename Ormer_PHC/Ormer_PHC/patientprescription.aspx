<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="patientprescription.aspx.cs" Inherits="Ormer_PHC.patientprescription" %>

<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">

    <h3>patient Prescription</h3>
    <br />
    <div id="divpatientsearch" runat="server">
        <table>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Pateint Name :" CssClass="control-label" />
                </td>
                <td style="width: 280px">
                    <div class="col-sm-offset-0">
                        <asp:TextBox ID="txtPatientName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </td>

                <td>
                        <div class="col-sm-offset-0 col-sm-10">
                            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-default" OnClick="btnSearch_Click" />
                        </div>
                    
                </td>
            </tr>
        </table>
    </div>
    <table>
        <tr>
            <td>
                <div class="form-group">
                    <table>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="Age:" CssClass="control-label">
                                    </asp:Label>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <asp:Label ID="lblage" runat="server" CssClass="control-label"></asp:Label>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Text="Blood Group:" CssClass="control-label"></asp:Label>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <asp:Label ID="lblbloodgroup" runat="server" CssClass="control-label"></asp:Label>
                                </div>
                            </td>

                        </tr>
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
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <fieldset>
                                <legend>Drugs Details</legend>
                                
                                <asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="itemPlaceHolder1"
                                    OnItemEditing="EditRecord" OnItemCanceling="CancelEditRecord" DataKeyNames="AutoId"
                                    OnItemInserting="InsertRecord" OnItemUpdating="UpdateRecord" InsertItemPosition="LastItem"
                                    OnItemDeleting="DeleteRecord">
                                    <EmptyDataTemplate>
                                        There are no entries found for MDrugs
                                    </EmptyDataTemplate>
                                    <LayoutTemplate>
                                        <table class="table">
                                            <tr>
                                                <th style="color: #428bca">Drug Name
                                                </th>
                                                <th style="color: #428bca">Quantity
                                                </th>
                                                <th style="color: #428bca">Dosage
                                                </th>
                                                <th style="color: #428bca">Action
                                                </th>
                                            </tr>
                                            <asp:PlaceHolder ID="itemPlaceHolder1" runat="server"></asp:PlaceHolder>
                                        </table>
                                        <asp:DataPager PageSize="5" runat="server">
                                            <Fields>
                                                <asp:NextPreviousPagerField ShowLastPageButton="False" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
                                                <asp:NumericPagerField ButtonType="Button" NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" NextPreviousButtonCssClass="btn" />
                                                <asp:NextPreviousPagerField ShowFirstPageButton="False" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
                                            </Fields>
                                        </asp:DataPager>
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
                                    <EditItemTemplate>
                                        <tr style="background-color: #efefef;">
                                            <td>
                                                <asp:DropDownList ID="ddldrugName" runat="server" SelectedValue='<%# Eval("DrugNameId") %>'>
                                                    <asp:ListItem Text="Paracitamal" Value="p1" />
                                                    <asp:ListItem Text="calpal125" Value="c1" />
                                                    <asp:ListItem Text="calpal250" Value="c2" />
                                                    <asp:ListItem Text="Amoxylen" Value="a1" />
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtquantity" runat="server" Text='<%# Eval("Quantity") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtdosage" runat="server" Text='<%# Eval("Dosage") %>' />
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update" />
                                                <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel" />
                                            </td>
                                        </tr>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:DropDownList ID="ddldrugName" runat="server" CssClass="form-control">
                                                    <asp:ListItem Text="Paracitamal" Value="p1" />
                                                    <asp:ListItem Text="calpal125" Value="c1" />
                                                    <asp:ListItem Text="calpal250" Value="c2" />
                                                    <asp:ListItem Text="Amoxylen" Value="a1" />
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtquantity" runat="server" CssClass="form-control" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtdosage" runat="server" CssClass="form-control" />
                                            </td>
                                            <td>
                                                <span onclick="return confirm('Are you sure to insert?')">
                                                    <asp:LinkButton ID="lnkInser" runat="server" ValidationGroup="Add1" Text="Insert" CommandName="Insert" />
                                                </span>
                                            </td>
                                        </tr>
                                    </InsertItemTemplate>
                                </asp:ListView>
                            </fieldset>
                            <br />
                            <br />
                        </td>

                    </tr>

                    <tr>
                        <td>
                            <fieldset>
                                <legend>LabTest Details</legend>
                                <asp:ListView ID="ListViewlabtest" runat="server" ItemPlaceholderID="itemPlaceHolder1"
                                    OnItemEditing="LVLabTestEditRecord" OnItemCanceling="LVLabTestCancelEditRecord" DataKeyNames="AutoId"
                                    OnItemInserting="LVLabTestInsertRecord" OnItemUpdating="LVLabTestUpdateRecord" InsertItemPosition="LastItem"
                                    OnItemDeleting="LVLabTestDeleteRecord">
                                    <EmptyDataTemplate>
                                        There are no entries found for MDrugs
                                    </EmptyDataTemplate>
                                    <LayoutTemplate>
                                        <table class="table">
                                            <tr>
                                                <th style="color: #428bca">LabTest Type
                                                </th>
                                                <th style="color: #428bca">Result
                                                </th>
                                                <th style="color: #428bca">Action
                                                </th>
                                            </tr>
                                            <asp:PlaceHolder ID="itemPlaceHolder1" runat="server"></asp:PlaceHolder>
                                        </table>
                                        <asp:DataPager PageSize="5" runat="server">
                                            <Fields>
                                                <asp:NextPreviousPagerField ShowLastPageButton="False" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
                                                <asp:NumericPagerField ButtonType="Button" NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" NextPreviousButtonCssClass="btn" />
                                                <asp:NextPreviousPagerField ShowFirstPageButton="False" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
                                            </Fields>
                                        </asp:DataPager>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <%# Eval("LabtestName") %>
                                            </td>
                                            <td>
                                                <%# Eval("Result") %>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" />

                                                <span onclick="return confirm('Are you sure to delete?')">
                                                    <asp:LinkButton ID="lnkDel" runat="server" Text="Delete" CommandName="Delete" />
                                                </span>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <tr style="background-color: #efefef;">
                                            <td>
                                                <asp:DropDownList ID="ddlLabtestName" runat="server" SelectedValue='<%# Eval("LabTestId") %>'>
                                                    <asp:ListItem Text="Bloodtest" Value="b1" />
                                                    <asp:ListItem Text="calpal125" Value="c1" />
                                                    <asp:ListItem Text="calpal250" Value="c2" />
                                                    <asp:ListItem Text="Amoxylen" Value="a1" />
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtResult" runat="server" Text='<%# Eval("Result") %>' />
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update" />
                                                <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel" />
                                            </td>
                                        </tr>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:DropDownList ID="ddlLabtestName" runat="server" CssClass="form-control">
                                                    <asp:ListItem Text="Paracitamal" Value="p1" />
                                                    <asp:ListItem Text="calpal125" Value="c1" />
                                                    <asp:ListItem Text="calpal250" Value="c2" />
                                                    <asp:ListItem Text="Amoxylen" Value="a1" />
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtResult" runat="server" CssClass="form-control" />
                                            </td>
                                            <td>
                                                <span onclick="return confirm('Are you sure to insert?')">
                                                    <asp:LinkButton ID="lnkInser" runat="server" ValidationGroup="Add1" Text="Insert" CommandName="Insert" />
                                                </span>
                                            </td>
                                        </tr>
                                    </InsertItemTemplate>
                                </asp:ListView>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

    </table>

</asp:Content>
