<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="frmloc.aspx.cs" Inherits="Admin_Default" %>

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
    <div class="container">
        <header class="section-header">
            <h3 class="auto-style1">Location</h3>
        </header>

        <div id="map" class="col-md-10 offset-1">
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
                    document.getElementById('<%=txtboxcrd.ClientID %>').value = event.latLng;
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
        <div class="col-md-10 offset-1" align="center">
            <div class="col-md-12" align="center">
                <table class="table-responsive" align="center">
                    <colgroup>
                        <col style="width:30% "/>
                        <col style="width:50% "/>
                        <col style="width:20% "/>
                    </colgroup>
                    <tr>
                        <td><label><b>Select City</b></label></td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource1" OnDataBound="DropDownList1_DataBound" DataTextField="ctynam" DataValueField="ctycod" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" runat="server" ValidationGroup="insertLoc" InitialValue="-1" ControlToValidate="DropDownList1" ForeColor="Red" ErrorMessage="Select City">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td><label><b>Enter Location</b></label></td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>   
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLocation" runat="server" ValidationGroup="insertLoc" ControlToValidate="TextBox1" ForeColor="Red" ErrorMessage="Enter Location Name"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td><label><b>Co-Ordinates</b></label> </td>
                        <td>
                            <asp:TextBox ID="txtboxcrd" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCrd" runat="server" ForeColor="Red" ValidationGroup="insertLoc" ControlToValidate="txtboxcrd" ErrorMessage="Pick Co-ordinates From Above Map"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button CssClass="btn-primary" ID="Button1" runat="server" Text="Submit" ValidationGroup="insertLoc" OnClick="Button1_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="col-md-12" align="center">
                            <br />
                            <asp:GridView ID="GridView1" CssClass="col-md-12 table-striped" DataKeyNames="loccod" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2" OnRowCommand="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing">
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
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkbtnDelete" runat="server" CommandName="deleteRow" CommandArgument='<%#Eval("loccod") %>' Text="Delete"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
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
        </div>

    </div>
</asp:Content>
