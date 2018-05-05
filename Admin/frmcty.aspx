<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="frmcty.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <br />
    <br />
    <br />
    <div class="container" style="left: 3px; top: 1px">
        <header class="section-header">
            <h3 class="auto-style1">Cities</h3>
        </header>

        <div class="row">
            <div class="col-md-8 offset-2">
                <div class="col-md-12">
                    <br />
                    <table class="table-responsive">
                        <colgroup>
                            <col style="width:300px" />
                            <col style="width:700px" />
                            <col style="width:100px" />
                        </colgroup>
                        <tr>
                            <td>Add Cities:</td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorcty" ValidationGroup="ctynam" runat="server" ControlToValidate="TextBox1" ErrorMessage="City Required"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:Button ID="Button1" CssClass="btn-primary" runat="server" Text="Submit" ValidationGroup="ctynam" OnClick="Button1_Click" />
                            </td>
                        </tr>
                        <%--<tr>
                            <td></td>
                            <td>
                                <asp:ValidationSummary ID="ValidationSummary1" DisplayMode="BulletList" runat="server" />
                            </td>
                            <td></td>
                            <td></td>
                        </tr>--%>
                        <tr>
                            <td align="center" colspan="4">
                                <br />
                                <asp:GridView ID="GridView1" runat="server" CssClass="table-striped" DataKeyNames="ctycod" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" DataSourceID="ObjectDataSource1" Width="400px">
                                    <Columns>
                                        <asp:BoundField DataField="ctynam" HeaderText="Name" SortExpression="ctynam" />
                                        <asp:CommandField ShowEditButton="true" ButtonType="Link" EditText="Edit" HeaderText="Edit" />
                                        <asp:TemplateField HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkbtnDelete" CommandName="deleteRow" CommandArgument='<%#Eval("ctycod") %>' Text="Delete" runat="server"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                    <br />

                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Display_Rec" TypeName="nszillow.clscity" DataObjectTypeName="nszillow.clscityprp" InsertMethod="Save_Rec" UpdateMethod="Update_Rec"></asp:ObjectDataSource>
                </div>

            </div>
        </div>

    </div>
</asp:Content>

