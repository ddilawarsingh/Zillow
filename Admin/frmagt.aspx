<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="frmagt.aspx.cs" Inherits="Admin_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container" style="left: 3px; top: 1px">
        <header class="section-header">
            <h3 class="auto-style1">Search Agents</h3>
        </header>

        <div class="row about-col">
            <div class="form-group">
                <table class="w-100">
                    <tr>
                        <td>Agent City</td>
                        <td>
                            <asp:DropDownList ID="DropDownCity" CssClass="form-control" runat="server" DataSourceID="ObjectDataSource1" DataTextField="ctynam" DataValueField="ctycod" AutoPostBack="True"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Agent Location</td>
                        <td>
                            <asp:DropDownList ID="DropDownLoc" CssClass="form-control" runat="server" DataSourceID="ObjectDataSource2" DataTextField="locnam" DataValueField="loccod"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="Button1" CssClass="btn btn-default submit" runat="server" Text="Search" OnClick="Button1_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:GridView ID="GridView1" AutoGenerateColumns="false" runat="server" DataKeyNames="agtcod,agtusrcod" OnRowDeleting="GridView1_RowDeleting" >
                                <Columns>
                                    <asp:TemplateField HeaderText="Search Results">
                                        <ItemTemplate>
                                            <table class="w-100">
                                                <tr>
                                                    <td rowspan="5">
                                                        <img src="../agtpics/<%#GetPath(Convert.ToInt32(Eval("agtcod")),Convert.ToString(Eval("agtpic"))) %>" style="border: 12px; height: 150px; width: 150px" />
                                                    </td>
                                                    <td>
                                                        <h3><%#Eval("agtnam") %></h3>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><%#Eval("nop")%> <b>Properties Posted Since <%#Eval("usrregdat") %></b></td>
                                                </tr>
                                                <tr>
                                                    <td><b>Services Offered:</b><%#Eval("agtser")%></td>
                                                </tr>
                                                <tr>
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
                                                        <asp:LinkButton ID="lk1" Text="Remove Agent" CommandName="delete" runat="server"></asp:LinkButton></td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Display_Rec" TypeName="nszillow.clscity"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="Display_Rec" TypeName="nszillow.clsloc">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownCity" Name="ctycod" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>

    </div>
</asp:Content>

