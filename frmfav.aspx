<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmfav.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <header class="section-header">
            <h3 class="auto-style1">Favourite Properties</h3>
        </header>
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-12">
                    <asp:DataList ID="datalistfav" DataKeyField="prpcod" runat="server" RepeatColumns="2" OnItemCommand="datalistsrcresult_ItemCommand" DataSourceID="ObjectDataSource1">
                        <ItemTemplate>
                            <table align="center">
                                <tr>
                                    <td>
                                        <img src="prpfils/<%#GetPath(Convert.ToString(Eval("pic"))) %>" class="img" style="border: 12px; height: 300px; width: 300px" />
                                    </td>
                                    <td align="center">
                                        <table class="col-md-12 table-striped">
                                            <colgroup>
                                                <col style="width: 800px" />
                                                <col style="width: 800px" />
                                            </colgroup>
                                            <tr>
                                                <td align="center" colspan="2">
                                                    <h3><a href="frmprpdet.aspx?pcod=<%#Eval("prpcod")%>"><%#Eval("prptit") %></a></h3>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label><b>Listed On</b></label>
                                                </td>
                                                <td>
                                                    <%#Eval("prplstdat","{0:dd/M/yyyy}") %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label><b>Description</b></label>
                                                </td>
                                                <td>
                                                    <p><%#Eval("prpdsc") %></p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label><b>Price</b></label>
                                                </td>
                                                <td>₹ <%#Eval("prpprc") %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label><b>Agent Name</b></label>
                                                </td>
                                                <td>
                                                    <a href="frmagtprf.aspx?agtcod=<%#Eval("agtcod")%>"><%#Eval("agtnam")%></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label><b>Agent Rating</b></label>
                                                </td>
                                                <td>
                                                    <ajaxToolkit:Rating ID="Rating1" runat="server"
                                                        CurrentRating='<%#Convert.ToInt32(Eval("rev"))%>'
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
                                                <td align="center" colspan="2">
                                                    <asp:Button ID="btnviewdetails" CssClass=" btn-secondary" CommandName="viewdetails" CommandArgument='<%#Eval("prpcod") %>' runat="server" Text="View Details" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
        </div>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="findfavbyusr" TypeName="nszillow.clsfav">
            <SelectParameters>
                <asp:SessionParameter Name="usrcod" SessionField="cod" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>

