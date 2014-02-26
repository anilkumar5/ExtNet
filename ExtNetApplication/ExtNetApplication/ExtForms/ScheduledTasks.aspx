<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScheduledTasks.aspx.cs"
    Inherits="ExtNetApplication.ExtForms.ScheduledTasks" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="/Scripts/Master.js" type="text/javascript"></script>
    <style type="text/css">
        #divOuter > div
        {
            width: 100%;
            float: left;
            line-height: 50px;
            height: 40px;
        }
        .divButtons > div
        {
            width: 40%;
            float: left;
        }
        div#divProp > div.divHalf > div
        {
            float: left;
            width: 50%;
        }
        div.divHalf
        {
            height: 30px;
        }
    </style>
</head>
<body>
    <ext:ResourceManager runat="server" />
    <ext:Viewport runat="server" Layout="BorderLayout">
        <Items>
            <%--<ext:Panel ID="Panel2" runat="server" Title="Jobs" Region="West" Layout="AccordionLayout"
                Width="225" MinWidth="225" MaxWidth="400" Split="true" Collapsible="true">
            </ext:Panel>--%>
            <ext:Panel Region="Center" Width="500" runat="server" Title="Center">
                <Items>
                    <ext:Toolbar runat="server">
                        <Items>
                            <ext:Button runat="server" Icon="Add" OnClientClick="#{Window1}.show();">
                            </ext:Button>
                            <ext:Button runat="server">
                            </ext:Button>
                            <ext:SplitButton Icon="Wrench" runat="server" Text="Actions">
                                <Menu>
                                    <ext:Menu runat="server">
                                        <Items>
                                            <ext:MenuItem Text="Run" />
                                            <ext:MenuItem Text="Edit" />
                                            <ext:MenuItem Text="Remove" />
                                            <ext:MenuItem Text="Disable" />
                                            <ext:MenuItem Text="Enable" />
                                        </Items>
                                    </ext:Menu>
                                </Menu>
                            </ext:SplitButton>
                        </Items>
                    </ext:Toolbar>
                    <ext:GridPanel runat="server" Height="500">
                        <Store>
                            <ext:Store ID="StoreCompany" runat="server">
                                <Model>
                                    <ext:Model runat="server">
                                        <Fields>
                                            <ext:ModelField Name="Data1" />
                                            <ext:ModelField Name="Price" />
                                            <ext:ModelField Name="Change" />
                                        </Fields>
                                    </ext:Model>
                                </Model>
                            </ext:Store>
                        </Store>
                        <Plugins>
                            <ext:RowEditing ID="RowEditing1" runat="server" ClicksToMoveEditor="1" ErrorSummary="false"
                                AutoCancel="false" />
                        </Plugins>
                        <ColumnModel>
                            <Columns>
                                <ext:Column DataIndex="Data1" Width="200" Text="Name" runat="server">
                                    <Editor>
                                        <ext:TextField ID="TextField1" runat="server" AllowBlank="false" />
                                    </Editor>
                                </ext:Column>
                                <ext:Column ID="Description" Width="200" DataIndex="Price" Text="Description" runat="server">
                                    <Editor>
                                        <ext:TextField ID="TextField2" runat="server" AllowBlank="false" />
                                    </Editor>
                                </ext:Column>
                                <ext:Column ID="Change" Width="200" DataIndex="Change" Text="Type" runat="server">
                                    <Editor>
                                        <ext:DropDownField ID="DropDownField1" runat="server" AllowBlank="false">
                                        </ext:DropDownField>
                                    </Editor>
                                </ext:Column>
                                <ext:Column ID="columnfake" Text="Next Run" runat="server">
                                    <Editor>
                                        <ext:TextField ID="TextField3" runat="server" AllowBlank="false" />
                                    </Editor>
                                </ext:Column>
                                <ext:Column Text="Time to run" runat="server">
                                    <Editor>
                                        <ext:TextField ID="TextField4" runat="server" AllowBlank="false" />
                                    </Editor>
                                </ext:Column>
                                <ext:Column Text="Schedule" runat="server">
                                    <Editor>
                                        <ext:TextField runat="server" AllowBlank="false" />
                                    </Editor>
                                </ext:Column>
                                <ext:Column Text="Enable" runat="server">
                                    <Editor>
                                        <ext:DropDownField ID="DropDownField2" runat="server" AllowBlank="false" />
                                    </Editor>
                                </ext:Column>
                                <ext:Column runat="server" Text="Organization">
                                    <Editor>
                                        <ext:DropDownField ID="DropDownField3" runat="server" AllowBlank="false" />
                                    </Editor>
                                </ext:Column>
                            </Columns>
                        </ColumnModel>
                    </ext:GridPanel>
                </Items>
            </ext:Panel>
        </Items>
    </ext:Viewport>
    <ext:Window ID="Window1" runat="server" Title="New Schedule task" Icon="Application"
        Height="200" Hidden="true" Width="450" BodyStyle="background-color: #fff;" BodyPadding="5"
        Modal="true">
        <Content>
            <div style="width: 310px; margin: 0 auto;" id="divOuter">
                <div>
                    <ext:Label runat="server" Text="Select a task to Schedule" />
                </div>
                <div>
                    <ext:ComboBox Text="Select task" runat="server" Width="300">
                        <Items>
                            <ext:ListItem Text="Send Compliance Report(Email)" />
                            <ext:ListItem Text="Send Licence Report(Email)" />
                            <ext:ListItem Text="Send Job Configuration Report(Email)" />
                            <ext:ListItem Text="System task" />
                            <ext:ListItem Text="Other future task" />
                        </Items>
                    </ext:ComboBox>
                </div>
                <div style="width: 50%; float: right" class="divButtons">
                    <ext:Button ID="btnOk" Text="Ok" Width="50" runat="server" OnClientClick="#{Window1}.hide(); #{Window2}.show(); #{Label1}.html='Anil'" />
                    <ext:Button ID="btnCancel" Text="Cancel" Width="100" OnClientClick="#{Window1}.hide();"
                        runat="server" />
                </div>
            </div>
        </Content>
    </ext:Window>
    <ext:Window ID="Window2" runat="server" Title="Properties" Icon="Application" Height="350"
        Width="450" BodyStyle="background-color: #fff;" BodyPadding="5" Modal="true"
        Hidden="true">
        <Content>
            <div style="padding: 10px; float: left;" id="divProp">
                <div class="divHalf" style="width: 100%; float: left">
                    <div>
                        <ext:Label Text="Task Name" runat="server" />
                    </div>
                    <div>
                        <ext:Label ID="Label1"  runat="server" />
                    </div>
                </div>
                <div class="divHalf" style="width: 100%; float: left">
                    <div>
                        <ext:Label ID="Label2" Text="Task Description" runat="server" />
                    </div>
                    <div>
                        <ext:TextField runat="server" Text="Description" />
                    </div>
                </div>
                <div class="divHalf" style="width: 100%; float: left">
                    <div>
                        <ext:Label ID="Label3" Text="Email Address" runat="server" />
                    </div>
                    <div>
                        <ext:TextField runat="server" Text="e.g. anil@gmail.com" />
                    </div>
                </div>
                <div style="width: 100%; float: left">
                    <ext:FieldSet runat="server" PaddingSpec="60 60 60 10" Title="Schedule">
                    </ext:FieldSet>
                </div>
                <div class="divHalf" style="width: 100%; float: left">
                    <div>
                        <ext:Checkbox runat="server" Checked="true" />
                        <ext:Label runat="server" Text="Enabled" />
                    </div>
                    <div class="divButtons">
                        <ext:Button ID="btnPropOk" Text="Ok" Width="50" runat="server" OnClientClick="#{Window2}.hide();" />
                        <ext:Button ID="btnPropCancel" Text="Cancel" Width="100" runat="server" OnClientClick="#{Window1}.show(); #{Window2}.hide();" />
                    </div>
                </div>
            </div>
        </Content>
    </ext:Window>
    <form id="form1" runat="server">
    </form>
</body>
</html>
