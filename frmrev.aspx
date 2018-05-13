<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmrev.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <header class="section-header">
            <h3 class="auto-style1">Write Review</h3>
        </header>
        <div class="row">
            <div class="col-md-8 offset-2">
                <div class="row form-group">
                    <div class="col-md-3">
                        <label>
                            <b>Review Title</b>
                        </label>
                    </div>
                    <div class="col-md-9">
                        <asp:TextBox ID="txtboxrevtit" CssClass="form-control" runat="server">

                        </asp:TextBox>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-3">
                        <label>
                            <b>Review Description</b>
                        </label>
                    </div>
                    <div class="col-md-9">
                        <asp:TextBox ID="txtboxrevdsc" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-3">
                        <label>
                            <b>Agent Rating</b>
                        </label>
                    </div>
                    <div class="col-9">
                        <ajaxToolkit:Rating ID="Rating1" runat="server"
                            CurrentRating="0"
                            MaxRating="5"
                            StarCssClass="ratingStar"
                            WaitingStarCssClass="savedRatingStar"
                            FilledStarCssClass="filledRatingStar"
                            EmptyStarCssClass="emptyRatingStar">
                        </ajaxToolkit:Rating>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-12" align="center">
                        <asp:Button ID="btnsubmit" CssClass="btn" OnClick="btnsubmit_Click" runat="server" Text="Submit"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

