<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobsData.aspx.cs" Inherits="ExtNetApplication.ExtForms.JobsData" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <ext:ResourceManager ID="ResourceManager1" runat="server" />
    <div class="float-left">
        <ext:Toolbar ID="Toolbar3" runat="server">
            <Items>
                <ext:TabStrip ID="TabStrip4" runat="server">
                    <Items>
                        <ext:Tab Text="Summary" ActionItemID="elm1" />
                        <ext:Tab Text="Virtual Machines" ActionItemID="elm2" />
                        <ext:Tab Text="History" ActionItemID="elm3" />
                    </Items>
                </ext:TabStrip>
                <ext:ToolbarFill />
            </Items>
        </ext:Toolbar>
        <ext:Toolbar ID="Toolbar2" runat="server">
            <Items>
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
            </Items>
        </ext:Toolbar>
    </div>
    <div id="elm1">
        <form id="form1" runat="server">
        </form>
    </div>
    <div id="elm2">
        test</div>
    <div id="elm3">
        History</div>
</body>
</html>
