<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataViewGrouping.aspx.cs"
    Inherits="ExtNetApplication.TestForms.DataViewGrouping" %>

<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="System.Xml.Linq" %>
<%@ Import Namespace="ExtNetApplication.Services" %>
>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!X.IsAjaxRequest)
        {
            XElement document = XElement.Load(Server.MapPath("~/Resources/DashboardSchema.xml"));
            string defaultIcon = document.Attribute("defaultIcon") != null ? document.Attribute("defaultIcon").Value : "";

            IEnumerable<object> query = from g in document.Elements("group")
                                        select new
                                        {
                                            Title = g.Attribute("title") != null ? g.Attribute("title").Value : "",
                                            Items = (from i in g.Elements("item")
                                                     select new
                                                     {
                                                         Title = i.Element("title") != null ? i.Element("title").Value : "",
                                                         Icon = i.Element("item-icon") != null ? i.Element("item-icon").Value : defaultIcon,
                                                         Id = i.Element("id") != null ? i.Element("id").Value : ""
                                                     }
                                                )
                                        };


            this.Store1.DataSource = query;
            this.Store1.DataBind();
        }
    }
</script>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Grouping DataView - Ext.NET Examples</title>
    <link href="Css/TestSite.css" rel="stylesheet" type="text/css" />
    <script>
        var itemClick = function (view, record, item, index, e) {
            var group = e.getTarget("h2", 3, true);

            if (group) {
                group.up("div").toggleCls("collapsed");
                return false;
            }

            var item = e.getTarget(".item-wrap");
            if (item) {
                Ext.Msg.alert("Click", "The node with id='" + item.id + "' has been clicked");
            }
        };
    </script>
</head>
<body>
    <form id="Form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" />
    <h1>
        Grouping DataView Example</h1>
    <ext:DataView ID="Dashboard" runat="server" SingleSelect="true" ItemSelector="div.group-header"
        EmptyText="No items to display">
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
								<div class="group-header">
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
									</div>

                                    <div class="group-header">
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
									</div>
								</div>
            </Html>
        </Tpl>
        <Listeners>
            <ItemClick Fn="itemClick" />
            <Refresh Handler="this.el.select('.item-wrap').addClsOnOver('x-view-over');" Delay="100" />
        </Listeners>
    </ext:DataView>


    <div class="divPanel">
    <ext:Chart></ext:Chart>
    </div>
    </form>
</body>
</html>
