<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestForm.aspx.cs" Inherits="ExtNetApplication.TestForms.TestForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div>
        <ext:ResourceManager runat="server" />
        <ext:Toolbar runat="server">
            <Items>
                <ext:TabStrip runat="server">
                    <Items>
                        <ext:Tab Text="Home" ActionItemID="divHome" />
                        <ext:Tab Text="About Us" ActionItemID="divAboutUs" />
                    </Items>
                </ext:TabStrip>
                <ext:ToolbarFill />
            </Items>
        </ext:Toolbar>
    </div>
    <div id="divHome">
        <form id="form" runat="server">
        <ext:Viewport ID="Viewport1" runat="server" Layout="ColumnLayout">
            <Items>
                <ext:Panel ID="Panel1" runat="server" ColumnWidth="0.25" Height="500" Title="Width=0.25"
                    Html="This is some content." Region="West"  Split="true" Layout="AccordionLayout">
                    <Items>
                        <ext:Panel runat="server" Title="Jobs" Icon="Folder">
                            <Items>
                                <ext:TreePanel runat="server">
                                    <TopBar>
                                        <ext:Toolbar runat="server">
                                            <Items>
                                                <ext:Label Icon="Coins" Text="Jobs" runat="server" />
                                                <ext:ToolbarFill />
                                                <ext:Label ID="Label1" Icon="Zoom" runat="server" />
                                            </Items>
                                        </ext:Toolbar>
                                    </TopBar>
                                    <Root>
                                        <ext:Node Text="Job1">
                                            <Children>
                                                <ext:Node Text="AllJobs" />
                                                <ext:Node Text="Individuals" />
                                            </Children>
                                        </ext:Node>
                                    </Root>
                                </ext:TreePanel>
                            </Items>
                        </ext:Panel>
                        <ext:Panel ID="Panel4" runat="server" Title="Organizaion" Icon="Folder">
                        </ext:Panel>
                        <ext:Panel ID="Panel5" runat="server" Title="Services" Icon="Folder">
                        </ext:Panel>
                    </Items>
                </ext:Panel>
                <ext:Panel ID="Panel2" runat="server" ColumnWidth="0.75" Height="100" Title="Width=0.75"
                    Html="This is some content." />
                <ext:Panel ID="Panel3" runat="server" Title="Width=250px" Height="100" Width="250"
                    Html="This is some content." />
            </Items>
        </ext:Viewport>
        </form>
    </div>
    <div id="divAboutUs">
        About US
    </div>
</body>
</html>
