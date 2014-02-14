<%@ Page Language="C#" Culture="en-CA" AutoEventWireup="true" CodeBehind="PieChart.aspx.cs"
    Inherits="ExtNetApplication.ExtForms.PieChart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<script runat="server">
   
</script>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Pie Chart - Ext.NET Examples</title>
    <script>
        var tipRenderer = function (storeItem, item) {
            //calculate percentage.
            var total = 0;

            App.Chart1.getStore().each(function (rec) {
                total += rec.get('TotalProduction');
            });

            this.setTitle(storeItem.get('Name') + ': ' + Math.round(storeItem.get('TotalProduction') / total * 100) + '%');
        };

        var saveChart = function (btn) {
            Ext.MessageBox.confirm('Confirm Download', 'Would you like to download the chart as an image?', function (choice) {
                if (choice == 'yes') {
                    btn.up('panel').down('chart').save({
                        type: 'image/png'
                    });
                }
            });
        };
    </script>
    <style type="text/css">
        div
        {
            border: none !important;
            border-color: White !important;
        }
        h2
        {
            border-bottom: 2px solid;
            width: 99%;
        }
    </style>
</head>
<body>
    <form id="Form1" runat="server">
    <ext:ResourceManager runat="server" />
    <div style="float: left">
        <h2>
            Pie Chart Example</h2>
        <ext:Panel runat="server" Width="500" Height="300" Style="border-top: 1px solid;
            float: left;" Layout="FitLayout">
            <TopBar>
                <ext:StatusBar runat="server" Text="test">
                </ext:StatusBar>
            </TopBar>
            <Items>
                <ext:Chart ID="Chart1" runat="server" Animate="true" Shadow="true" InsetPadding="60"
                    Style="float: left;" Theme="Base:gradients">
                    <LegendConfig Position="Bottom" BoxStroke="1" />
                    <Store>
                        <ext:Store runat="server" Data="<%# ExtNetApplication.Services.Products.GetProducts() %>"
                            AutoDataBind="true">
                            <Model>
                                <ext:Model runat="server">
                                    <Fields>
                                        <ext:ModelField Name="Name" />
                                        <ext:ModelField Name="TotalProduction" />
                                    </Fields>
                                </ext:Model>
                            </Model>
                        </ext:Store>
                    </Store>
                    <Series>
                        <ext:PieSeries AngleField="TotalProduction" ShowInLegend="true" Donut="0" Highlight="true"
                            HighlightSegmentMargin="20">
                            <Label Field="Name" Display="Rotate" Contrast="true" Font="18px Arial" />
                            <Tips TrackMouse="true" Width="140" Height="28" runat="server">
                                <Renderer Fn="tipRenderer" />
                            </Tips>
                        </ext:PieSeries>
                    </Series>
                </ext:Chart>
            </Items>
        </ext:Panel>
    </div>
    <div style="float: left">
        <h2>
            Pie Chart Example</h2>
        <ext:Panel ID="Panel2" runat="server" Width="500" Height="300" Style="border: none"
            Layout="FitLayout">
            <Items>
                <ext:Chart ID="Chart2" runat="server" Animate="true" Shadow="true" InsetPadding="60"
                    Theme="Base:gradients">
                    <LegendConfig Position="Bottom" />
                    <Store>
                        <ext:Store ID="Store1" runat="server" Data="<%# ExtNetApplication.Services.Products.GetProducts() %>"
                            AutoDataBind="true">
                            <Model>
                                <ext:Model ID="Model1" runat="server">
                                    <Fields>
                                        <ext:ModelField Name="Name" />
                                        <ext:ModelField Name="TotalProduction" />
                                    </Fields>
                                </ext:Model>
                            </Model>
                        </ext:Store>
                    </Store>
                    <Series>
                        <ext:PieSeries AngleField="TotalProduction" ShowInLegend="true" Donut="0" Highlight="true"
                            HighlightSegmentMargin="20">
                            <Label Field="Name" Display="Rotate" Contrast="true" Font="18px Arial" />
                            <Tips ID="Tips1" TrackMouse="true" Width="140" Height="28" runat="server">
                                <Renderer Fn="tipRenderer" />
                            </Tips>
                        </ext:PieSeries>
                    </Series>
                </ext:Chart>
            </Items>
        </ext:Panel>
    </div>
    </form>
</body>
</html>
