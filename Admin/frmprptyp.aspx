<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="frmprptyp.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">

    <br />
    <br />
    <br />
    <div class="container" style="left: 3px; top: 1px">
        <header class="section-header">
            <h3 class="auto-style1">Property Type</h3>
        </header>

        <div  class="col-md-8 offset-2">
            <div class="form-group">
                <table class="w-100">
                    <tr>
                        <td style="height: 50px">Add Cities </td>
                        <td style="height: 50px">
                            <asp:Textbox CssClass="form-control"  id="TextBox1" runat="server"></asp:Textbox>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 50px"></td>
                        <td style="height: 50px">
                            <asp:Button CssClass="btn btn-default submit" id="Button1" runat="server" text="Submit" onclick="Button1_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:gridview id="GridView1" runat="server" autogeneratecolumns="False" datasourceid="ObjectDataSource1" datakeynames="prptycod" Width="800px">
                                <Columns>
                                    <asp:BoundField DataField="prptypnam" HeaderText="Property Name" SortExpression="prptypnam" />
                                    <asp:CommandField DeleteText="" HeaderText="EDIT" ShowEditButton="True" />
                                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                                </Columns>
                            </asp:gridview>
                        </td>
                    </tr>
                </table>
                <asp:objectdatasource id="ObjectDataSource1" runat="server" dataobjecttypename="nszillow.clsprptyprp" deletemethod="Delete_Rec" selectmethod="Display_Rec" typename="nszillow.clsprpty" updatemethod="Update_Rec"></asp:objectdatasource>
            </div>

        </div>
    </div>

</asp:Content>

