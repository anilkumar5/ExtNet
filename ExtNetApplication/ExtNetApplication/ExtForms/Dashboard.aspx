<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="ExtNetApplication.ExtForms.Dashboard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    <style>
        .x-grid-row-over .x-grid-cell-inner
        {
            font-weight: bold;
        }
    </style>
    <script>
        var template = '<span style="color:{0};">{1}</span>';

        var change = function (value) {
            return Ext.String.format(template, (value > 0) ? "green" : "red", value);
        };

        var pctChange = function (value) {
            return Ext.String.format(template, (value > 0) ? "green" : "red", value + "%");
        };
    </script>
    <style type="text/css">
        .divChart div
        {
            border: none !important;
            border-color: White !important;
        }
        h2
        {
            border-bottom: 2px solid;
            width: 95%;
            float: left;
        }
        .column100
        {
            width: 100%;
            float: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <ext:ResourceManager runat="server" />
        <ext:Toolbar runat="server">
            <Items>
                <ext:Button runat="server" Icon="ChartBarAdd" Text="Dashboard">
                </ext:Button>
            </Items>
        </ext:Toolbar>
        <ext:Toolbar ID="Toolbar1" runat="server">
            <Items>
                <ext:Button ID="Button1" runat="server" Icon="Add" />
                <ext:Button ID="Button2" runat="server" Icon="Reload" />
                <ext:Button ID="Button3" runat="server" Icon="Server" />
                <ext:ToolbarFill />
                <ext:ComboBox runat="server" Text="Select Day">
                    <Items>
                        <ext:ListItem Text="Item1" />
                        <ext:ListItem Text="Item2" />
                    </Items>
                </ext:ComboBox>
            </Items>
        </ext:Toolbar>
    </div>
    <div style="padding: 20px;height:100%;float:left;height:950px;" >
        <div class="column100">
            <div style="width: 50%; float: left;">
                <ext:Label runat="server" Style="float: left; position: relative; top: 20px;" Icon="ChartBar" />
                <h2>
                    RPO/RTO Compliance</h2>
                <div style="float: left" class="divChart">
                    <ext:Panel ID="Panel1" runat="server" Width="250" Height="300" Style="border-top: 1px solid;
                        float: left;" Layout="FitLayout">
                        <Items>
                            <ext:Chart ID="Chart1" runat="server" Animate="true" Shadow="true" InsetPadding="60"
                                Style="float: left;" Theme="Base:gradients">
                                <LegendConfig Position="Bottom" BoxStroke="1" />
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
                                        <Label Field="Name" Display="Rotate" Contrast="true" Font="10px Arial" />
                                        <Tips ID="Tips1" TrackMouse="true" Width="140" Height="28" runat="server">
                                            <Renderer Fn="tipRenderer" />
                                        </Tips>
                                    </ext:PieSeries>
                                </Series>
                            </ext:Chart>
                        </Items>
                    </ext:Panel>
                </div>
                <div style="float: left" class="divChart">
                    <ext:Panel ID="Panel2" runat="server" Width="250" Height="200" Layout="FitLayout">
                        <Items>
                            <ext:Chart ID="Chart2" runat="server" InsetPadding="30">
                                <Store>
                                    <ext:Store ID="Store2" runat="server" Data="<%# ExtNetApplication.Services.Products.GetBarProducts() %>"
                                        AutoDataBind="true">
                                        <Model>
                                            <ext:Model ID="Model2" runat="server">
                                                <Fields>
                                                    <ext:ModelField Name="Name" />
                                                    <ext:ModelField Name="Data1" />
                                                </Fields>
                                            </ext:Model>
                                        </Model>
                                    </ext:Store>
                                </Store>
                                <Axes>
                                    <ext:NumericAxis Minimum="0" Maximum="10" Fields="Data1">
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
                    <h3 style="padding-left: 45px;">
                        Compliance - Last 7 days
                    </h3>
                </div>
            </div>
            <div style="width: 50%; float: left;">
                <ext:Label ID="Label1" runat="server" Style="float: left; position: relative; top: 20px;"
                    Icon="Error" />
                <h2>
                    RPO/RTO Compliance</h2>
                <div style="float: left; margin-left: 25px;" class="">
                    <ext:GridPanel ID="GridPanel1" runat="server" Width="515" Height="150" Region="Center">
                        <Store>
                            <ext:Store ID="Store3" runat="server">
                                <Model>
                                    <ext:Model ID="Model3" runat="server">
                                        <Fields>
                                            <ext:ModelField Name="company" />
                                            <ext:ModelField Name="price" Type="Float" />
                                            <ext:ModelField Name="change" Type="Float" />
                                        </Fields>
                                    </ext:Model>
                                </Model>
                            </ext:Store>
                        </Store>
                        <ColumnModel>
                            <Columns>
                                <ext:Column ID="Column1" runat="server" Text="Job" DataIndex="company" Flex="1" />
                                <ext:Column ID="Column2" runat="server" Text="CRP Actual" DataIndex="price">
                                    <Renderer Format="UsMoney" />
                                </ext:Column>
                                <ext:Column ID="Column3" runat="server" Text="RT Actual" DataIndex="change">
                                    <Renderer Fn="change" />
                                </ext:Column>
                            </Columns>
                        </ColumnModel>
                        <SelectionModel>
                            <ext:RowSelectionModel ID="RowSelectionModel1" runat="server" />
                        </SelectionModel>
                    </ext:GridPanel>
                </div>
            </div>
        </div>
        <div class="column100">
            <div style="width: 50%; float: left;">
                <ext:Label ID="Label2" runat="server" Style="float: left; position: relative; top: 20px;"
                    Icon="ChartBar" />
                <h2>
                    Test Summary</h2>
                <div style="float: left" class="divChart">
                    <ext:Panel ID="Panel3" runat="server" Width="250" Height="200" Layout="FitLayout">
                        <Items>
                            <ext:Chart ID="Chart3" runat="server" InsetPadding="30">
                                <Store>
                                    <ext:Store ID="Store4" runat="server" Data="<%# ExtNetApplication.Services.Products.GetBarProducts() %>"
                                        AutoDataBind="true">
                                        <Model>
                                            <ext:Model ID="Model4" runat="server">
                                                <Fields>
                                                    <ext:ModelField Name="Name" />
                                                    <ext:ModelField Name="Data1" />
                                                </Fields>
                                            </ext:Model>
                                        </Model>
                                    </ext:Store>
                                </Store>
                                <Axes>
                                    <ext:NumericAxis Minimum="0" Maximum="10" Fields="Data1">
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
                                        <Tips ID="Tips2" runat="server" TrackMouse="true" Width="110" Height="25">
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
                     <h3 style="padding-left: 45px;">
                        Tests - Last 7 days
                    </h3>
                </div>
                <div style="float: left" class="divChart">
                    <ext:Panel ID="Panel4" runat="server" Width="250" Height="200" Layout="FitLayout">
                        <Items>
                            <ext:Chart ID="Chart4" runat="server" InsetPadding="30">
                                <Store>
                                    <ext:Store ID="Store5" runat="server" Data="<%# ExtNetApplication.Services.Products.GetBarProducts() %>"
                                        AutoDataBind="true">
                                        <Model>
                                            <ext:Model ID="Model5" runat="server">
                                                <Fields>
                                                    <ext:ModelField Name="Name" />
                                                    <ext:ModelField Name="Data1" />
                                                </Fields>
                                            </ext:Model>
                                        </Model>
                                    </ext:Store>
                                </Store>
                                <Axes>
                                    <ext:NumericAxis Minimum="0" Maximum="10" Fields="Data1">
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
                                        <Tips ID="Tips4" runat="server" TrackMouse="true" Width="110" Height="25">
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
                 <h3 style="padding-left: 45px;">
                        Transer Size - Last 7 days
                    </h3>
                </div>
            </div>
            <div style="width: 50%; float: left;">
                <ext:Label ID="Label3" runat="server" Style="float: left; position: relative; top: 20px;"
                    Icon="ChartBar" />
                <h2>
                    Recovery Summary</h2>
                <div style="float: left" class="divChart">
                    <ext:Panel ID="Panel5" runat="server" Width="250" Height="200" Layout="FitLayout">
                        <Items>
                            <ext:Chart ID="Chart5" runat="server" InsetPadding="30">
                                <Store>
                                    <ext:Store ID="Store6" runat="server" Data="<%# ExtNetApplication.Services.Products.GetBarProducts() %>"
                                        AutoDataBind="true">
                                        <Model>
                                            <ext:Model ID="Model6" runat="server">
                                                <Fields>
                                                    <ext:ModelField Name="Name" />
                                                    <ext:ModelField Name="Data1" />
                                                </Fields>
                                            </ext:Model>
                                        </Model>
                                    </ext:Store>
                                </Store>
                                <Axes>
                                    <ext:NumericAxis Minimum="0" Maximum="10" Fields="Data1">
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
                                        <Tips ID="Tips5" runat="server" TrackMouse="true" Width="110" Height="25">
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
                     <h3 style="padding-left: 45px;">
                        Recent Followers(12)
                    </h3>
                </div>
                <div style="float: left" class="divChart">
                    <ext:Panel ID="Panel6" runat="server" Width="250" Height="200" Layout="FitLayout">
                        <Items>
                            <ext:Chart ID="Chart6" runat="server" InsetPadding="30">
                                <Store>
                                    <ext:Store ID="Store7" runat="server" Data="<%# ExtNetApplication.Services.Products.GetBarProducts() %>"
                                        AutoDataBind="true">
                                        <Model>
                                            <ext:Model ID="Model7" runat="server">
                                                <Fields>
                                                    <ext:ModelField Name="Name" />
                                                    <ext:ModelField Name="Data1" />
                                                </Fields>
                                            </ext:Model>
                                        </Model>
                                    </ext:Store>
                                </Store>
                                <Axes>
                                    <ext:NumericAxis Minimum="0" Maximum="10" Fields="Data1">
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
                                        <Tips ID="Tips6" runat="server" TrackMouse="true" Width="110" Height="25">
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
                     <h3 style="padding-left: 45px;">
                        Active Followers(12)
                    </h3>
                </div>
            </div>
        </div>
        <div class="column100">
            <div style="width: 50%; float: left;">
                <ext:Label ID="Label4" runat="server" Style="float: left; position: relative; top: 20px;"
                    Icon="TransmitGo" />
                <h2>
                    Running Jobs(2)</h2>
                <div style="float: left; margin-left: 25px;" class="">
                    <ext:GridPanel ID="GridPanel2" runat="server" Width="515" Height="150" Region="Center">
                        <Store>
                            <ext:Store ID="Store8" runat="server">
                                <Model>
                                    <ext:Model ID="Model8" runat="server">
                                        <Fields>
                                            <ext:ModelField Name="company" />
                                            <ext:ModelField Name="price" Type="Float" />
                                            <ext:ModelField Name="change" Type="Float" />
                                        </Fields>
                                    </ext:Model>
                                </Model>
                            </ext:Store>
                        </Store>
                        <ColumnModel>
                            <Columns>
                                <ext:Column ID="Column4" runat="server" Text="Job" DataIndex="company" Flex="1" />
                                <ext:Column ID="Column5" runat="server" Text="CRP Actual" DataIndex="price">
                                    <Renderer Format="UsMoney" />
                                </ext:Column>
                                <ext:Column ID="Column6" runat="server" Text="RT Actual" DataIndex="change">
                                    <Renderer Fn="change" />
                                </ext:Column>
                            </Columns>
                        </ColumnModel>
                        <SelectionModel>
                            <ext:RowSelectionModel ID="RowSelectionModel2" runat="server" />
                        </SelectionModel>
                    </ext:GridPanel>
                </div>
            </div>
            <div style="width: 50%; float: left;">
                <ext:Label ID="Label5" runat="server" Style="float: left; position: relative; top: 20px;"
                    Icon="Error" />
                <h2>
                    Alerts</h2>
                <div style="float: left; margin-left: 25px;" class="">
                    <ext:GridPanel ID="GridPanel3" runat="server" Width="515" Height="150" Region="Center">
                        <Store>
                            <ext:Store ID="Store9" runat="server">
                                <Model>
                                    <ext:Model ID="Model9" runat="server">
                                        <Fields>
                                            <ext:ModelField Name="company" />
                                            <ext:ModelField Name="price" Type="Float" />
                                            <ext:ModelField Name="change" Type="Float" />
                                        </Fields>
                                    </ext:Model>
                                </Model>
                            </ext:Store>
                        </Store>
                        <ColumnModel>
                            <Columns>
                                <ext:Column ID="Column7" runat="server" Text="Job" DataIndex="company" Flex="1" />
                                <ext:Column ID="Column8" runat="server" Text="CRP Actual" DataIndex="price">
                                    <Renderer Format="UsMoney" />
                                </ext:Column>
                                <ext:Column ID="Column9" runat="server" Text="RT Actual" DataIndex="change">
                                    <Renderer Fn="change" />
                                </ext:Column>
                            </Columns>
                        </ColumnModel>
                        <SelectionModel>
                            <ext:RowSelectionModel ID="RowSelectionModel3" runat="server" />
                        </SelectionModel>
                    </ext:GridPanel>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
