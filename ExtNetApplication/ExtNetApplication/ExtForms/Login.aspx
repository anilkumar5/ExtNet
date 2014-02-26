<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ExtNetApplication.ExtForms.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div style="width: 950px; margin: 0 auto;">
        <form id="Form1" runat="server">
        <ext:ResourceManager ID="ResourceManager1" runat="server" />
        <ext:FormPanel ID="FormPanel1" runat="server" Title="Your Account Information" Width="800"
            Height="200" MarginSpec="0 auto" PaddingSpec="0 100 0 0" BodyPadding="5" Layout="ColumnLayout">
            <FieldDefaults LabelAlign="Left" MsgTarget="Side" />
            <Items>
                <ext:FieldSet ID="FieldSet1" runat="server" Title="Login Details" Width="400" MarginSpec="0 0 0 130"
                    ButtonAlign="Right">
                    <Defaults>
                        <ext:Parameter Name="Width" Value="300" />
                        <ext:Parameter Name="LabelWidth" Value="150" />
                    </Defaults>
                    <Items>
                        <ext:TextField ID="txtUserName" Name="userName" runat="server" FieldLabel="UserName"
                            IsRemoteValidation="true">
                            <RemoteValidation OnValidation="ValidateControl" />
                        </ext:TextField>
                        <ext:TextField ID="txtPassword" Name="password" runat="server" FieldLabel="Password"
                            IsRemoteValidation="true">
                            <RemoteValidation OnValidation="ValidateControl" />
                        </ext:TextField>
                        <ext:Label runat="server" Hidden="true" ID="labelError" />
                        <ext:LinkButton runat="server" Text="Create new account">
                        <Listeners>
                         <Click Handler="App.direct.RedirectToRegister({
                success:function(result){  
               }
                })" />
                        </Listeners>
                        </ext:LinkButton>
                    </Items>
                </ext:FieldSet>
            </Items>
            <Buttons>
                <ext:Button ID="Button1" runat="server" Text="Login">
                    <Listeners>
                        <Click Handler="App.direct.LoginUser({
                success:function(result){  
               }
                })" />
                    </Listeners>
                </ext:Button>
                <ext:Button ID="Button2" runat="server" Text="Reset Fields">
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
    </div>
</body>
</html>
