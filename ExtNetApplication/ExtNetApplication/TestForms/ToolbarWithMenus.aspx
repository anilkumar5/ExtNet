<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ToolbarWithMenus.aspx.cs"
    Inherits="ExtNetApplication.TestForms.ToolbarWithMenus" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        Ext.Net.MenuItem item = new Ext.Net.MenuItem();
        item.Text = "Dynamically added Item";
        item.Handler = "onItemClick";
        MenuButton.Menu.Primary.Items.Add(item);

        item = new Ext.Net.MenuItem();
        item.Text = "Disabled Item";
        item.Disabled = true;

        this.MenuButton.Menu.Primary.Items.Add(item);

        Ext.Net.Menu scrollingMenu = new Ext.Net.Menu { MaxHeight = 250 };

        for (int i = 0; i < 50; i++)
        {
            scrollingMenu.Items.Add(new Ext.Net.MenuItem { Text = "Item " + (i + 1), Width = 100 });
        }

        this.ScrollingMenuButton.Menu.Add(scrollingMenu);
    }
</script>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Toolbar with Menus - Ext.NET Examples</title>
    <link href="/resources/css/examples.css" rel="stylesheet" />
    <style>
        .menu-title
        {
            background: #D6E3F2;
            border-style: solid;
            border-color: #DAE6F4 #99bbe8 #99bbe8 #DAE6F4;
            border-width: 1px;
            margin: -2px -2px 0;
            color: #15428b;
            font: bold 10px tahoma,arial,verdana,sans-serif;
            display: block;
            padding: 3px;
        }
    </style>
    <script>
        var onButtonClick = function (btn) {
            msg("Button Click", 'You clicked the \'{0}\' button.', btn.text);
        };

        var onItemClick = function (item) {
            msg("Menu Click", 'You clicked the \'{0}\' menu item.', item.text);
        };

        var onItemCheck = function (item, checked) {
            msg("Item Check", 'You {1} the \'{0}\' menu item.', item.text, checked ? "checked" : "unchecked");
        };

        var onItemToggle = function (item, pressed) {
            msg("Button Toggled", "Button \'{0}\' was toggled to {1}.", item.text, pressed);
        };

        var msg = function (title, format) {
            var s = Ext.String.format.apply(Ext.String, Array.prototype.slice.call(arguments, 1));
            Ext.get("notificationArea").update(s).highlight();
        };
    </script>
