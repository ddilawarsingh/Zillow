<%@ Page Title="" Language="C#" MasterPageFile="~/Agent/MasterPage.master" AutoEventWireup="true" CodeFile="frmprf.aspx.cs" Inherits="Agent_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container" style="padding-bottom:100px">
        <header class="section-header">
            <h3 class="auto-style1">Profile</h3>
        </header>
        <div class="row">
            <div class="col-md-10 offset-1">
                <asp:DataList CssClass="col-md-12" ID="datalistagt" runat="server">
                    <ItemTemplate>
                        <table class="col-md-12" align="center">
                            <tr>
                                <td>
                                    <img src="../agtpics/<%#GetPath(Convert.ToString(Eval("pic")))%> " class="img" style="height: 300px; width: 300px" />
                                </td>
                                <td>
                                    <table class="col-md-12 table-striped">
                                        <colgroup>
                                            <col style="width:40%" />
                                            <col style="width:60%" />
                                        </colgroup>
                                        <tr>
                                            <td colspan="2" align="center">
                                                <h3><%#Eval("agtnam") %></h3>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label><b>Email</b></label>
                                            </td>
                                            <td>
                                                <%#Eval("email") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label><b>Address</b></label>
                                            </td>
                                            <td>
                                                <%#Eval("locnam")%>, <%#Eval("ctynam")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label><b>Services</b></label>
                                            </td>
                                            <td>
                                                <%#Eval("agtser") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label><b>Profile</b></label>
                                            </td>
                                            <td>
                                                <%#Eval("agtprf") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label><b>Rating</b></label>
                                            </td>
                                            <td>
                                                <ajaxToolkit:Rating ID="Rating1" runat="server"
                                                    CurrentRating='<%#Eval("revscr")%>'
                                                    MaxRating="5"
                                                    StarCssClass="ratingStar"
                                                    WaitingStarCssClass="savedRatingStar"
                                                    FilledStarCssClass="filledRatingStar"
                                                    EmptyStarCssClass="emptyRatingStar"
                                                    ReadOnly="true">
                                                </ajaxToolkit:Rating>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label><b>Properties Posted Since<br />
                                                    <%#Eval("usrregdat","{0:dd/MM/yyyy}") %></b></label>
                                            </td>
                                            <td>
                                                <%#Eval("nop") %>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td align="center">
                                    <a href="frmmanageprf.aspx">Manage Profile</a>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </div>
</asp:Content>

