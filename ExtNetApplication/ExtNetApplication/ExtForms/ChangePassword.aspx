<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs"
    Inherits="ExtNetApplication.ExtForms.ChangePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style="width: 950px; margin: 0 auto;">
    <ext:ResourceManager runat="server" />
    <ext:FormPanel ID="formPanelOuter" runat="server" MarginSpec="0 auto" Width="950"
        Title="Change Your Password" Height="200">
        <Defaults>
            <ext:Parameter Name="Width" Value="500" />
            <%--<ext:Parameter Name="MarginSpec" Value="" />--%>
        </Defaults>
        <Items>
            <ext:FieldSet runat="server" MarginSpec="10 10 10 200" Padding="10">
                <Defaults>
                    <ext:Parameter Name="LabelWidth" Value="200" />
                </Defaults>
                <Items>
                    <ext:TextField ID="txtOldPassword" FieldLabel="Old Password" LabelWidth="200" runat="server"
                        IsRemoteValidation="true">
                        <RemoteValidation OnValidation="IsValidPassword" />
                    </ext:TextField>
                    <ext:TextField ID="txtNewPassword" FieldLabel="New Password" runat="server" />
                    <ext:TextField ID="txtConfirmNewPassword" FieldLabel="Confirm Password" runat="server"
                        IsRemoteValidation="true">
                        <RemoteValidation OnValidation="MatchPassword" />
                    </ext:TextField>
                    <ext:Label runat="server" ID="lblError" StyleSpec="color:red;" />
                </Items>
            </ext:FieldSet>
        </Items>
        <Buttons>
            <ext:Button runat="server" Text="Change" ID="ctl162">
                <Listeners>
                    <Click Handler="App.direct.ChangePasswords({
                success:function(result){  
               }
                })" />
                </Listeners>
            </ext:Button>
            <ext:Button runat="server" Text="Reset" ID="ctl164">
                <Listeners>
                    <Click Handler="this.up('form').getForm().reset();" />
                </Listeners>
            </ext:Button>
        </Buttons>
        <Listeners>
            <ValidityChange Handler="#{Button1}.setDisabled(!valid);" />
        </Listeners>
    </ext:FormPanel>
    </form>
</body>
</html>
