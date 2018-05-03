<%@ Page Title="" Language="C#" MasterPageFile="~/Agent/MasterPage.master" AutoEventWireup="true" CodeFile="frmprp.aspx.cs" Inherits="Agent_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <br />
    <br />
    <br />
    <div class="container">
        <header class="section-header">
            <h3 class="auto-style1">Properties</h3>
        </header>
        <div class="row">
            <div class="col-md-12">
                <asp:DataList ID="datalistprp" DataKeyField="prpcod" runat="server" RepeatColumns="2" OnItemCommand="datalistprp_ItemCommand" DataSourceID="ObjectDataSource1">
                    <ItemTemplate>
                        <table align="center">
                            <tr>
                                <td align="center">
                                    <img src="../prpfils/<%#GetPath(Convert.ToString(Eval("pic"))) %>" class="img-fluid" style="width:600px; height:300px"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table class="col-md-12 table-striped">
                                        <colgroup>
                                            <col style="width: 400px;height:400px" />
                                            <col style="width: 400px;height:400px" />
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
                                                <label><b>Property Type</b></label>
                                            </td>
                                            <td>
                                                <%#Eval("prptypnam") %>
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
                                                <label><b>Sale/Renting</b></label>
                                            </td>
                                            <td>
                                                <%#Eval("prpsalsts").ToString() == "S" ? "For Sale" : "For Renting"%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label><b>Status</b></label>
                                            </td>
                                            <td>
                                                <%#Eval("prpsts").ToString() == "A" ? "Available" : "Rented/Sold" %>
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
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="dispagtprp" TypeName="nszillow.clsprp">
            <SelectParameters>
                <asp:SessionParameter Name="agtcod" SessionField="cod" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>

