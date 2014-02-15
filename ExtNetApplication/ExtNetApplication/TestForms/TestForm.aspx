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
                        <ext:Panel ID="Panel1" 
                            runat="server" 
                            ColumnWidth="0.25" 
                            Height="100"
                            Title="Width=0.25" 
                            Html="This is some content." Collapsible="true" Region="East" 
                            />
                        <ext:Panel ID="Panel2" 
                            runat="server" 
                            ColumnWidth="0.75" 
                            Height="100"
                            Title="Width=0.75" 
                            Html="This is some content." 
                            />
                        <ext:Panel ID="Panel3" 
                            runat="server"                
                            Title="Width=250px" 
                            Height="100"
                            Width="250" 
                            Html="This is some content." 
                            />
                </Items>
    </ext:Viewport>
        </form>
    </div>
    <div id="divAboutUs">
        About US
    </div>
</body>
</html>
