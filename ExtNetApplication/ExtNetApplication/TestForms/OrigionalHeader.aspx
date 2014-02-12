<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrigionalHeader.aspx.cs"
    Inherits="ExtNetApplication.TestForms.OrigionalHeader" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Original Header - Ext.NET Examples</title>
</head>
<body>
    <ext:ResourceManager ID="ResourceManager1" runat="server" />
    <ext:Viewport ID="Viewport1" runat="server" Layout="Border">
        <Items>
            <ext:Panel ID="Panel1" runat="server" Width="300" Border="false" Region="West" Layout="Fit" Split="true" Collapsible="true"
                BodyPadding="5">
                <Items>
                    <ext:Panel ID="Panel2" runat="server" Layout="Accordion" Margins="0 0 15 0">
                        <LayoutConfig>
                            <ext:AccordionLayoutConfig OriginalHeader="true" />
                        </LayoutConfig>
                        <Items>
                            <ext:Panel ID="Panel3" runat="server" Title="Item 1" Border="false" />
                            <ext:Panel ID="Panel4" runat="server" Title="Item 2" Border="false" />
                            <ext:Panel ID="Panel5" runat="server" Title="Item 3" Border="false" />
                            <ext:Panel ID="Panel6" runat="server" Title="Item 4" Border="false" />
                            <ext:Panel ID="Panel7" runat="server" Title="Item 5" Border="false" />
                        </Items>
                    </ext:Panel>
                </Items>
            </ext:Panel>
            <ext:Panel ID="Panel8" runat="server" Margins="5" Region="Center" BodyPadding="10">
                <Content>
                    <h1>
                        Original header of the Accordion's item</h1>
                </Content>
            </ext:Panel>
        </Items>
    </ext:Viewport>
</body>
</html>
