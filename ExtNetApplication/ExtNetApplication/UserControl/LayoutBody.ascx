<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LayoutBody.ascx.cs"
    Inherits="ExtNetApplication.UserControl.LayoutBody" %>
<ext:Viewport ID="Viewport1" runat="server" Layout="BorderLayout">
    <Items>
        <ext:TabPanel ID="TabPanel3" runat="server" Region="North">
            <Items>
                <ext:Panel ID="Panel10" runat="server" Title="System" Border="false" BodyPadding="0" />
            </Items>
        </ext:TabPanel>
        <ext:TabPanel ID="TabPanel2" runat="server" Region="North" Title="Save | Edit">
        </ext:TabPanel>
        <ext:Panel ID="Panel2" runat="server" Title="Jobs" Region="West" Layout="AccordionLayout"
            Width="225" MinWidth="225" MaxWidth="400" Split="true" Collapsible="true">
            <Items>
                <ext:Panel ID="Panel3" runat="server" Title="Jobs" Border="false" BodyPadding="6"
                    Icon="FolderGo">
                    <Items>
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
                    </Items>
                </ext:Panel>
                <ext:Panel ID="Panel1" runat="server" Title="Dashboard" Border="false" BodyPadding="6"
                    Icon="Table" Html="West" />
                <ext:Panel ID="Panel12" runat="server" Title="Jobs" Border="false" BodyPadding="6"
                    Icon="FolderGo" Html="West" />
                <ext:Panel ID="Panel13" runat="server" Title="Infrastructure" Border="false" BodyPadding="6"
                    Icon="FolderGo" Html="West" />
                <ext:Panel ID="Panel14" runat="server" Title="Organizations" Border="false" BodyPadding="6"
                    Icon="FolderGo" Html="West" />
                <ext:Panel ID="Panel15" runat="server" Title="Settings and options" Border="false"
                    BodyPadding="6" Icon="FolderGo" Html="West" />
                <ext:Panel ID="Panel16" runat="server" Title="Security" Border="false" BodyPadding="6"
                    Icon="FolderGo" Html="West" />
            </Items>
        </ext:Panel>
        <ext:TabPanel ID="TabPanel1" runat="server" Title="Agonjaelads" Region="Center" Icon="UserStar">
            <Items>
                <ext:Panel ID="Panel5" runat="server" Title="Summary" Border="false" BodyPadding="6"
                    Html="<h1>Viewport with BorderLayout</h1>" />
                <ext:Panel ID="Panel4" runat="server" Title="Virtual machines" Border="false" BodyPadding="6"
                    Html="<h1>Viewport with BorderLayout</h1>" />
                <ext:Panel ID="Panel17" runat="server" Title="History" Border="false" BodyPadding="6"
                    Html="<h1>Viewport with BorderLayout</h1>" />
                <ext:Panel ID="Panel6" runat="server" Title="Close Me" Closable="true" Border="false"
                    BodyPadding="6" Html="Closeable Tab" />
            </Items>
        </ext:TabPanel>
    </Items>
</ext:Viewport>

