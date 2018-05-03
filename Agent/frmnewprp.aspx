<%@ Page Title="" Language="C#" MasterPageFile="~/Agent/MasterPage.master" AutoEventWireup="true" CodeFile="frmnewprp.aspx.cs" Inherits="Agent_Default" %>

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
            <h3 class="auto-style1">Manage Profile</h3>
        </header>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="row">
            <div id="map" class="col-md-8 offset-2">
            </div>

            <div class="col-md-8 offset-2">
                <br />
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
                            <div class="form-group">
                                <br />

                                <asp:GridView ID="grdviewfet" DataKeyNames="prpfetcod,fetcod" OnRowEditing="grdviewfet_RowEditing" OnRowDeleting="grdviewfet_RowDeleting" OnRowCancelingEdit="grdviewfet_RowCancelingEdit" AutoGenerateColumns="false" runat="server">
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
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Edit">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkbtnedit" runat="server" CommandName="edit" Text="Edit"></asp:LinkButton>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:LinkButton ID="lnkbtncancel" runat="server" CommandName="cancel" Text="Cancel"></asp:LinkButton>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkbtndlt" Text="Delete" CommandName="delete" runat="server"></asp:LinkButton>
                                            </ItemTemplate>
                                            <EditItemTemplate>

                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>

                    <ajaxToolkit:TabPanel ID="TabPanel3" HeaderText="Pictures" runat="server">
                        <ContentTemplate>
                            <div class="form-group">
                                <asp:RadioButtonList runat="server" ID="radiobtnAV">
                                    <asp:ListItem Text="Picture" Value='P'></asp:ListItem>
                                    <asp:ListItem Text="Video" Value='V'></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                            <div class="form-group">
                                <label> Browse File:</label>
                                <asp:FileUpload ID="fileupload1" runat="server"/>
                            </div>
                            <div class="form-group">
                                <label>
                                    Description:
                                </label>
                                <asp:TextBox ID="txtboxfildsc" CssClass="form-control" runat="server" TextMode="MultiLine" ></asp:TextBox>
                            </div>
                            <div>
                                <asp:Button ID="btnfileupload" OnClick="btnfileupload_Click" CssClass="btn-fileUpload" runat="server" Text="Upload"/>
                            </div>
                            <div class="form-control">
                                <asp:DataList ID="datalistpics" DataKeyField="prppiccod" OnItemDataBound="datalistpics_ItemDataBound" RepeatColumns="3" RepeatDirection="Horizontal" CssClass="" runat="server">
                                    <ItemTemplate>
                                        <asp:Literal ID="literal1" runat="server"></asp:Literal>
                                        <p><%#Eval("prppicdsc") %></p>
                                        <asp:LinkButton ID="lnkbtnfiledit" runat="server" Text="Edit" CommandName="edit"></asp:LinkButton>
                                        <br />
                                        <asp:LinkButton ID="lnkbtnfildlt" runat="server" Text="Delete" CommandName="delete"></asp:LinkButton>
                                        <br />
                                        <asp:LinkButton ID="lnkbtnfilselect" runat="server" Text="Set As Main Picture" CommandName="select"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>

                </ajaxToolkit:TabContainer>

                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Display_Rec" TypeName="nszillow.clsprpty"></asp:ObjectDataSource>
                <br />
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="Display_Rec" TypeName="nszillow.clsfet"></asp:ObjectDataSource>
            </div>
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
                    document.getElementById('<%=lblcrd.ClientID %>').innerText = event.latLng;
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
        <asp:HiddenField ID="hidden" runat="server" />

    </div>
</asp:Content>
