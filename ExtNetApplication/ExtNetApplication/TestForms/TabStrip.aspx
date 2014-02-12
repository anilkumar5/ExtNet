<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TabStrip.aspx.cs" Inherits="ExtNetApplication.TestForms.TabStrip" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>TabStrip and TabStripItem - Ext.NET Examples</title>
    <link href="/resources/css/examples.css" rel="stylesheet" />
</head>
<body>
    <form id="Form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" />
    <h1>
        TabStrip with setting the TabStripItems .ActionItemID Property</h1>
    <p>
        The TabStrip component can be added to any position within a Toolbar.</p>
    <ext:Panel ID="Panel1" runat="server" Height="185" Width="350" Layout="card" ActiveIndex="0"
        DefaultBorder="false" DefaultPadding="5">
        <TopBar>
            <ext:Toolbar ID="Toolbar1" runat="server" StyleSpec="padding-bottom:0px;">
                <Items>
                    <ext:Button ID="Button1" runat="server" Icon="Database" />
                    <ext:Button ID="Button2" runat="server" Icon="Disk" />
                    <ext:ToolbarFill ID="ToolbarFill1" runat="server" />
                    <ext:TabStrip ID="TabStrip1" runat="server">
                        <Items>
                            <ext:Tab ActionItemID="pnlSummary" Text="Summary" />
                            <ext:Tab ActionItemID="pnlData" Text="Data" />
                        </Items>
                    </ext:TabStrip>
                    <ext:ToolbarSeparator ID="ToolbarSeparator1" runat="server" />
                    <ext:Button ID="Button3" runat="server" Icon="Key" />
                    <ext:Button ID="Button4" runat="server" Icon="Help" />
                </Items>
            </ext:Toolbar>
        </TopBar>
        <Items>
            <ext:Panel ID="pnlSummary" runat="server" Html="Summary" Header="false" />
            <ext:Panel ID="pnlData" runat="server" Html="Data" Header="false" />
        </Items>
    </ext:Panel>
    <br />
    <h1>
        TabStrip with ActionContainerID</h1>
    <ext:Panel ID="Panel2" runat="server" Height="105" Width="350" Layout="card" ActiveIndex="0"
        DefaultBorder="false" DefaultPadding="5">
        <TopBar>
            <ext:Toolbar ID="Toolbar2" runat="server" StyleSpec="padding-bottom:0px;">
                <Items>
                    <ext:TabStrip ID="TabStrip2" runat="server" ActionContainerID="Panel3">
                        <Items>
                            <ext:Tab Text="Summary" />
                            <ext:Tab Text="Data" />
                        </Items>
                    </ext:TabStrip>
                </Items>
            </ext:Toolbar>
        </TopBar>
        <Items>
            <ext:Panel ID="Panel3" runat="server" Html="Summary" Header="false" />
            <ext:Panel ID="Panel4" runat="server" Html="Data" Header="false" />
        </Items>
    </ext:Panel>
    <br />
    <h1>
        Setting ActionItemID with Divs</h1>
    <ext:TabStrip ID="TabStrip3" runat="server">
        <Items>
            <ext:Tab Text="Summary" ActionItemID="elm1" />
            <ext:Tab Text="Data" ActionItemID="elm2" />
        </Items>
    </ext:TabStrip>
    <div id="elm1" style="padding: 5px;">
        text
    </div>
    <div id="elm2" style="padding: 5px;">
        Data</div>
    <%--my text--%>
    <ext:Toolbar ID="Toolbar3" runat="server">
        <Items>
            <ext:TabStrip ID="TabStrip4" runat="server">
                <Items>
                    <ext:Tab Text="Summary" ActionItemID="elm1" />
                    <ext:Tab Text="Data" ActionItemID="elm2" />
                </Items>
            </ext:TabStrip>
            <ext:ToolbarFill />
            <ext:Button ID="Button5" runat="server" Icon="Table">
                <ToolTips>
                    <ext:ToolTip ID="ToolTip1" runat="server" Html="<b>Quick Tips</b><br/>Icon only button with tooltip" />
                </ToolTips>
            </ext:Button>
            <ext:ToolbarFill />
            <ext:ToolbarSeparator />
            <ext:Button ID="Button6" runat="server" Icon="Box">
            </ext:Button>
            <ext:ToolbarSeparator />
            <ext:Button ID="Button7" runat="server" Icon="Box">
            </ext:Button>
        </Items>
    </ext:Toolbar>
    </form>
</body>
</html>
