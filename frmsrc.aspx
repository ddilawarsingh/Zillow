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
                                    <asp:ListItem Selected="True" Value="P">Purchase</asp:ListItem>
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
                <div class="col-md-6">
                    <asp:GridView CssClass="col-md-12" ID="grdview1" AutoGenerateColumns="false" runat="server" DataSourceID="ObjectDataSource4" DataKeyNames="prpcod,agtcod" OnRowEditing="grdview1_RowEditing">
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
                </div>
                <div id="map" class="col-md-6">
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
    <script>
        function initMap() {

            var uluru = { lat: 30.728378724513383, lng: 76.77091062068939 };

            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 10,
                center: uluru
            });
            var marker = new google.maps.Marker({
                position: uluru,
                map: map
            });

            function placeMarker(location) {
                marker = new google.maps.Marker({
                    position: location,
                    map: map
                });
            }
        }
    </script>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCME44ZxJQ_0RgkuATkESUp1yz2Y7XGGFY&callback=initMap">
    </script>

</asp:Content>

