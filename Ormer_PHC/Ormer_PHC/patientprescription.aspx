<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="patientprescription.aspx.cs" Inherits="Ormer_PHC.patientprescription" %>

<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">

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
                                        <asp:TemplateField>
                                            <HeaderTemplate>Drug Name</HeaderTemplate>
                                            <ItemTemplate><%#Eval("DrugName") %></ItemTemplate>
                                            <FooterTemplate>
                                                <asp:DropDownList ID="ddldrugname" runat="server" CssClass="form-control">
                                                    <asp:ListItem Text="Select Drugs" Value="0"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfC" runat="server" ErrorMessage="*"
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
                                                <asp:Button ID="btnInsert" runat="server" Text="Save" CommandName="Insert" ValidationGroup="Add" CssClass="btn btn-default" />
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
                        <td>
                            <p>
                                <asp:Label ID="lblMessage" runat="server" EnableViewState="false" />
                            </p>

                            <%--<asp:ListView ID="lstviewLabTest" runat="server" ItemPlaceholderID="itemPlaceHolder1"
                                OnItemEditing="EditRecord" OnItemCanceling="CancelEditRecord" DataKeyNames="AutoId"
                                OnItemInserting="InsertRecord" OnItemUpdating="UpdateRecord" InsertItemPosition="LastItem"
                                OnItemDeleting="DeleteRecord">
                                <EmptyDataTemplate>
                                    There are no entries found for MDrugs
                                </EmptyDataTemplate>
                                <LayoutTemplate>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th class="labelForecolor">LabTest</th>
                                                <th class="labelForecolor">Result</th>
                                                <th class="labelForecolor">Edit</th>
                                            </tr>
                                        </thead>
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
                                            <%#Eval("LabTest") %>
                                        </td>
                                        <td>
                                            <%# Eval("Result") %>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" /> |
                                            <span onclick="return confirm('Are you sure to delete?')">
                                                <asp:LinkButton ID="lnkDel" runat="server" Text="Delete" CommandName="Delete" />
                                            </span>
                                        </td>

                                    </tr>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <tr>
                                        <td>LabTest:
                                            <asp:DropDownList ID="dropEACtive" runat="server" SelectedValue='<%# Eval("Active") %>'>
                                                <asp:ListItem Text="Yes" Value="True" />
                                                <asp:ListItem Text="No" Value="False" />
                                            </asp:DropDownList>
                                        </td>
                                        <td>Result:
                                            <asp:TextBox ID="txtEAge" runat="server" Text='<%# Eval("Age") %>' Columns="3" />
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
                                            <asp:DropDownList ID="ddllabtest" runat="server">
                                                <asp:ListItem Text="Yes" Value="True" />
                                                <asp:ListItem Text="No" Value="False" />
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtresult" runat="server" />
                                        </td>
                                        <td>
                                            <span onclick="return confirm('Are you sure to insert?')">
                                                <asp:LinkButton ID="lnkInser" runat="server" Text="Insert" CommandName="Insert" />
                                            </span>
                                        </td>
                                    </tr>
                                </InsertItemTemplate>

                            </asp:ListView>

                            <asp:ListView ID="ListView3" runat="server"
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
                                                    <asp:Label runat="server" Text="Description" /></th>
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
                                            <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/MDrugs/Details", Item.MDrugID) %>' Text="Details" />
                                            | 
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/MDrugs/Edit", Item.MDrugID) %>' Text="Edit" />
                                            | 
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/MDrugs/Delete", Item.MDrugID) %>' Text="Delete" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>--%>

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

                                            <th style="color: #428bca">Delete?
                                            </th>

                                            <th style="color: #428bca">AutoId
                                            </th>

                                            <th style="color: #428bca">First Name
                                            </th>

                                            <th style="color: #428bca">Last Name
                                            </th>

                                            <th style="color: #428bca">Age
                                            </th>

                                            <th style="color: #428bca">Active
                                            </th>

                                            <th style="color: #428bca">Edit
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

                                            <span onclick="return confirm('Are you sure to delete?')">

                                                <asp:LinkButton ID="lnkDel" runat="server" Text="Delete?" ForeColor="Red" CommandName="Delete" />
                                            </span>

                                        </td>

                                        <td>

                                            <%# Eval("AutoID") %>

                                        </td>

                                        <td>

                                            <%# Eval("FirstName") %>
                                        </td>

                                        <td>

                                            <%# Eval("LastName") %>
                                        </td>

                                        <td>

                                            <%#Eval("Age") %>
                                        </td>

                                        <td>

                                            <%# Eval("Active") %>
                                        </td>

                                        <td>

                                            <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" />
                                        </td>
                                    </tr>


                                </ItemTemplate>
                                <EditItemTemplate>

                                    <tr style="background-color: #efefef;">

                                        <td colspan="7">First name:
                                            <asp:TextBox ID="txtEFName" runat="server" Text='<%# Eval("FirstName") %>' />

                                            <br />

                                            Last name:
                                            <asp:TextBox ID="txtELName" runat="server" Text='<%#Eval("LastName") %>' />

                                            <br />

                                            Last name:
                                            <asp:TextBox ID="txtEAge" runat="server" Text='<%# Eval("Age") %>' Columns="3" />

                                            <br />

                                            Active:
                                            <asp:DropDownList ID="dropEACtive" runat="server" SelectedValue='<%# Eval("Active") %>'>

                                                <asp:ListItem Text="Yes" Value="True" />

                                                <asp:ListItem Text="No" Value="False" />
                                            </asp:DropDownList>

                                            <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update" />

                                            <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel" />
                                        </td>
                                    </tr>



                                </EditItemTemplate>
                                <InsertItemTemplate>

                                    <tr style="background-color: yellow;">

                                        <td>&nbsp;
                                        </td>

                                        <td>&nbsp;
                                        </td>

                                        <td>

                                            <asp:TextBox ID="txtFName" runat="server" />
                                        </td>

                                        <td>

                                            <asp:TextBox ID="txtLName" runat="server" />
                                        </td>

                                        <td>

                                            <asp:TextBox ID="txtAge" runat="server" Columns="3" />
                                        </td>

                                        <td>

                                            <asp:DropDownList ID="dropActive" runat="server">

                                                <asp:ListItem Text="Yes" Value="True" />

                                                <asp:ListItem Text="No" Value="False" />

                                            </asp:DropDownList>
                                        </td>

                                        <td>

                                            <span onclick="return confirm('Are you sure to insert?')">

                                                <asp:LinkButton ID="lnkInser" runat="server" Text="Insert" CommandName="Insert" />
                                            </span>
                                        </td>
                                    </tr>
                                </InsertItemTemplate>

                            </asp:ListView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>


    </table>

</asp:Content>
