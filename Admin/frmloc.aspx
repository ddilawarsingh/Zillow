<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="frmloc.aspx.cs" Inherits="Admin_Default" %>

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
    <div class="container" style="left: 3px; top: 1px">
        <header class="section-header">
            <h3 class="auto-style1">Location</h3>
        </header>

        <div id="map">
        </div>
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

                google.maps.event.addListener(map, 'click', function (event) {
                    marker.setMap(null);
                    placeMarker(event.latLng);
                    document.getElementById('<%=Label1.ClientID %>').innerText = event.latLng;
                    document.getElementById('<%=hidden.ClientID %>').value = event.latLng;

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
        <br />
        <br />
        <div class="form-group">
            <table class="w-100">
                <tr>
                    <td style="width: 335px; height: 50px">Select City </td>
                    <td>
                        <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource1" DataTextField="ctynam" DataValueField="ctycod" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 335px; height: 50px">Location</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 335px; height: 50px">Co-Ordinates </td>
                    <td>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 335px; height: 50px"></td>
                    <td>
                        <asp:Button CssClass="btn btn-default submit" ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="GridView1" DataKeyNames="loccod" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2" OnRowEditing="GridView1_RowEditing" Width="1000px">
                            <Columns>
                                <asp:TemplateField HeaderText="Location Name">
                                    <ItemTemplate>
                                        <asp:Label ID="Labellocname" Text='<%#Eval("locnam")%>' runat="server"></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Coordinates">
                                    <ItemTemplate>
                                        <asp:Label ID="Labelloccrd" Text='<%#Eval("loccrd") %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EDIT">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="EditButton" CommandName="edit" runat="server" Text="Edit"></asp:LinkButton>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="CancelButton" CommandName="cancel" runat="server" Text="Cancel"></asp:LinkButton>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowDeleteButton="True" HeaderText="DELETE" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="hidden" runat="server" />
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Display_Rec" TypeName="nszillow.clscity"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="Display_Rec" DeleteMethod="Delete_Rec" TypeName="nszillow.clsloc" DataObjectTypeName="nszillow.clslocprp" UpdateMethod="Update_Rec">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="ctycod" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>

        </div>
</asp:Content>
