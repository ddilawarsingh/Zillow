<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmbookedapp.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <header class="section-header">
            <h3 class="auto-style1">Appointments</h3>
        </header>
        <div class="row">
            <div class="col-md-10 offset-1">
                <asp:GridView ID="grdview" BorderWidth="0" ShowHeader="false" CssClass="col-md-12" DataKeyNames="appcod" runat="server" AutoGenerateColumns="False" OnRowEditing="grdview_RowEditing" OnRowCancelingEdit="grdview_RowCancelingEdit" OnRowUpdating="grdview_RowUpdating" OnRowCommand="grdview_RowCommand" OnRowDeleting="grdview_RowDeleting">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <table class="col-md-12" align="center">
                                    <tr>
                                        <td>
                                            <img src="prpfils/<%#GetPath(Convert.ToString(Eval("pic"))) %>" class="img-fluid" style="border: 12px; height: 300px; width: 300px" />
                                        </td>
                                        <td class="col-md-12" align="center">
                                            <table class="col-md-12 table-striped">
                                                <tr>
                                                    <td colspan="2" align="center">
                                                        <h3><a href="frmprpdet.aspx?pcod=<%#Eval("prpcod") %>"><%#Eval("prptit") %></a></h3>
                                                    </td> 
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label><b>Address</b></label>
                                                    </td>
                                                    <td>
                                                        <%#Eval("prpadd")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label><b>Property Agent</b></label>
                                                    </td>
                                                    <td>
                                                        <a href="frmagtprf.aspx?agtcod=<%#Eval("agtcod") %>"><%#Eval("agtnam")%></a> | <a href="frmrev.aspx?agtcod=<%#Eval("agtcod")%>&prpcod=<%#Eval("prpcod")%>">Write Agent Review</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label><b>Appointment Date</b> </label>
                                                    </td>
                                                    <td>
                                                        <%#Eval("appdat","{0:dd/MM/yyyy}")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label><b>Appointment Description</b></label>
                                                    </td>
                                                    <td>
                                                        <p><%#Eval("appdsc") %></p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label><b>Your Contact Number</b></label>
                                                    </td>
                                                    <td>
                                                        <%#Eval("appphn")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        <asp:LinkButton ID="lnkbtnedit" runat="server" Text="Edit Appointment" CommandName="edit"></asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="lnkbtndelete" runat="server" Text="Cancel Appointment" CommandName="delete"></asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <img src="prpfils/<%#GetPath(Convert.ToString(Eval("pic"))) %>" class="img-fluid" style="border: 12px; height: 300px; width: 300px" />
                                        </td>
                                        <td class="col-md-12">
                                            <table class="col-md-12 table">
                                                <tr>
                                                    <td colspan="2">
                                                        <h3><%#Eval("prptit") %></h3>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label><b>Address</b></label>
                                                    </td>
                                                    <td>
                                                        <%#Eval("prpadd")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label><b>Property Agent</b></label> 
                                                    </td>
                                                    <td>
                                                        <%#Eval("agtnam")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label><b>Appointment Date</b></label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtboxappdat" CssClass="form-control" runat="server" Text='<%#Eval("appdat","{0:dd/MM/yyyy}")%>'></asp:TextBox>
                                                        <ajaxToolkit:CalendarExtender ID="calext" runat="server" Format="MM'/'dd'/'yyyy" TargetControlID="txtboxappdat" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label><b>Appointment Description</b></label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtboxdsc" CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%#Eval("appdsc") %>'></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label><b>Your Contact Number</b></label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtboxphn" CssClass="form-control" runat="server" Text='<%#Eval("appphn")%> '></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        <asp:LinkButton ID="lnkbtnupd" runat="server" Text="Update" CommandName="update"></asp:LinkButton>
                                                    </td>
                                                    <td align="center">
                                                        <asp:LinkButton ID="lnkbtncancel" runat="server" Text="Cancel" CommandName="cancel"></asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
      <%--                              <tr>
                                        <td>
                                            <label><b>Address</b></label><%#Eval("prpadd")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label><b>Property Agent</b></label> <%#Eval("agtnam")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label><b>Appointment Date</b></label> <asp:TextBox ID="txtboxappdat" CssClass="form-control" runat="server" Text='<%#Eval("appdat","{0:dd/MM/yyyy}")%>'></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="calext" runat="server" Format="MM'/'dd'/'yyyy" TargetControlID="txtboxappdat" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label><b>Appointment Description</b></label> <asp:TextBox ID="txtboxdsc" CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%#Eval("appdsc") %>'></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label><b>Your Contact Number</b></label> <asp:TextBox ID="txtboxphn" CssClass="form-control" runat="server" Text='<%#Eval("appphn")%> '></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="lnkbtnupd" runat="server" Text="Update" CommandName="update"></asp:LinkButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="lnkbtncancel" runat="server" Text="Cancel" CommandName="cancel"></asp:LinkButton>
                                        </td>
                                    </tr>--%>
                                </table>
                            </EditItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

