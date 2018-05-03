<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmapp.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <header class="section-header">
            <h3 class="auto-style1">Book Appointment</h3>
        </header>
        <div class="row">
            <div class="col-md-8 offset-2">
                <div class="form-group">
                    <label class="col-form-label">Select Appointment Date</label>
                    <asp:TextBox ID="txtboxdate" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="calext" Format="MM'/'dd'/'yyyy" runat="server" TargetControlID="txtboxdate" />
                </div>
                <div class="form-group">
                    <label>Enter Phone Number</label>
                    <asp:TextBox ID="txtboxphn" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Appointment Description</label>
                    <asp:TextBox ID="txtboxdsc" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div align="center" class="form-group">
                    <asp:Button ID="btnsubmit" OnClick="btnsubmit_Click" CssClass="btn" runat="server" Text="Book Appointment" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

