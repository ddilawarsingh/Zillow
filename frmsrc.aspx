<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmsrc.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <style>
        #map {
            width: 100%;
            height: 400px;
            background-color: grey;
        }
    </style>
    <div class="container" style="left: 3px; top: 1px">
        <header class="section-header">
            <h3 class="auto-style1">Search Property</h3>
        </header>
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-6 offset-3">
                    <table class="col-md-12">
                        <tr>
                            <td>
                                <label>Property For</label>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="r1" CssClass="btn-group btn-group-toggle" runat="server" RepeatDirection="Horizontal" AutoPostBack="True">
                                    <asp:ListItem Selected="True" Value="S">Purchase</asp:ListItem>
                                    <asp:ListItem Value="R">Rent</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>City</label>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpdwnlstcty" CssClass="form-control" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="ctynam" DataValueField="ctycod"></asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Location</label>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpdwnlstloc" CssClass="form-control" runat="server" DataSourceID="ObjectDataSource2" DataTextField="locnam" DataValueField="loccod" AutoPostBack="True"></asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Property Type</label>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpdwnlstprpty" CssClass="form-control" runat="server" DataSourceID="ObjectDataSource3" DataTextField="prptypnam" DataValueField="prptycod" AutoPostBack="True"></asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <br />
            <div class="row">
                <%--   <div class="col-md-6">
                    <asp:GridView ShowHeader="false" CssClass="col-md-12" ID="grdview1" AutoGenerateColumns="false" runat="server" DataSourceID="ObjectDataSource4" DataKeyNames="prpcod,agtcod" OnRowEditing="grdview1_RowEditing">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td rowspan="7">
                                                <img src="prpfils/<%#GetPath(Convert.ToString(Eval("pic"))) %>" class="rounded-circle img-fluid" style="border: 12px; height: 150px; width: 150px" />
                                            </td>
                                            <td>
                                                <h3>
                                                    <a href="frmprpdet.aspx?pcod=<%#Eval("prpcod")%>"><%#Eval("prptit") %></a>
                                                </h3>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Listed On: <%#Eval("prplstdat","{0:dd/M/yyyy}") %></b></td>
                                        </tr>
                                        <tr>
                                            <td><%#Eval("prpdsc") %></td>
                                        </tr>
                                        <tr>
                                            <td><b><%#Eval("prpprc") %></b></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="frmprf.aspx?acod=<%#Eval("agtcod")%>"><%#Eval("agtnam")%></a>
                                            </td>
                                        </tr>
                                        <tr>
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
                                            <td>
                                                <asp:Button ID="btnviewdetails" CssClass="btn" CommandName="edit" runat="server" Text="View Details" />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>--%>
                <div class="col-md-12">
                    <asp:DataList ID="datalistsrcresult" DataKeyField="prpcod" runat="server" RepeatColumns="2" DataSourceID="ObjectDataSource4" OnItemCommand="datalistsrcresult_ItemCommand">
                        <ItemTemplate>
                            <table align="center">
                                <tr>
                                    <td>
                                        <img src="prpfils/<%#GetPath(Convert.ToString(Eval("pic"))) %>" class="img" style="border: 12px; height: 300px; width: 300px" />
                                    </td>
                                    <td align="center">
                                        <table class="col-md-12 table-striped">
                                            <colgroup>
                                                <col style="width:800px" />
                                                <col style="width:800px"/>
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
                                                <td>
                                                    ₹ <%#Eval("prpprc") %>
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
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Display_Rec" TypeName="nszillow.clscity"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="Display_Rec" TypeName="nszillow.clsloc">
        <SelectParameters>
            <asp:ControlParameter ControlID="drpdwnlstcty" Name="ctycod" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="Display_Rec" TypeName="nszillow.clsprpty"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SelectMethod="srcprp" TypeName="nszillow.clsprp">
        <SelectParameters>
            <asp:ControlParameter ControlID="drpdwnlstloc" Name="loccod" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="drpdwnlstprpty" Name="prptycod" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="r1" Name="sts" PropertyName="SelectedValue" Type="Char" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

