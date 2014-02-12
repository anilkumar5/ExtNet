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
</head>
<body>
    <form id="Form1" runat="server">
    <ext:ResourceManager runat="server" />
    <h1>
        Pie Chart Example</h1>
    <ext:Panel runat="server" Width="800" Height="600" Title="Semester Trends" Layout="FitLayout">
        <TopBar>
            <ext:Toolbar runat="server">
                <Items>
                    <ext:Button runat="server" Text="Reload Data" Icon="ArrowRefresh" OnDirectClick="ReloadData" />
                    <ext:Button runat="server" Text="Donut" EnableToggle="true">
                        <Listeners>
                            <Toggle Handler="#{Chart1}.series.first().donut = pressed ? 35 : false;#{Chart1}.refresh();" />
                        </Listeners>
                    </ext:Button>
                    <ext:Button runat="server" Text="Save Chart" Icon="Disk" Handler="saveChart" />
                </Items>
            </ext:Toolbar>
        </TopBar>
        <Items>
            <ext:Chart ID="Chart1" runat="server" Animate="true" Shadow="true" InsetPadding="60"
                Theme="Base:gradients">
                <LegendConfig Position="Right" />
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
    </form>
</body>
</html>
