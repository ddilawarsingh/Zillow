<%@ Page Title="" Language="C#" MasterPageFile="~/Agent/MasterPage.master" AutoEventWireup="true" CodeFile="frmrev.aspx.cs" Inherits="Agent_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <br />
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container" style="padding-bottom:100px">
        <header class="section-header">
            <h3 class="auto-style1">Reviews</h3>
        </header>
        <div class="row">
            <div class="col-md-12">
                <asp:DataList ID="datalstrev" CssClass="col-md-12" runat="server">
                    <ItemTemplate>
                        <table class="table-striped col-md-8 offset-2" border="1">
                            <colgroup>
                                <col style="width: 30%" />
                                <col style="width: 70%" />
                            </colgroup>
                            <tr>
                                <td>
                                    <label><b>By</b> </label>
                                </td>
                                <td>
                                    <%#Eval("usreml")%> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label><b>For Property</b> </label>
                                </td>
                                <td>
                                    <%#Eval("prptit")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label><b>Rating</b></label>
                                </td>
                                <td>
                                    <ajaxToolkit:Rating ID="Rating1" runat="server"
                                        CurrentRating='<%#Eval("agtrevscr")%>'
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
                                    <label><b>Title</b></label>
                                </td>
                                <td>
                                    <b><%#Eval("agtrevtit") %></b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label><b>Description</b></label>
                                </td>
                                <td>
                                    <p>
                                        <%#Eval("agtrevdsc") %>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label><b>Review Date</b></label>
                                </td>
                                <td>
                                    <%#Eval("agtrevdat","{0: dd/MM/yyyy }") %>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </ItemTemplate>
                    <FooterTemplate>
                        <h3 align="center">
                            <asp:Label Visible='<%#bool.Parse((datalstrev.Items.Count==0).ToString())%>'
                            runat="server" ID="lblNoRecord" Text="No Record Found!"></asp:Label>
                        </h3>
                    </FooterTemplate>
                </asp:DataList>
            </div>
        </div>
    </div>
</asp:Content>

