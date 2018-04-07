<%@ Page Title="" Language="C#" MasterPageFile="~/Agent/MasterPage.master" AutoEventWireup="true" CodeFile="frmprp.aspx.cs" Inherits="Agent_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <br />
    <br />
    <br />
    <div class="container">
        <header class="section-header">
            <h3 class="auto-style1">Manage Profile</h3>
        </header>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="col-md-6 form-line">

            <ajaxToolkit:TabContainer ID="TabContainer1" runat="server">
                <ajaxToolkit:TabPanel ID="TabPanel1" HeaderText="Property Details" runat="server">
                    <ContentTemplate>
                        <div class="form-group">
                            <asp:RadioButtonList ID="radiobtnSls" runat="server" RepeatColumns="2">
                                <asp:ListItem Value="S">For Sale</asp:ListItem>
                                <asp:ListItem Value="R">For Rent</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <div class="form-group">
                            <label>Select Property</label>
                            <asp:DropDownList ID="drpprptyp" CssClass="form-control" runat="server" DataSourceID="ObjectDataSource1" DataTextField="prptypnam" DataValueField="prptycod"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>Property Title</label>
                            <asp:TextBox ID="txtboxtit" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Property Cost</label>
                            <asp:TextBox ID="txtboxprc" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Address</label>
                            <asp:TextBox ID="txtboxadd" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Co-ordinates:</label>
                            <asp:Label ID="lblcrd" runat="server" CssClass="col-form-label"></asp:Label>
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <asp:TextBox ID="txtboxdsc" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div>
                            <asp:Button ID="btnsubmit" CssClass="btn btn-default submit" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
                        </div>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>

                <ajaxToolkit:TabPanel ID="TabPanel2" HeaderText="Features" runat="server">
                    <ContentTemplate>
                        <div class="form-group">
                            <label>Select Features</label>
                            <asp:DropDownList ID="drpdwnlstfet" CssClass="form-control" runat="server" DataSourceID="ObjectDataSource2" DataTextField="fetdsc" DataValueField="fetcod"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <asp:TextBox ID="txtboxfetdsc" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div>
                            <asp:Button ID="btnsubmitfet" CssClass="form-control" runat="server" OnClick="btnsubmitfet_Click" Text="Submit" />
                        </div>
                        <div>
                            <asp:GridView ID="grdviewfet" runat="server">

                            </asp:GridView>
                        </div>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                
                <ajaxToolkit:TabPanel ID="TabPanel3" HeaderText="Pictures" runat="server">

                </ajaxToolkit:TabPanel>
            </ajaxToolkit:TabContainer>

            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Display_Rec" TypeName="nszillow.clsprpty"></asp:ObjectDataSource>
            <br />
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="Display_Rec" TypeName="nszillow.clsfet"></asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>