<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchFilter.aspx.cs" Inherits="ExtNetApplication.SearchFilter" %>

<%@ Import Namespace="System.Collections.Generic" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<script runat="server">
    
</script>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Tree Filter - Ext.NET Examples</title>
    <script>
        var filterTree = function (tf, e) {
            var tree = App.TreePanel1,
                text = tf.getRawValue();

            tree.clearFilter();

            if (Ext.isEmpty(text, false)) {
                return;
            }

            if (e.getKey() === Ext.EventObject.ESC) {
                clearFilter();
            } else {
                var re = new RegExp(".*" + text + ".*", "i");

                tree.filterBy(function (node) {
                    return re.test(node.data.text);
                });
            }
        };

        var clearFilter = function () {

            var field = App.TriggerField1,
                tree = App.TreePanel1;

            field.setValue("");
            tree.clearFilter(true);
            tree.getView().focus();
        };
    </script>
</head>
<body>
    <form id="Form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" />
    <h1>
        Tree Filter</h1>
    <ext:TreePanel ID="TreePanel1" runat="server" Height="300" Width="250" UseArrows="true">
        <TopBar>
            <ext:Toolbar ID="Toolbar1" runat="server">
                <Items>
                    <ext:ToolbarTextItem ID="ToolbarTextItem1" runat="server" Text="Filter:" />
                    <ext:ToolbarSpacer />
                    <ext:TriggerField ID="TriggerField1" runat="server" EnableKeyEvents="true">
                        <Triggers>
                            <ext:FieldTrigger Icon="Clear" />
                        </Triggers>
                        <Listeners>
                            <KeyUp Fn="filterTree" Buffer="250" />
                            <TriggerClick Handler="clearFilter();" />
                        </Listeners>
                    </ext:TriggerField>
                </Items>
            </ext:Toolbar>
        </TopBar>
        <Root>
            <ext:Node Text="All jobs" Expanded="true">
                <Children>
                    <ext:Node Text="Beethoven" Icon="UserGray">
                        <Children>
                            <ext:Node Text="Concertos">
                                <Children>
                                    <ext:Node Text="No. 1 - C" Icon="Music" Leaf="true" />
                                    <ext:Node Text="No. 2 - B-Flat Major" Icon="Music" Leaf="true" />
                                    <ext:Node Text="No. 3 - C Minor" Icon="Music" Leaf="true" />
                                    <ext:Node Text="No. 4 - G Major" Icon="Music" Leaf="true" />
                                    <ext:Node Text="No. 5 - E-Flat Major" Icon="Music" Leaf="true" />
                                </Children>
                            </ext:Node>
                            <ext:Node Text="Quartets">
                                <Children>
                                    <ext:Node Text="Six String Quartets" Icon="Music" Leaf="true" />
                                    <ext:Node Text="Three String Quartets" Icon="Music" Leaf="true" />
                                    <ext:Node Text="Grosse Fugue for String Quartets" Icon="Music" Leaf="true" />
                                </Children>
                            </ext:Node>
                            <ext:Node Text="Sonatas">
                                <Children>
                                    <ext:Node Text="Sonata in A Minor" Icon="Music" Leaf="true" />
                                    <ext:Node Text="sonata in F Major" Icon="Music" Leaf="true" />
                                </Children>
                            </ext:Node>
                            <ext:Node Text="Symphonies">
                                <Children>
                                    <ext:Node Text="No. 1 - C Major" Icon="Music" Leaf="true" />
                                    <ext:Node Text="No. 2 - D Major" Icon="Music" Leaf="true" />
                                    <ext:Node Text="No. 3 - E-Flat Major" Icon="Music" Leaf="true" />
                                    <ext:Node Text="No. 4 - B-Flat Major" Icon="Music" Leaf="true" />
                                    <ext:Node Text="No. 5 - C Minor" Icon="Music" Leaf="true" />
                                    <ext:Node Text="No. 6 - F Major" Icon="Music" Leaf="true" />
                                    <ext:Node Text="No. 7 - A Major" Icon="Music" Leaf="true" />
                                    <ext:Node Text="No. 8 - F Major" Icon="Music" Leaf="true" />
                                    <ext:Node Text="No. 9 - D Minor" Icon="Music" Leaf="true" />
                                </Children>
                            </ext:Node>
                        </Children>
                    </ext:Node>
                    <ext:Node Text="Brahms" Icon="UserGray">
                        <Children>
                            <ext:Node Text="Concertos">
                                <Children>
                                    <ext:Node Text="Violin Concerto" Icon="Music" Leaf="true" />
                                    <ext:Node Text="Double Concerto - A Minor" Icon="Music" Leaf="true" />
                                    <ext:Node Text="Piano Concerto No. 1 - D Minor" Icon="Music" Leaf="true" />
                                    <ext:Node Text="Piano Concerto No. 2 - B-Flat Major" Icon="Music" Leaf="true" />
                                </Children>
                            </ext:Node>
                            <ext:Node Text="Quartets">
                                <Children>
                                    <ext:Node Text="Piano Quartet No. 1 - G Minor" Icon="Music" Leaf="true" />
                                    <ext:Node Text="Piano Quartet No. 2 - A Major" Icon="Music" Leaf="true" />
                                    <ext:Node Text="Piano Quartet No. 3 - C Minor" Icon="Music" Leaf="true" />
                                    <ext:Node Text="Piano Quartet No. 3 - B-Flat Minor" Icon="Music" Leaf="true" />
                                </Children>
                            </ext:Node>
                            <ext:Node Text="Sonatas">
                                <Children>
                                    <ext:Node Text="Two Sonatas for Clarinet - F Minor" Icon="Music" Leaf="true" />
                                    <ext:Node Text="Two Sonatas for Clarinet - E-Flat Major" Icon="Music" Leaf="true" />
                                </Children>
                            </ext:Node>
                            <ext:Node Text="Symphonies">
                                <Children>
                                    <ext:Node Text="No. 1 - C Minor" Icon="Music" Leaf="true" />
                                    <ext:Node Text="No. 2 - D Minor" Icon="Music" Leaf="true" />
                                    <ext:Node Text="No. 3 - F Major" Icon="Music" Leaf="true" />
                                    <ext:Node Text="No. 4 - E Minor" Icon="Music" Leaf="true" />
                                </Children>
                            </ext:Node>
                        </Children>
                    </ext:Node>
                    <ext:Node Text="Mozart" Icon="UserGray">
                        <Children>
                            <ext:Node Text="Concertos">
                                <Children>
                                    <ext:Node Text="Piano Concerto No. 12" Icon="Music" Leaf="true" />
                                    <ext:Node Text="Piano Concerto No. 17" Icon="Music" Leaf="true" />
                                    <ext:Node Text="Clarinet Concerto" Icon="Music" Leaf="true" />
                                    <ext:Node Text="Violin Concerto No. 5" Icon="Music" Leaf="true" />
                                    <ext:Node Text="Violin Concerto No. 4" Icon="Music" Leaf="true" />
                                </Children>
                            </ext:Node>
                        </Children>
                    </ext:Node>
                </Children>
            </ext:Node>
        </Root>
        <BottomBar>
            <ext:StatusBar ID="StatusBar1" runat="server" AutoClear="1500" />
        </BottomBar>
        <Listeners>
            <ItemClick Handler="#{StatusBar1}.setStatus({text: 'Node Selected: <b>' + record.data.text + '<br />', clear: false});" />
            <ItemExpand Handler="#{StatusBar1}.setStatus({text: 'Node Expanded: <b>' + item.data.text + '<br />', clear: false});"
                Buffer="30" />
            <ItemCollapse Handler="#{StatusBar1}.setStatus({text: 'Node Collapsed: <b>' + item.data.text + '<br />', clear: false});"
                Buffer="30" />
        </Listeners>
    </ext:TreePanel>
    </form>
</body>
</html>
