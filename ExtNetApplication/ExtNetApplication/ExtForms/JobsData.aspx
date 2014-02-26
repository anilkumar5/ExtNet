<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobsData.aspx.cs" Inherits="ExtNetApplication.ExtForms.JobsData" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="/Styles/Master.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/Master.js" type="text/javascript">
    </script>
    <style>
        .x-grid-row-over .x-grid-cell-inner
        {
            font-weight: bold;
        }
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
    </style>
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
    <div id="elm1" style="padding: 20px; height: 750px;">
        <div class="col100">
            <div class="col50">
                <ext:Label ID="Label2" runat="server" Style="float: left; position: relative; top: 20px;"
                    Icon="ChartBar">
                </ext:Label>
                <h2>
                    Job Name
                </h2>
                <ext:DataView ID="Dashboard" runat="server" SingleSelect="true" ItemSelector="div.group-header"
                    EmptyText="">
                    <Store>
                        <ext:Store ID="Store1" runat="server">
                            <Model>
                                <ext:Model ID="Model1" runat="server">
                                    <Fields>
                                        <ext:ModelField Name="Title" />
                                        <ext:ModelField Name="Items" Type="Object" />
                                    </Fields>
                                </ext:Model>
                            </Model>
                        </ext:Store>
                    </Store>
                    <Tpl ID="Tpl1" runat="server">
                        <Html>
                            <div id="items-ct">
								<div class="group-header float-left">
                                 
										<dl>
											<tpl>
												<%--<div class="item-wrap">
													<div>
														<H6>Title</H6> 
                                                        
													</div>
												</div>--%>
                                                <table class="col100">
                                                
                                                <tr><td style="width:50%">Protection Status</td><td>Value</td></tr>
                                                <tr><td>Service Profile</td><td>Value</td></tr>
                                                <tr><td>Recovery Points</td><td>Value</td></tr>
                                                <tr><td>Status</td><td>Value</td></tr>
                                                <tr><td>Location</td><td>Value</td></tr>
                                                <tr><td>Next Run Time</td><td>Value</td></tr>
                                               
                                                </table>
											</tpl>
											<div style="clear:left"></div>
										 </dl>
									</div>

                                   <%-- <div class="group-header">
										<h2><div>Menu</div></h2>
										<dl>
											<tpl>
												<div class="item-wrap">
													<div>
														<H6>Title</H6> 
                                                        
													</div>
												</div>
											</tpl>
											<div style="clear:left"></div>
										 </dl>
									</div>--%>
								</div>
                        </Html>
                    </Tpl>
                    <Listeners>
                        <%--<ItemClick Fn="itemClick" />--%>
                        <Refresh Handler="this.el.select('.item-wrap').addClsOnOver('x-view-over');" Delay="100" />
                    </Listeners>
                </ext:DataView>
            </div>
            <div style="width: 50%; float: left;">
                <ext:Label ID="Label1" runat="server" Style="float: left; position: relative; top: 20px;"
                    Icon="ChartBar" />
                <h2>
                    Test Summary</h2>
                <div style="float: left" class="divChart">
                    <ext:Panel ID="Panel1" runat="server" Width="250" Height="300" Style="border-top: 1px solid;
                        float: left;" Layout="FitLayout">
                        <Items>
                            <ext:Chart ID="Chart1" runat="server" Animate="true" Shadow="true" InsetPadding="60"
                                Style="float: left;" Theme="Base:gradients">
                                <LegendConfig Position="Bottom" BoxStroke="1" />
                                <Store>
                                    <ext:Store ID="Store2" runat="server" Data="<%# ExtNetApplication.Services.Products.GetProducts() %>"
                                        AutoDataBind="true">
                                        <Model>
                                            <ext:Model ID="Model2" runat="server">
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
                                    <ext:Store ID="Store3" runat="server" Data="<%# ExtNetApplication.Services.Products.GetBarProducts() %>"
                                        AutoDataBind="true">
                                        <Model>
                                            <ext:Model ID="Model3" runat="server">
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
                        Transer Size - Last 7 days - HBR
                    </h3>
                </div>
            </div>
        </div>
        <div class="col100">
            <div class="col100">
                <h2 style="width: 99%;">
                    <ext:Label ID="Label4" runat="server" 
                        Icon="ChartBar">
                    </ext:Label>
                    Virtual Resources
                    <ext:Button ID="Button1" Icon="Pencil" Text="Edit.." runat="server" Region="East"
                        Style="float: right">
                    </ext:Button>
                </h2>
            </div>
            <div class="col50">
                <ext:Label ID="Label3" runat="server" Style="float: left; position: relative; top: 20px;"
                    Icon="ChartBar">
                </ext:Label>
                <h2>
                    Primary
                </h2>
                <ext:DataView ID="DataView1" runat="server" SingleSelect="true" ItemSelector="div.group-header"
                    EmptyText="">
                    <Store>
                        <ext:Store ID="Store4" runat="server">
                            <Model>
                                <ext:Model ID="Model4" runat="server">
                                    <Fields>
                                        <ext:ModelField Name="Title" />
                                        <ext:ModelField Name="Items" Type="Object" />
                                    </Fields>
                                </ext:Model>
                            </Model>
                        </ext:Store>
                    </Store>
                    <Tpl ID="Tpl2" runat="server">
                        <Html>
                            <div id="items-ct">
								<div class="group-header float-left">
                                 
										<dl>
											<tpl>
												<%--<div class="item-wrap">
													<div>
														<H6>Title</H6> 
                                                        
													</div>
												</div>--%>
                                                <table class="col100">
                                                
                                                <tr><td style="width:50%">Server</td><td>Value</td></tr>
                                                <tr><td>Compute</td><td>Value</td></tr>
                                                <tr><td>Folder</td><td>Value</td></tr>
                                                <tr><td>Data Store</td><td>Value</td></tr>
                                                <tr><td>Network</td><td>Value</td></tr>
                                                <tr><td>Test Network</td><td>Value</td></tr>
                                               
                                                </table>
											</tpl>
											<div style="clear:left"></div>
										 </dl>
									</div>

                                   <%-- <div class="group-header">
										<h2><div>Menu</div></h2>
										<dl>
											<tpl>
												<div class="item-wrap">
													<div>
														<H6>Title</H6> 
                                                        
													</div>
												</div>
											</tpl>
											<div style="clear:left"></div>
										 </dl>
									</div>--%>
								</div>
                        </Html>
                    </Tpl>
                    <Listeners>
                        <%--<ItemClick Fn="itemClick" />--%>
                        <Refresh Handler="this.el.select('.item-wrap').addClsOnOver('x-view-over');" Delay="100" />
                    </Listeners>
                </ext:DataView>
            </div>
            <div class="col50">
                <ext:Label ID="Label5" runat="server" Style="float: left; position: relative; top: 20px;"
                    Icon="ChartBar">
                </ext:Label>
                <h2>
                    Secondary
                </h2>
                <ext:DataView ID="DataView2" runat="server" SingleSelect="true" ItemSelector="div.group-header"
                    EmptyText="">
                    <Store>
                        <ext:Store ID="Store5" runat="server">
                            <Model>
                                <ext:Model ID="Model5" runat="server">
                                    <Fields>
                                        <ext:ModelField Name="Title" />
                                        <ext:ModelField Name="Items" Type="Object" />
                                    </Fields>
                                </ext:Model>
                            </Model>
                        </ext:Store>
                    </Store>
                    <Tpl ID="Tpl3" runat="server">
                        <Html>
                            <div id="items-ct">
								<div class="group-header float-left">
                                 
										<dl>
											<tpl>
												<%--<div class="item-wrap">
													<div>
														<H6>Title</H6> 
                                                        
													</div>
												</div>--%>
                                                <table class="col100">
                                                
                                                 <tr><td style="width:50%">Server</td><td>Value</td></tr>
                                                <tr><td>Compute</td><td>Value</td></tr>
                                                <tr><td>Folder</td><td>Value</td></tr>
                                                <tr><td>Data Store</td><td>Value</td></tr>
                                                <tr><td>Network</td><td>Value</td></tr>
                                                <tr><td>Test Network</td><td>Value</td></tr>
                                               
                                                </table>
											</tpl>
											<div style="clear:left"></div>
										 </dl>
									</div>

                                   <%-- <div class="group-header">
										<h2><div>Menu</div></h2>
										<dl>
											<tpl>
												<div class="item-wrap">
													<div>
														<H6>Title</H6> 
                                                        
													</div>
												</div>
											</tpl>
											<div style="clear:left"></div>
										 </dl>
									</div>--%>
								</div>
                        </Html>
                    </Tpl>
                    <Listeners>
                        <%--<ItemClick Fn="itemClick" />--%>
                        <Refresh Handler="this.el.select('.item-wrap').addClsOnOver('x-view-over');" Delay="100" />
                    </Listeners>
                </ext:DataView>
            </div>
        </div>
    </div>
    <div id="elm2">
        test</div>
    <div id="elm3">
        History</div>
</body>
</html>
