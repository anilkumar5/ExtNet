<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs"
    Inherits="ExtNetApplication.ExtForms.ChangePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <ext:FieldSet runat="server" Title="Change Password">
            <Items>
                <ext:TextField ID="txtOldPassword" FieldLabel="Old Password" runat="server" />
                <ext:TextField ID="txtNewPassword" FieldLabel="New Password" runat="server" />
                <ext:TextField ID="txtConfirmPassword" FieldLabel="Confirm Password" runat="server"
                    IsRemoteValidation="true">
                    <RemoteValidation OnValidation="MatchPassword">
                    </RemoteValidation>
                </ext:TextField>
                <ext:Button Text="Change Password" ID="btnChangePassword" runat="server">
                    <Listeners>
                        <Click Handler="App.direct.ChangeUserPassword({
                success:function(result){  
                Ext.Msg.alert('Message', result);
                }
                })" />
                    </Listeners>
                </ext:Button>
            </Items>
            <Listeners>
                <validitychange handler="#{btnChangePassword}.setDisabled(!valid);" />
            </Listeners>
        </ext:FieldSet>
    </div>
    </form>
</body>
</html>
