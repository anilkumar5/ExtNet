<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridArrayWithPaging.aspx.cs"
    Inherits="ExtNetApplication.ExtForms.GridArrayWithPaging" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Simple Array Grid With Paging and Remote Reloading - Ext.NET Examples</title>
    <script>
        var template = '<span style="color:{0};">{1}</span>';

        var change = function (value) {
            return Ext.String.format(template, (value > 0) ? "green" : "red", value);
        };

        var pctChange = function (value) {
            return Ext.String.format(template, (value > 0) ? "green" : "red", value + "%");
        };
    </script>
</head>
<body>
    <form id="Form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" />
    <h1>
        Array Grid with Paging and Remote Reloading</h1>
    <p>
        Demonstrates how to create a grid from Array data with Local Paging and Remote Reloading.</p>
    <p>
        Notice <b>Last Updated</b> column is revised with a new server-side DateTime stamp
        when the GridPanel "Refresh" button is clicked.<br />
        This demonstrates that when the GridPanel is refreshed, the Data is requested again
        from the server via an DirectEvent, but the Paging and Sorting is done completely
        client-side in the browser.</p>
    <ext:GridPanel ID="GridPanel1" runat="server" Title="Array Grid" Width="700">
        <Store>
            <ext:Store ID="Store1" runat="server" OnReadData="MyData_Refresh" PageSize="10">
                <Model>
                    <ext:Model ID="Model1" runat="server">
                        <Fields>
                            <ext:ModelField Name="company" />
                            <ext:ModelField Name="price" Type="Float" />
                            <ext:ModelField Name="change" Type="Float" />
                            <ext:ModelField Name="pctChange" Type="Float" />
                            <ext:ModelField Name="lastChange" Type="Date" />
                        </Fields>
                    </ext:Model>
                </Model>
            </ext:Store>
        </Store>
        <ColumnModel ID="ColumnModel1" runat="server">
            <Columns>
                <ext:RowNumbererColumn ID="RowNumbererColumn1" runat="server" Width="35" />
                <ext:Column ID="Column1" runat="server" Text="Company" DataIndex="company" Flex="1" />
                <ext:Column ID="Column2" runat="server" Text="Price" Width="75" DataIndex="price">
                    <Renderer Format="UsMoney" />
                </ext:Column>
                <ext:Column ID="Column3" runat="server" Text="Change" Width="75" DataIndex="change">
                    <Renderer Fn="change" />
                </ext:Column>
                <ext:Column ID="Column4" runat="server" Text="Change" Width="75" DataIndex="pctChange">
                    <Renderer Fn="pctChange" />
                </ext:Column>
                <ext:DateColumn ID="DateColumn1" runat="server" Text="Last Updated" Width="85" DataIndex="lastChange"
                    Format="H:mm:ss" />
            </Columns>
        </ColumnModel>
        <SelectionModel>
            <ext:RowSelectionModel ID="RowSelectionModel1" runat="server" Mode="Multi" />
        </SelectionModel>
        <View>
            <ext:GridView ID="GridView1" runat="server" StripeRows="true" />
        </View>
        <BottomBar>
            <ext:PagingToolbar ID="PagingToolbar1" runat="server">
                <Items>
                    <ext:Label ID="Label1" runat="server" Text="Page size:" />
                    <ext:ToolbarSpacer ID="ToolbarSpacer1" runat="server" Width="10" />
                    <ext:ComboBox ID="ComboBox1" runat="server" Width="80">
                        <Items>
                            <ext:ListItem Text="1" />
                            <ext:ListItem Text="2" />
                            <ext:ListItem Text="10" />
                            <ext:ListItem Text="20" />
                        </Items>
                        <SelectedItems>
                            <ext:ListItem Value="10" />
                        </SelectedItems>
                        <Listeners>
                            <Select Handler="#{GridPanel1}.store.pageSize = parseInt(this.getValue(), 10); #{GridPanel1}.store.reload();" />
                        </Listeners>
                    </ext:ComboBox>
                </Items>
                <Plugins>
                    <ext:ProgressBarPager ID="ProgressBarPager1" runat="server" />
                </Plugins>
            </ext:PagingToolbar>
        </BottomBar>
        <TopBar>
            <ext:Toolbar ID="Toolbar1" runat="server">
                <Items>
                    <ext:Button ID="Button1" runat="server" Text="Print" Icon="Printer" Handler="this.up('grid').print();" />
                    <ext:Button ID="Button2" runat="server" Text="Print current grid page" Icon="Printer"
                        Handler="this.up('grid').print({currentPageOnly : true});" />
                </Items>
            </ext:Toolbar>
        </TopBar>
    </ext:GridPanel>
    </form>
</body>
</html>