</head>
<body>
    <form id="Form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" />
    <h1>
        Toolbar with Menus</h1>
    <ext:Viewport ID="Viewport1" runat="server">
        <Content>
            <ext:Toolbar ID="Toolbar1" runat="server" Width="650">
                <Items>
                    <ext:Button ID="MenuButton" runat="server" Text="Button w/Menu" Icon="ArrowDown">
                        <Menu>
                            <ext:Menu ID="Menu1" runat="server">
                                <Items>
                                    <ext:CheckMenuItem ID="CheckMenuItem1" runat="server" Checked="true" Text="I like ASP.NET"
                                        CheckHandler="onItemCheck" />
                                    <ext:CheckMenuItem ID="CheckMenuItem2" runat="server" Checked="true" Text="Item 2"
                                        CheckHandler="onItemCheck" />
                                    <ext:CheckMenuItem ID="CheckMenuItem3" runat="server" Text="Item 3" CheckHandler="onItemCheck" />
                                    <ext:MenuSeparator />
                                    <ext:MenuItem ID="MenuItem1" runat="server" Text="Radio Options">
                                        <Menu>
                                            <ext:Menu ID="Menu2" runat="server">
                                                <Items>
                                                    <ext:MenuItem ID="MenuItem2" runat="server" Text="<b class='menu-title'>Choose a Theme</b>"
                                                        Plain="true" />
                                                    <ext:CheckMenuItem ID="CheckMenuItem4" runat="server" Text="Aero Glass" Checked="true"
                                                        Group="theme" CheckHandler="onItemCheck" />
                                                    <ext:CheckMenuItem ID="CheckMenuItem5" runat="server" Text="Vista Black" Group="theme"
                                                        CheckHandler="onItemCheck" />
                                                    <ext:CheckMenuItem ID="CheckMenuItem6" runat="server" Text="Gray Theme" Group="theme"
                                                        CheckHandler="onItemCheck" />
                                                    <ext:CheckMenuItem ID="CheckMenuItem7" runat="server" Text="Default Theme" Group="theme"
                                                        CheckHandler="onItemCheck" />
                                                </Items>
                                            </ext:Menu>
                                        </Menu>
                                    </ext:MenuItem>
                                    <ext:MenuItem ID="MenuItem3" runat="server" Text="Choose a Date" Icon="Calendar">
                                        <Menu>
                                            <ext:DateMenu ID="DateMenu1" runat="server">
                                                <Picker ID="Picker1" runat="server" />
                                                <Listeners>
                                                    <Select Handler="msg('Date Selected', 'You chose {0}.', Ext.Date.format(date, 'M j, Y'));" />
                                                </Listeners>
                                            </ext:DateMenu>
                                        </Menu>
                                    </ext:MenuItem>
                                    <ext:MenuItem ID="MenuItem4" runat="server" Text="Choose a Color" Icon="ColorSwatch">
                                        <Menu>
                                            <ext:ColorMenu ID="ColorMenu1" runat="server">
                                                <Listeners>
                                                    <Select Handler="msg('Color Selected', 'You chose {0}.', color);" />
                                                </Listeners>
                                            </ext:ColorMenu>
                                        </Menu>
                                    </ext:MenuItem>
                                    <ext:MenuSeparator />
                                </Items>
                            </ext:Menu>
                        </Menu>
                    </ext:Button>
                    <ext:SplitButton ID="SplitButton1" runat="server" Text="Split Button" Icon="NoteGo"
                        Handler="onButtonClick">
                        <Menu>
                            <ext:Menu ID="Menu3" runat="server">
                                <Items>
                                    <ext:MenuItem ID="MenuItem5" runat="server" Text="<b>Bold</b>" Handler="onItemClick" />
                                    <ext:MenuItem ID="MenuItem6" runat="server" Text="<i>Italic</i>" Handler="onItemClick" />
                                    <ext:MenuItem ID="MenuItem7" runat="server" Text="<u>Underline</u>" Handler="onItemClick" />
                                    <ext:MenuSeparator />
                                    <ext:MenuItem ID="MenuItem8" runat="server" Text="Pick a Color" Handler="onItemClick">
                                        <Menu>
                                            <ext:Menu ID="Menu4" runat="server">
                                                <Items>
                                                    <ext:ColorPicker ID="ColorPicker1" runat="server">
                                                        <Listeners>
                                                            <Select Handler="msg('Color Selected', 'You chose {0}.', color);" />
                                                        </Listeners>
                                                    </ext:ColorPicker>
                                                    <ext:MenuItem ID="MenuItem9" runat="server" Text="More Colors...">
                                                    </ext:MenuItem>
                                                </Items>
                                            </ext:Menu>
                                        </Menu>
                                    </ext:MenuItem>
                                    <ext:MenuItem ID="MenuItem10" runat="server" Text="Extellent!" Handler="onItemClick" />
                                </Items>
                            </ext:Menu>
                        </Menu>
                        <ToolTips>
                            <ext:ToolTip ID="Tip1" runat="server" Title="Tip Title" Html="This is a an example QuickTip for a toolbar item" />
                        </ToolTips>
                    </ext:SplitButton>
                    <ext:ToolbarSeparator />
                    <ext:Button ID="Button1" runat="server" Text="Toggle Me" EnableToggle="true" ToggleHandler="onItemToggle" />
                    <ext:ToolbarSeparator />
                    <ext:Button ID="Button2" runat="server" Icon="Table">
                        <ToolTips>
                            <ext:ToolTip ID="ToolTip1" runat="server" Html="<b>Quick Tips</b><br/>Icon only button with tooltip" />
                        </ToolTips>
                    </ext:Button>
                    <ext:ToolbarSeparator />
                    <ext:Button ID="ScrollingMenuButton" runat="server" Text="Scrolling Menu" Icon="ApplicationForm" />
                    <ext:ComboBox ID="ComboBox1" runat="server" EmptyText="Select an option">
                        <Items>
                            <ext:ListItem Text="Option1" />
                            <ext:ListItem Text="Option2" />
                            <ext:ListItem Text="Option3" />
                            <ext:ListItem Text="Option4" />
                            <ext:ListItem Text="Option5" />
                        </Items>
                    </ext:ComboBox>
                </Items>
            </ext:Toolbar>
            <div id="notificationArea" style="width: 650px; padding: 10px; border: 1px solid black;
                height: 40px;">
            </div>
        </Content>
    </ext:Viewport>
    </form>
</body>
</html>
