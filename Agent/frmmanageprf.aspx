<%@ Page Title="" Language="C#" MasterPageFile="~/Agent/MasterPage.master" AutoEventWireup="true" CodeFile="frmmanageprf.aspx.cs" Inherits="Agent_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <br />
    <br />
    <br />
    <div class="container" style="padding-bottom:50px">
        <header class="section-header">
            <h3 class="auto-style1">Manage Profile</h3>
        </header>

        <div class="col-md-12">
            <div class="row">
                <div class="col-md-8 offset-2">
                    <table class="col-md-12 table" align="center">
                        <tr>
                            <td>
                                <label><b>Services Offered</b></label> 
                            </td>
                            <td>
                                <asp:CheckBoxList ID="chkboxlist1" runat="server" RepeatColumns="3">
                                    <asp:ListItem Value="Buying">Buying</asp:ListItem>
                                    <asp:ListItem Value="Selling">Selling</asp:ListItem>
                                    <asp:ListItem Value="Retail">Retail</asp:ListItem>
                                    <asp:ListItem Value="Furnishing">Furnishing</asp:ListItem>
                                    <asp:ListItem Value="Mortgaging">Mortgaging</asp:ListItem>
                                    <asp:ListItem Value="Estimation">Estimation</asp:ListItem>
                                </asp:CheckBoxList>
                                <asp:CustomValidator ID="CustomValidatorchk" runat="server" ForeColor="Red" ClientValidationFunction="ValidateServiceList" ErrorMessage="Please Select Atleas One Service"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label><b>Profile</b></label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtbox1" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorprf" runat="server" ControlToValidate="txtbox1" ForeColor="Red" ErrorMessage="Profile Required"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label><b>Browse Picture</b></label> 
                            </td>
                            <td>
                                <asp:FileUpload ID="fileupload1" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <br />
                                <asp:Button ID="btn1" CssClass="btn-primary" runat="server" Text="Update Profile" OnClick="btn1_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8 offset-2">
                    <div id="divSuc" runat="server" visible="false" class="alert alert-success">
                        <strong>Success!</strong> Profile Updated.
                    </div>
                    <div id="divFail" runat="server" visible="false" class="alert alert-danger">
                        <strong>Error!</strong> Profile Updation Failed.
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="hidden" runat="server" />
    <script type="text/javascript">
        function ValidateServiceList(source, args) {
            var chkListServices = document.getElementById('<%= chkboxlist1.ClientID %>');
            var chkListinputs = chkListServices.getElementsByTagName("input");
            for (var i = 0; i < chkListinputs.length; i++) {
                if (chkListinputs[i].checked) {
                    args.IsValid = true;
                    return;
                }
            }
            args.IsValid = false;
        }
    </script>
</asp:Content>
