<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TabPanel.aspx.cs" Inherits="ExtNetApplication.ExtForms.TabPanel" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<script runat="server">
    public static string TEST_HTML_1 = "<div>redisn</div>";

    public static string TEST_HTML_2 = @"<b>This tab is scrollable.</b><br /><br /> 
                    Aenean sit amet quam ipsum. Nam aliquet ullamcorper lorem, vel commodo neque auctor quis. Vivamus ac purus in  
                    tortor tempor viverra eget a magna. Nunc accumsan dolor porta mauris consequat nec mollis felis mattis. Nunc ligula nisl,  
                    tempor ut pellentesque et, viverra eget tellus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sodales  
                    rhoncus massa, sed lobortis risus euismod at. Suspendisse dictum, lectus vitae aliquam egestas, quam diam consequat augue,  
                    non porta odio ante a dui. Vivamus lacus mi, ultrices sed feugiat elementum, ultrices et lectus. Donec aliquet hendrerit magna,  
                    in venenatis ante faucibus ut. Duis non neque magna. Quisque iaculis luctus nibh, id pellentesque lorem egestas non. Phasellus  
                    id risus eget felis auctor scelerisque. Fusce porttitor tortor eget magna pretium viverra. Sed tempor vulputate felis aliquam  
                    scelerisque. Quisque eget libero non lectus tempus varius eu a tortor. 
                    <br /><br /> 
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed egestas gravida nibh, quis porttitor felis  
                    venenatis id. Nam sodales mollis quam eget venenatis. Aliquam metus lorem, tincidunt ut egestas imperdiet, convallis  
                    lacinia tortor. Mauris accumsan, nisl et sodales tristique, massa dui placerat erat, at venenatis tortor libero nec  
                    tortor. Pellentesque quis elit ac dolor commodo tincidunt. Curabitur lorem eros, tincidunt quis viverra id, lacinia  
                    sed nisl. Quisque viverra ante eu nisl consectetur hendrerit.";
</script>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Plain TabPanel - Ext.NET Examples</title>
</head>
<body>
    <ext:ResourceManager ID="ResourceManager1" runat="server" />
    <ext:Viewport ID="Viewport1" runat="server" Margins="0 0 10 0">
        <LayoutConfig>
            <ext:VBoxLayoutConfig Align="Center" Pack="Center" />
        </LayoutConfig>
        <Items>
            <ext:TabPanel ID="TabPanel1" runat="server" Width="400" Height="295" Margins="0 0 20 0">
                <Defaults>
                    <ext:Parameter Name="bodyPadding" Value="10" Mode="Raw" />
                    <ext:Parameter Name="autoScroll" Value="true" Mode="Raw" />
                </Defaults>
                <Items>
                    <ext:Panel ID="Panel1" runat="server" Title="Active Tab" Html="<%# TEST_HTML_1  %>"
                        AutoDataBind="true"></ext:Panel>
                    <ext:Panel ID="Panel2" runat="server" Title="Inactive Tab" Html="<%# TEST_HTML_2  %>"
                        AutoDataBind="true" />
                    <ext:Panel ID="Panel3" runat="server" Title="Disabled Tab" Disabled="true" />
                </Items>
            </ext:TabPanel>
        </Items>
    </ext:Viewport>
</body>
</html>
