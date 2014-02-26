<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="RPO_RTO.aspx.cs"
    Inherits="ExtNetApplication.ExtForms.RPO_RTO" %>

<html>
<head>
</head>
<body>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" />
    <div style="float: left;">
        <ext:Viewport ID="Viewport3" runat="server" Layout="BorderLayout" Height="1000">
            <Items>
                <%-- <ext:Panel ID="Panel2" runat="server" Title="Settings" Region="West" Layout="AccordionLayout"
                Width="225" MinWidth="225" MaxWidth="400" Split="true" Collapsible="true" Html="<span style='margin-left:10px;'>RPO/RTO</span>">
            </ext:Panel>--%>
                <ext:Panel ID="Panle3" runat="server" Region="Center">
                    <Content>
                        <div style="padding: 35px 50px 0px 50px;" id="divRPO">
                            <ext:FieldSet ID="FieldSet1" runat="server" Title="RPO/RTO Settings" Collapsible="false"
                                DefaultAnchor="70%" BorderSpec="2" Padding="30">
                                <Defaults>
                                    <ext:Parameter Name="labelWidth" Value="300" Mode="Raw" />
                                </Defaults>
                                <Items>
                                    <ext:FieldContainer ID="FieldContainer1" runat="server" FieldLabel="Default Service Level when creating new job">
                                        <Items>
                                            <ext:ComboBox ID="ComboBox1" Text="Select Item" runat="server">
                                                <Items>
                                                    <ext:ListItem Text="Gold" Value="1">
                                                    </ext:ListItem>
                                                </Items>
                                                <SelectedItems>
                                                    <ext:ListItem Text="Gold" Value="1">
                                                    </ext:ListItem>
                                                </SelectedItems>
                                            </ext:ComboBox>
                                        </Items>
                                    </ext:FieldContainer>
                                    <ext:FieldContainer ID="FieldContainer2" runat="server" FieldLabel="Set Compilance on alert">
                                        <Items>
                                            <ext:ComboBox ID="ComboBox2" Text="Select Item" runat="server">
                                                <Items>
                                                    <ext:ListItem Text="Always" Value="1">
                                                    </ext:ListItem>
                                                </Items>
                                                <SelectedItems>
                                                    <ext:ListItem Text="Always" Value="1">
                                                    </ext:ListItem>
                                                </SelectedItems>
                                            </ext:ComboBox>
                                        </Items>
                                    </ext:FieldContainer>
                                    <ext:FieldContainer ID="FieldContainer3" runat="server" FieldLabel="Send Email Notification Alerts">
                                        <Items>
                                            <ext:ComboBox ID="ComboBox3" Text="Select Item" runat="server">
                                                <Items>
                                                    <ext:ListItem Text="Always" Value="1">
                                                    </ext:ListItem>
                                                    <ext:ListItem Text="RPO Exceeded" Value="2">
                                                    </ext:ListItem>
                                                    <ext:ListItem Text="RTO Exceeded" Value="3">
                                                    </ext:ListItem>
                                                </Items>
                                                <SelectedItems>
                                                    <ext:ListItem Text="Always" Value="1">
                                                    </ext:ListItem>
                                                </SelectedItems>
                                            </ext:ComboBox>
                                        </Items>
                                    </ext:FieldContainer>
                                </Items>
                            </ext:FieldSet>
                        </div>
                        <div style="padding: 35px 50px 0px 50px;">
                            <ext:FieldSet ID="FieldSet2" runat="server" Title="Details" Collapsible="false" DefaultAnchor="70%"
                                BorderSpec="2" Padding="30">
                                <Defaults>
                                    <ext:Parameter Name="labelWidth" Value="200" Mode="Raw" />
                                </Defaults>
                                <Items>
                                    <ext:Toolbar ID="Toolbar4" runat="server">
                                        <Items>
                                            <ext:Button ID="Button4" runat="server" Icon="Add">
                                                <Listeners>
                                                </Listeners>
                                            </ext:Button>
                                            <ext:ToolbarSeparator />
                                            <ext:SplitButton ID="SplitButton1" runat="server" Text="Action" IconCls="add16" Icon="Star">
                                                <Menu>
                                                    <ext:Menu ID="Menu1" runat="server">
                                                        <Items>
                                                            <ext:MenuItem ID="MenuItem1" runat="server" Text="Account" />
                                                            <ext:MenuItem ID="MenuItem2" runat="server" Text="Security" />
                                                            <ext:MenuItem ID="MenuItem3" runat="server" Text="Timeline" />
                                                            <ext:MenuItem ID="MenuItem4" runat="server" Text="Logout" />
                                                        </Items>
                                                    </ext:Menu>
                                                </Menu>
                                            </ext:SplitButton>
                                            <ext:ToolbarFill />
                                        </Items>
                                    </ext:Toolbar>
                                    <ext:GridPanel ID="GridPanel1" runat="server">
                                        <Store>
                                            <ext:Store ID="Store1" runat="server">
                                                <Model>
                                                    <ext:Model ID="Model1" runat="server">
                                                        <Fields>
                                                            <ext:ModelField Name="Name" Type="String" />
                                                            <ext:ModelField Name="Rpo" Type="String" />
                                                            <ext:ModelField Name="Rto" Type="String" />
                                                            <ext:ModelField Name="ManualTest" Type="String" />
                                                            <ext:ModelField Name="Description" Type="String" />
                                                        </Fields>
                                                    </ext:Model>
                                                </Model>
                                            </ext:Store>
                                        </Store>
                                        <ColumnModel>
                                            <Columns>
                                                <ext:Column ID="Column1" runat="server" Text="Name" DataIndex="Name" Flex="1" />
                                                <ext:Column ID="Column2" runat="server" Text="RPO" DataIndex="Rpo">
                                                </ext:Column>
                                                <ext:Column ID="Column3" runat="server" Text="RTO" DataIndex="Rto">
                                                </ext:Column>
                                                <ext:Column ID="Column4" runat="server" Text="Manual Test" DataIndex="MmanualTest">
                                                </ext:Column>
                                                <ext:Column ID="Column5" runat="server" Text="Description" DataIndex="Description" />
                                            </Columns>
                                        </ColumnModel>
                                        <SelectionModel>
                                            <ext:RowSelectionModel ID="RowSelectionModel1" runat="server" />
                                        </SelectionModel>
                                    </ext:GridPanel>
                                </Items>
                            </ext:FieldSet>
                        </div>
                        <div style="padding-top: 35px;">
                            <ext:Toolbar ID="Toolbar5" runat="server" Region="South">
                                <Items>
                                    <ext:ToolbarFill />
                                    <ext:Button ID="Button1" runat="server" Text="Apply" />
                                    <ext:Button ID="Button2" runat="server" Text="Revert" />
                                </Items>
                            </ext:Toolbar>
                        </div>
                    </Content>
                </ext:Panel>
               <%-- <ext:Panel ID="Panel3" runat="server" Region="South" Split="true" Collapsible="false"
                    Height="50" BodyPadding="6">
                    <Items>
                        <ext:ToolbarFill ID="ToolbarFill1" runat="server" />
                    </Items>
                </ext:Panel>--%>
            </Items>
        </ext:Viewport>
    </div>
    </form>
</body>
</html>
