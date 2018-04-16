<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="frmreg.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <br />
    <br />
    <br />
    <div class="container" style="left: 3px; top: 1px">
        <header class="section-header">
            <h3 class="auto-style1">Agents</h3>
        </header>

        <div class="col-md-8 offset-2">
            <div class="form-group">
                <table class="w-100">
                    <tr>
                        <td style="width: 335px; height: 50px">Agent City</td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="ctynam" DataValueField="ctycod"></asp:DropDownList>

                        </td>
                    </tr>
                    <tr>
                        <td style="width: 335px; height: 50px">Location</td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server" DataSourceID="ObjectDataSource2" DataTextField="locnam" DataValueField="loccod"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td style="width: 335px; height: 50px">Name</td>
                        <td>
                            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 335px; height: 50px">Email</td>
                        <td>
                            <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="Button1" CssClass="btn btn-default submit" runat="server" Text="Submit" OnClick="Button1_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Display_Rec" TypeName="nszillow.clscity"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="Display_Rec" TypeName="nszillow.clsloc">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="ctycod" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>

        </div>
    </div>
</asp:Content>

