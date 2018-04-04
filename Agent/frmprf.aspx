<%@ Page Title="" Language="C#" MasterPageFile="~/Agent/MasterPage.master" AutoEventWireup="true" CodeFile="frmprf.aspx.cs" Inherits="Agent_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <br />
    <br />
    <br />
    <div class="container" style="left: 3px; top: 1px">
        <header class="section-header">
            <h3 class="auto-style1">Manage Profile</h3>
        </header>

        <div class="row about-col">
            <div class="form-group">
                <table class="w-100">
                    <tr>
                        <td style="height:50px;width:335px">Services Offered</td>
                        <td style="height:50px">
                            <asp:CheckBoxList ID="chkboxlist1" runat="server" RepeatColumns="3">
                                <asp:ListItem>
                                    Buying
                                </asp:ListItem>
                                <asp:ListItem>
                                    Selling
                                </asp:ListItem>
                                <asp:ListItem>
                                    Retail
                                </asp:ListItem>
                                <asp:ListItem>
                                    Furnishing
                                </asp:ListItem>
                                <asp:ListItem>
                                    Mortgaging
                                </asp:ListItem>
                                <asp:ListItem>
                                    Estimation
                                </asp:ListItem>
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                    <tr>
                        <td style="height:50px">Profile</td>
                        <td style="height:50px"><asp:TextBox ID="txtbox1" runat="server" CssClass="form-control"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="height:50px">Browse Picture</td>
                        <td style="height:50px"><asp:FileUpload ID="fileupload1" runat="server" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td style="height:50px"><asp:Button ID="btn1" CssClass="btn btn-default" runat="server" Text="Update Profile" OnClick="btn1_Click"/></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

