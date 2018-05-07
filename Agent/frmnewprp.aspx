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
            <h3 class="auto-style1">Add New Property</h3>
        </header>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="row">
            <div id="divMap" class="col-md-8 offset-2" runat="server">
                <div id="map" class="col-md-12">
                </div>
            </div>
        </div>
        <div class="row">
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorSls" runat="server" ValidationGroup="details" ControlToValidate="radiobtnSls" ForeColor="Red" ErrorMessage="Select At Least One">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>Select Property</label>
                                <asp:DropDownList ID="drpprptyp" OnDataBound="drpprptyp_DataBound" CssClass="form-control" runat="server" DataSourceID="ObjectDataSource1" DataTextField="prptypnam" DataValueField="prptycod"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrpty" runat="server" ValidationGroup="details" ForeColor="Red" ControlToValidate="drpprptyp" InitialValue="-1" ErrorMessage="Select Property Type"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>Property Title</label>
                                <asp:TextBox ID="txtboxtit" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTitle" runat="server" ValidationGroup="details" ControlToValidate="txtboxtit" ForeColor="Red" ErrorMessage="Title Required"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>Property Cost</label>
                                <asp:TextBox ID="txtboxprc" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCost" Display="Dynamic" runat="server" ControlToValidate="txtboxprc" ForeColor="Red" ValidationGroup="details" ErrorMessage="Cost Rquired"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorCost" Display="Dynamic" runat="server" ControlToValidate="txtboxprc" ForeColor="Red" ValidationGroup="details" ValidationExpression="^\d{0,8}(\.\d{1,4})?$" ErrorMessage="Enter Valid Cost of Property"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <asp:TextBox ID="txtboxadd" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddress" runat="server" ControlToValidate="txtboxadd" ForeColor="Red" ValidationGroup="details" ErrorMessage="Address Required"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>Co-ordinates:</label>
                                <asp:TextBox ID="txtcrd" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCrd" runat="server"  ValidationGroup="details" ControlToValidate="txtcrd" ForeColor="Red" ErrorMessage="Select Co-ordinates From Map"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <asp:TextBox ID="txtboxdsc" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatordsc" runat="server" ControlToValidate="txtboxdsc" ForeColor="Red" ValidationGroup="details" ErrorMessage="Description Required"></asp:RequiredFieldValidator>
                            </div>
                            <div align="center">
                                <asp:Button ID="btnsubmit" CssClass="btn btn-default submit" runat="server" ValidationGroup="details" Text="Submit" OnClick="btnsubmit_Click" />
                            </div>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>

                    <ajaxToolkit:TabPanel ID="TabPanel2" HeaderText="Features" runat="server">
                        <ContentTemplate>
                            <div class="form-group">
                                <label>Select Features</label>
                                <asp:DropDownList ID="drpdwnlstfet" OnDataBound="drpdwnlstfet_DataBound" CssClass="form-control" runat="server" DataSourceID="ObjectDataSource2" DataTextField="fetdsc" DataValueField="fetcod"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorfetlst" runat="server" ForeColor="Red" ControlToValidate="drpdwnlstfet" InitialValue="-1" ValidationGroup="fet" ErrorMessage="Select Feature"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <asp:TextBox ID="txtboxfetdsc" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorfetdsc" runat="server" ForeColor="Red" ControlToValidate="txtboxfetdsc" ValidationGroup="fet" ErrorMessage="Description Required"></asp:RequiredFieldValidator>
                            </div>
                            <div align="center">
                                <asp:Button ID="btnsubmitfet" CssClass="btn" ValidationGroup="fet" runat="server" OnClick="btnsubmitfet_Click" Text="Submit" />
                            </div>
                            <div class="form-group">
                                <br />

                                <asp:GridView ID="grdviewfet" DataKeyNames="prpfetcod,fetcod" CssClass="table-striped" OnRowEditing="grdviewfet_RowEditing" OnRowDeleting="grdviewfet_RowDeleting" OnRowCancelingEdit="grdviewfet_RowCancelingEdit" AutoGenerateColumns="false" runat="server">
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorAV" runat="server" ForeColor="Red" ControlToValidate="radiobtnAV" ValidationGroup="pic" ErrorMessage="Select Picture/Video"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>Browse File:</label>
                                <asp:FileUpload ID="fileupload1" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFilUp" runat="server" ForeColor="Red" ControlToValidate="fileupload1" ValidationGroup="pic" ErrorMessage="Upload File"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>
                                    Description:
                                </label>
                                <asp:TextBox ID="txtboxfildsc" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorfildsc" runat="server" ForeColor="Red" ControlToValidate="txtboxfildsc" ValidationGroup="pic" ErrorMessage="Decription Required"></asp:RequiredFieldValidator>
                            </div>
                            <div align="center">
                                <asp:Button ID="btnfileupload" OnClick="btnfileupload_Click" ValidationGroup="pic" CssClass="btn-fileUpload" runat="server" Text="Upload" />
                            </div>
                            <br />
                            <div align="center" class="form-control">

                                <asp:DataList ID="datalistpics" DataKeyField="prppiccod" OnUpdateCommand="datalistpics_UpdateCommand" OnDeleteCommand="datalistpics_DeleteCommand" OnEditCommand="datalistpics_EditCommand" OnItemDataBound="datalistpics_ItemDataBound" OnItemCommand="datalistpics_ItemCommand" RepeatColumns="2" RepeatDirection="Horizontal" CssClass="" runat="server">
                                    <ItemTemplate>
                                        <table class="table-active">
                                            <tr>
                                                <td colspan="2">
                                                    <asp:Literal ID="literal1" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <p><%#Eval("prppicdsc") %></p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <asp:LinkButton ID="lnkbtnfiledit" runat="server" Text="Edit" CommandName="edit"></asp:LinkButton>
                                                </td>
                                                <td align="center">
                                                    <asp:LinkButton ID="lnkbtnfildlt" runat="server" Text="Delete" CommandName="delete"></asp:LinkButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <asp:LinkButton ID="lnkbtnfilselect" runat="server" Text="Set As Main Picture" CommandArgument='<%#Eval("prppiccod") %>' CommandName="setAsMainPic"></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <table class="table-active">
                                            <tr>
                                                <td colspan="2">
                                                    <asp:Literal ID="literal1" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <asp:TextBox ID="txtboxpicdsc" TextMode="MultiLine" Text='<%#Eval("prppicdsc")%>' runat="server">
                                                    </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <asp:LinkButton ID="lnkbtnfiledit" runat="server" Text="Update" CommandArgument='<%#Eval("prppiccod") %>' CommandName="update"></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </EditItemTemplate>
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
                    document.getElementById('<%=txtcrd.ClientID %>').value = event.latLng;
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
