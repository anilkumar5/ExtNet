<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPort.aspx.cs" Inherits="ExtNetApplication.ExtForms.ViewPort" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Viewport with BorderLayout - Ext.NET Examples</title>
</head>
<body>
    <div style="float: left" id="divLeft">
        <ext:ResourceManager ID="ResourceManager1" runat="server" />
        <ext:Viewport ID="Viewport1" runat="server" Layout="BorderLayout">
        <Items>
            <ext:Panel ID="Panel1" 
                runat="server"
                Title="North" 
                Region="North"
                Split="true"
                Height="150"
                BodyPadding="6"
                Html="North"
                Collapsible="true"
                />
            <ext:Panel ID="Panel2" 
                runat="server" 
                Title="West" 
                Region="West"
                Layout="AccordionLayout"
                Width="225" 
                MinWidth="225" 
                MaxWidth="400" 
                Split="true" 
                Collapsible="true">
                <Items>
                    <ext:Panel ID="Panel3" 
                        runat="server" 
                        Title="Navigation" 
                        Border="false" 
                        BodyPadding="6"
                        Icon="FolderGo"
                        Html="West"
                        />
                    <ext:Panel ID="Panel4" 
                        runat="server" 
                        Title="Settings" 
                        Border="false" 
                        BodyPadding="6"
                        Icon="FolderWrench"
                        Html="Some settings in here"
                        />
                </Items>
            </ext:Panel>
            <ext:TabPanel ID="TabPanel1" runat="server" Region="Center">
                <Items>
                    <ext:Panel ID="Panel5" 
                        runat="server" 
                        Title="Center" 
                        Border="false" 
                        BodyPadding="6"
                        Html="<h1>Viewport with BorderLayout</h1>"
                        />
                    <ext:Panel ID="Panel6" 
                        runat="server" 
                        Title="Close Me" 
                        Closable="true" 
                        Border="false" 
                        BodyPadding="6"
                        Html="Closeable Tab"
                        />
                </Items>
            </ext:TabPanel>
            <ext:Panel ID="Panel7" 
                runat="server" 
                Title="East" 
                Region="East"
                Collapsible="true" 
                Split="true" 
                MinWidth="225"
                Width="225" 
                Layout="Fit">
                <Items>
                    <ext:TabPanel ID="TabPanel2" 
                        runat="server"
                        ActiveTabIndex="1" 
                        TabPosition="Bottom" 
                        Border="false">
                        <Items>
                            <ext:Panel ID="Panel8" 
                                runat="server" 
                                Title="Tab 1" 
                                Border="false" 
                                BodyPadding="6"
                                Html="East Tab 1"
                                />
                            <ext:Panel ID="Panel9" 
                                runat="server" 
                                Title="Tab 2" 
                                Closable="true" 
                                Border="false" 
                                BodyPadding="6"
                                Html="East Tab 2"
                                />
                        </Items>
                    </ext:TabPanel>
                </Items>
            </ext:Panel>
            <ext:Panel ID="Panel10" 
                runat="server"
                Title="South"
                Region="South"
                Split="true"
                Collapsible="true"
                Height="150"
                BodyPadding="6"
                Html="South"
                />
        </Items>
    </ext:Viewport>
    </div>
</body>
</html>
