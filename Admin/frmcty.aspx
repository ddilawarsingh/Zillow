<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="frmcty.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <br />
    <br />
    <br />
    <div class="container" style="left: 3px; top: 1px">
        <header class="section-header">
            <h3 class="auto-style1">Cities</h3>
        </header>

        <div class="row about-col">
            <div  class="form-group">
                <br />
                <table class="w-100">
                    <tr>
                        <td style="height: 50px">Add Cities:</td>
                        <td style="height: 50px"><asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="height: 50px"></td>
                        <td style="height: 50px">
                            <asp:Button ID="Button1" CssClass="btn btn-default submit" runat="server" Text="Submit" OnClick="Button1_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:GridView ID="GridView1" runat="server" DataKeyNames="ctycod" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" Width="400px">
                                <Columns>
                                    <asp:BoundField DataField="ctynam" HeaderText="Name" SortExpression="ctynam" />
                                    <asp:CommandField ShowEditButton="true" ButtonType="Link" EditText="Edit" HeaderText="Edit" />
                                    <asp:CommandField ShowDeleteButton="true" ButtonType="Link" DeleteText="Delete" HeaderText="Delete" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                <br />

                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Display_Rec" TypeName="nszillow.clscity" DataObjectTypeName="nszillow.clscityprp" DeleteMethod="Delete_Rec" InsertMethod="Save_Rec" UpdateMethod="Update_Rec"></asp:ObjectDataSource>
            </div>

        </div>
    </div>
</asp:Content>

