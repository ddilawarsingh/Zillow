<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="frmreg.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <br />
    <br />
    <br />
    <div class="container" style="padding-bottom:150px">
        <header class="section-header">
            <h3 class="auto-style1">Register Agents</h3>
        </header>

        <div class="col-md-8 offset-2">
            <div class="col-md-12">
                <table>
                    <colgroup>
                        <col style="width:20%" />
                        <col style="width:60%" />
                        <col style="width:20%" />
                    </colgroup>
                    <tr>
                        <td><label><b>Agent City</b></label></td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" AutoPostBack="True" OnDataBound="DropDownList1_DataBound" DataSourceID="ObjectDataSource1" DataTextField="ctynam" DataValueField="ctycod"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" runat="server" InitialValue="-1" ControlToValidate="DropDownList1" ForeColor="Red" ErrorMessage="Select City"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td><label><b>Location</b></label></td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server" OnDataBound="DropDownList2_DataBound" DataSourceID="ObjectDataSource2" DataTextField="locnam" DataValueField="loccod"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLocation" runat="server" InitialValue="-1" ControlToValidate="DropDownList2" ForeColor="Red" ErrorMessage="Location Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td><label><b>Agent Name</b></label></td>
                        <td>
                            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="TextBox1" ForeColor="Red" ErrorMessage="Agent Name Required">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td><label><b>Agent Email</b></label></td>
                        <td>
                            <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" Display="Dynamic" ControlToValidate="TextBox2" ForeColor="Red" ErrorMessage="Email Required"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="TextBox2" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" ErrorMessage="Enter Valid Email"></asp:RegularExpressionValidator>
                        </td>
                    </tr>

                    <tr>
                        <td></td>
                        <td align="center">
                            <br />
                            <asp:Button ID="Button1" CssClass="btn-primary" runat="server" Text="Submit" OnClick="Button1_Click" />
                        </td>
                        <td>

                        </td>
                    </tr>
                </table>
                <br />
                <div id="divSuc" runat="server" visible="false" class="alert alert-success col-md-8 offset-2 ">
                    <strong>Success</strong> Agent Registered Successfully! Password will be sent to the entered email.
                </div>
                <div id="divFail" runat="server" visible="false" class="alert alert-danger col-md-8 offset-2">
                    <strong>ERROR!</strong> Agent Registration Failed!
                </div>
                <div id="divEmailExists" runat="server" visible="false" class="alert alert-danger col-md-8 offset-2">
                    <strong>ERROR!</strong> Registration failed as entered e-mail already exists
                </div>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Display_Rec" TypeName="nszillow.clscity"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="Display_Rec" TypeName="nszillow.clsloc">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="ctycod" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>

        </div>
    </div>
</asp:Content>

