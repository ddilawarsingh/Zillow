<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmprpdet.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <div class="container">
        <header class="section-header">
            <h3 class="auto-style1">Property Details</h3>
        </header>
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-12">
                    <h3 align="center">Details</h3>
                    <asp:DataList ID="datalstprpdet" runat="server" OnEditCommand="datalstprpdet_EditCommand">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td rowspan="5" style="width:320px">
                                        <img src="prpfils/<%#GetPath(Convert.ToString(Eval("pic"))) %>"  class="img-fluid" style="border: 12px; height: 300px; width: 300px"  />
                                    </td>
                                    <td>
                                        <h3><%#Eval("prptit") %></h3>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Address: </b><%#Eval("prpadd") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Price: </b><%#Eval("prpprc") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p><%#Eval("prpdsc") %></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="lnkbtnaddtofav" runat="server" CommandName="edit" Text="Add To Favourites"></asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <h3 align="center">Property Features</h3>
                    <br />
                    <asp:GridView ID="grdviewfet" CssClass="col-md-12 table table-bordered" DataKeyNames="prpfetcod,fetcod" AutoGenerateColumns="false" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="Feature">
                                <ItemTemplate>
                                    <asp:Label ID="lblfet" Text='<%#Eval("fetdsc") %>' runat="server"> </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description" ItemStyle-Width="700px">
                                <ItemTemplate>
                                    <asp:Label ID="lblfetdsc" Text='<%#Eval("prpfetdsc") %>' runat="server"> </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <h3 align="center">Property Pictures</h3>
                    <asp:DataList ID="datalistpics" DataKeyField="prppiccod" OnItemDataBound="datalistpics_ItemDataBound" RepeatColumns="3" RepeatDirection="Horizontal" CssClass="col-md-12" runat="server">
                        <ItemTemplate>
                            <asp:Literal ID="literal1" runat="server"></asp:Literal>
                            <p><%#Eval("prppicdsc") %></p>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

