<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="frmprptyp.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">

    <br />
    <br />
    <br />
    <div class="container" style="height:auto">
        <header class="section-header">
            <h3 class="auto-style1">Property Type</h3>
        </header>

        <div  class="col-md-8 offset-2">
            <div class="form-group">
                <table>
                    <colgroup>
                        <col style="width:20%" />
                        <col style="width:60%" />
                        <col style="width:20%" />
                    </colgroup>
                    <tr>
                        <td><label><b>Add Property Type</b></label> </td>
                        <td>
                            <asp:Textbox CssClass="form-control" ValidationGroup="checkPrp" id="TextBox1" runat="server"></asp:Textbox>
                        </td>
                        <td align="center">
                            <asp:Button CssClass="btn-primary" id="Button1" runat="server" ValidationGroup="checkPrp" text="Submit" onclick="Button1_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>

                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorprpty" ControlToValidate="TextBox1" runat="server" ForeColor="Red" ValidationGroup="checkPrp" ErrorMessage="* Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>

                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <br />
                            <asp:gridview id="GridView1" runat="server" CssClass="table-striped col-md-10 offset-1" autogeneratecolumns="False" datasourceid="ObjectDataSource1" OnRowCommand="GridView1_RowCommand" datakeynames="prptycod">
                                <Columns>
                                    <asp:BoundField DataField="prptypnam" HeaderText="Property Name" SortExpression="prptypnam" />
                                    <asp:CommandField DeleteText="" HeaderText="EDIT" ShowEditButton="True" />
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkbtndelete" runat="server" CommandName="deleteRow" CommandArgument='<%#Eval("prptycod") %>' Text="Delete"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:gridview>
                        </td>
                    </tr>
                </table>
                <asp:objectdatasource id="ObjectDataSource1" runat="server" dataobjecttypename="nszillow.clsprptyprp" selectmethod="Display_Rec" typename="nszillow.clsprpty" updatemethod="Update_Rec"></asp:objectdatasource>
            </div>

        </div>
    </div>

</asp:Content>

