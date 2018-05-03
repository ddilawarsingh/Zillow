<%@ Page Title="" Language="C#" MasterPageFile="~/Agent/MasterPage.master" AutoEventWireup="true" CodeFile="frmprpdet.aspx.cs" Inherits="Agent_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <br />
    <br />
    <br />
    <style>
        #map {
            width: 100%;
            height: 400px;
            background-color: grey;
        }
    </style>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <header class="section-header">
            <h3 class="auto-style1">Property Details</h3>
        </header>
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-10 offset-1">
                    <br />
                    <ajaxToolkit:TabContainer CssClass="col-md-12" ID="tabcontprpdet" runat="server">
                        <ajaxToolkit:TabPanel ID="tabpan1" HeaderText="Property Details" runat="server">
                            <ContentTemplate>
                                <div class="form-group">
                                    <asp:DataList ID="datalstprpdet" runat="server">
                                        <ItemTemplate>
                                            <table>
                                                <tr>
                                                    <td rowspan="6" style="width: 320px">
                                                        <img src="../prpfils/<%#GetPath(Convert.ToString(Eval("pic"))) %>" class="img-fluid" style="border: 12px; height: 300px; width: 300px" />
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
                                                        <b>Description:</b><p><%#Eval("prpdsc") %></p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton ID="lnkbtnedit" runat="server" CommandName="edit" Text="Edit Details"></asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </ContentTemplate>
                        </ajaxToolkit:TabPanel>

                        <ajaxToolkit:TabPanel ID="tabpan2" HeaderText="Property Features" runat="server">
                            <ContentTemplate>
                                <div class="form-group">
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
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtboxeditfetdsc" Text='<%#Eval("prpfetdsc") %>' runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </ContentTemplate>
                        </ajaxToolkit:TabPanel>

                        <ajaxToolkit:TabPanel ID="tabpan3" runat="server" HeaderText="Property Pictures">
                            <ContentTemplate>
                                <div class="form-group">
                                    <asp:DataList ID="datalistpics" DataKeyField="prppiccod" OnItemDataBound="datalistpics_ItemDataBound" RepeatColumns="3" RepeatDirection="Horizontal" CssClass="col-md-12" runat="server">
                                        <ItemTemplate>
                                            <asp:Literal ID="literal1" runat="server"></asp:Literal>
                                            <p><%#Eval("prppicdsc") %></p>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                        </EditItemTemplate>
                                    </asp:DataList>
                                </div>
                            </ContentTemplate>
                        </ajaxToolkit:TabPanel>
                        <ajaxToolkit:TabPanel ID="tabpan4" runat="server" HeaderText="Property Location">
                            <ContentTemplate>
                                <div id="map">
                                </div>
                            </ContentTemplate>
                        </ajaxToolkit:TabPanel>
                    </ajaxToolkit:TabContainer>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="Lat" runat="server" />
    <asp:HiddenField ID="Lon" runat="server" />
    <script>
        function initMap() {

            var currentLat = document.getElementById('<%=Lat.ClientID%>').value;
            var currentLng = document.getElementById('<%=Lon.ClientID%>').value;

                var currentPostion = new google.maps.LatLng(currentLat, currentLng);

                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 10,
                    center: currentPostion
                });
                var marker = new google.maps.Marker({
                    position: currentPostion,
                    map: map
                });
        }

    </script>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCME44ZxJQ_0RgkuATkESUp1yz2Y7XGGFY&callback=initMap">
    </script>
</asp:Content>

