<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="frmagt.aspx.cs" Inherits="Admin_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container" style="padding-bottom: 150px">
        <header class="section-header">
            <h3 class="auto-style1">Search Agents</h3>
        </header>

        <div class="col-md-12">
            <div class="row">
                <div class="col-md-10 offset-2">
                    <div class="form-group" align="center">
                        <table class="col-md-12" align="center">
                            <colgroup>
                                <col style="width:20%" />
                                <col style="width:60%"/>
                                <col style="width:20%"/>
                            </colgroup>
                            <tr>
                                <td>
                                    <label><b>City</b></label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownCity" CssClass="form-control" runat="server" OnDataBound="DropDownCity_DataBound" DataSourceID="ObjectDataSource1" DataTextField="ctynam" DataValueField="ctycod" AutoPostBack="True">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" runat="server" Display="Dynamic" ControlToValidate="DropDownCity" ForeColor="Red" InitialValue="-1" ValidationGroup="checkSearch" ErrorMessage="Select City"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label><b>Location</b></label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownLoc" CssClass="form-control" runat="server" OnDataBound="DropDownLoc_DataBound" DataSourceID="ObjectDataSource2" DataTextField="locnam" DataValueField="loccod">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLoc" runat="server" Display="Dynamic" ControlToValidate="DropDownLoc" ForeColor="Red" ValidationGroup="checkSearch" InitialValue="-1" ErrorMessage="Location Required"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td align="center">
                                    <asp:Button ID="Button1" CssClass="btn btn-default submit" runat="server" ValidationGroup="checkSearch" Text="Search" OnClick="Button1_Click" />
                                </td>
                                <td></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8 offset-2" align="center">
                    <asp:GridView ID="GridView1" ShowHeaderWhenEmpty="true" BorderWidth="0" CssClass="col-md-12" AutoGenerateColumns="false" runat="server" DataKeyNames="agtcod,agtusrcod" OnRowDeleting="GridView1_RowDeleting">
                        <Columns>
                            <asp:TemplateField HeaderText="Search Results">
                                <ItemTemplate>
                                    <table class="col-md-12" align="center">
                                        <tr>
                                            <td rowspan="5">
                                                <img src="../agtpics/<%#GetPath(Convert.ToInt32(Eval("agtcod")),Convert.ToString(Eval("agtpic"))) %>" class="rounded-circle img-fluid" style="border: 12px; height: 150px; width: 150px" />
                                            </td>
                                            <td class="col-md-12" align="center">
                                                <table class="col-md-12 table-striped">
                                                    <tr>
                                                        <td>
                                                            <h3><%#Eval("agtnam") %></h3>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <%#Eval("nop")%> <b>Properties Posted Since <%#Eval("usrregdat") %></b>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Services Offered:</b><%#Eval("agtser")%>
                                                        </td>
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
                                                            <asp:LinkButton ID="lk1" Text="Remove Agent" CommandName="delete" OnClientClick="return deleteAgent()" runat="server"></asp:LinkButton>
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
                                No Record Found!!
                            </h3>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Display_Rec" TypeName="nszillow.clscity"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="Display_Rec" TypeName="nszillow.clsloc">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownCity" Name="ctycod" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    <script type="text/javascript">
        function deleteAgent()
        {
            if (confirm("Deleting this agent Will delete all properties,appointments,pictues etc associated with it! Are You Sure?")) {
                return true;
            }
           return false;
        }
    </script>
</asp:Content>

