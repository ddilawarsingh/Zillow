<%@ Page Title="" Language="C#" MasterPageFile="~/Agent/MasterPage.master" AutoEventWireup="true" CodeFile="frmapp.aspx.cs" Inherits="Agent_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <br />
    <br />
    <br />
    <div class="container" style="padding-bottom:100px">
        <header class="section-header">
            <h3 class="auto-style1">Appointments</h3>
        </header>
        <div class="row">
            <div class="col-md-10 offset-1">
                <asp:GridView ID="grdview" ShowHeaderWhenEmpty="true" BorderWidth="0" ShowHeader="false" CssClass="col-md-12" DataKeyNames="appcod" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <table class="col-md-12" align="center">
                                    <tr>
                                        <td>
                                            <img src="../prpfils/<%#GetPath(Convert.ToString(Eval("pic"))) %>" class="img" style="height:300px;width:300px" />
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
                                                        <label><b>Customer's Email</b></label>
                                                    </td>
                                                    <td>
                                                        <%#Eval("usreml")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label><b>Customer's Contact Number</b></label>
                                                    </td>
                                                    <td>
                                                        <%#Eval("appphn")%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <h3 align="center">
                            No Record Found!
                        </h3>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

