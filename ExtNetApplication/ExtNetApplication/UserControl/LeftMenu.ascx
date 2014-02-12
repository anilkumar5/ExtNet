<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftMenu.ascx.cs" Inherits="ExtNetApplication.UserControl.LeftMenu" %>
<ext:Viewport ID="Viewport1" runat="server" Layout="BorderLayout" ApplyTo="divLeft">
    <Items>
        <ext:Panel ID="Panel2" runat="server" Title="West" Region="West" Layout="AccordionLayout"
            Width="225" MinWidth="225" MaxWidth="400" Split="true" Collapsible="true">
            <Items>
                <ext:Panel ID="Panel3" runat="server" Title="Navigation" Border="false" BodyPadding="6"
                    Icon="FolderGo" Html="West" />
                <ext:Panel ID="Panel4" runat="server" Title="Settings" Border="false" BodyPadding="6"
                    Icon="FolderWrench" Html="Some settings in here" />
            </Items>
        </ext:Panel>
    </Items>
</ext:Viewport>
