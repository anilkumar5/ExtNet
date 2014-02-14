<%@ Page Language="C#" %>

<%@ Import Namespace="System.Drawing" %>
<%@ Import Namespace="System.Drawing.Drawing2D" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Xml" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<script runat="server">
    protected void ReloadData(object sender, DirectEventArgs e)
    {
        //Store store = this.Chart1.GetStore();

        //store.DataSource = ExtNetApplication.Services.Products.GetProducts();
        //store.DataBind();
    }

</script>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Export Chart - Ext.NET Examples</title>
</head>
<body>
    <form id="Form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" />
    <h1>
        Export Multiple Charts to the Server Sample</h1>
    <p>
        Exports the Charts' SVG code to the Server to merge them into one image.</p>
    <p>
        Returns the result image file to the client.</p>
    <ext:Panel ID="Panel1" runat="server" Title="Area Chart" Layout="VBox" Width="600">
        <Items>
            <ext:Panel ID="Panel2" runat="server" Width="600" Height="300" Title="Trends, 2007"
                Layout="FitLayout">
                <Items>
                    <ext:Chart ID="Chart1" runat="server" InsetPadding="30">
                        <Store>
                            <ext:Store ID="Store1" runat="server" Data="<%# ExtNetApplication.Services.Products.GetProducts() %>"
                                AutoDataBind="true">
                                <Model>
                                    <ext:Model ID="Model1" runat="server">
                                        <Fields>
                                            <ext:ModelField Name="Name" />
                                            <ext:ModelField Name="Data1" />
                                        </Fields>
                                    </ext:Model>
                                </Model>
                            </ext:Store>
                        </Store>
                        <Axes>
                            <ext:NumericAxis Minimum="0" Maximum="100" Fields="Data1">
                                <Label Font="10px Arial">
                                    <Renderer Handler="return Ext.util.Format.number(value, '0,0');" />
                                </Label>
                            </ext:NumericAxis>
                            <ext:CategoryAxis Position="Bottom" Fields="Name">
                                <Label Font="11px Arial">
                                    <Renderer Handler="return value.substr(0, 3);" />
                                </Label>
                            </ext:CategoryAxis>
                        </Axes>
                        <Series>
                            <ext:LineSeries Axis="Left" XField="Name" YField="Data1">
                                <Listeners>
                                    <ItemMouseUp Handler="Ext.net.Notification.show({title:'Item Selected', html:item.value[1] + ' visits on ' + Ext.Date.monthNames[item.value[0]]});" />
                                </Listeners>
                                <Tips ID="Tips3" runat="server" TrackMouse="true" Width="110" Height="25">
                                    <Renderer Handler="this.setTitle(storeItem.get('Data1') + ' visits in ' + storeItem.get('Name').substr(0, 3));">
                                    </Renderer>
                                </Tips>
                                <Style Fill="#18428E" Stroke="#18428E" StrokeWidth="3" />
                                <MarkerConfig Type="Circle" Size="4" Radius="4" StrokeWidth="0" Fill="#18428E" Stroke="#18428E" />
                            </ext:LineSeries>
                        </Series>
                    </ext:Chart>
                </Items>
            </ext:Panel>
            <ext:Panel ID="Panel3" runat="server" Width="600" Height="300" Title="Trends, 2007"
                Layout="FitLayout">
                <Items>
                    <ext:Chart ID="Chart2" runat="server" InsetPadding="30">
                        <Store>
                            <ext:Store ID="Store2" runat="server" Data="<%# ExtNetApplication.Services.Products.GetProducts() %>"
                                AutoDataBind="true">
                                <Model>
                                    <ext:Model ID="Model2" runat="server">
                                        <Fields>
                                            <ext:ModelField Name="Name" />
                                            <ext:ModelField Name="Data2" />
                                        </Fields>
                                    </ext:Model>
                                </Model>
                            </ext:Store>
                        </Store>
                        <Axes>
                            <ext:NumericAxis Minimum="0" Maximum="100" Fields="Data2">
                                <Label Font="10px Arial">
                                    <Renderer Handler="return Ext.util.Format.number(value, '0,0');" />
                                </Label>
                            </ext:NumericAxis>
                            <ext:CategoryAxis Position="Bottom" Fields="Name">
                                <Label Font="11px Arial">
                                    <Renderer Handler="return value.substr(0, 3);" />
                                </Label>
                            </ext:CategoryAxis>
                        </Axes>
                        <Series>
                            <ext:LineSeries Axis="Left" XField="Name" YField="Data2">
                                <Listeners>
                                    <ItemMouseUp Handler="Ext.net.Notification.show({title:'Item Selected', html:item.value[1] + ' visits on ' + Ext.Date.monthNames[item.value[0]]});" />
                                </Listeners>
                                <Tips ID="Tips2" runat="server" TrackMouse="true" Width="110" Height="25">
                                    <Renderer Handler="this.setTitle(storeItem.get('Data2') + ' visits in ' + storeItem.get('Name').substr(0, 3));">
                                    </Renderer>
                                </Tips>
                                <Style Fill="#18428E" Stroke="#18428E" StrokeWidth="3" />
                                <MarkerConfig Type="Circle" Size="4" Radius="4" StrokeWidth="0" Fill="#18428E" Stroke="#18428E" />
                            </ext:LineSeries>
                        </Series>
                    </ext:Chart>
                </Items>
            </ext:Panel>
        </Items>
    </ext:Panel>
    </form>
</body>
</html>
