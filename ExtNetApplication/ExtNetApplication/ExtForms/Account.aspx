<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="ExtNetApplication.ExtForms.Account" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>FormPanel - Ext.NET Examples</title>
   <%-- <script type="text/javascript">
        var template = '<span style="color:{0};">{1}</span>';

        var change = function (value) {
            return Ext.String.format(template, (value > 0) ? "green" : "red", value);
        };

        var pctChange = function (value) {
            return Ext.String.format(template, (value > 0) ? "green" : "red", value + "%");
        };
    </script>--%>
</head>
<body>
    <div style="width: 950px; margin: 0 auto;">
        <form id="Form1" runat="server">
        <ext:ResourceManager ID="ResourceManager1" runat="server" />
        <ext:FormPanel ID="FormPanel1" runat="server" Title="Your Account Information" Width="800" MarginSpec="0 auto"
            PaddingSpec="0 100 0 0" BodyPadding="5" Layout="ColumnLayout">
            <FieldDefaults LabelAlign="Left" MsgTarget="Side" />
            <Items>
                <ext:FieldSet ID="FieldSet1" runat="server" Title="Company details" Width="400" MarginSpec="0 0 0 130"
                    ButtonAlign="Right">
                    <Defaults>
                        <ext:Parameter Name="Width" Value="300" />
                        <ext:Parameter Name="LabelWidth" Value="150" />
                    </Defaults>
                    <Items>
                        <ext:TextField ID="txtUser" Name="company" runat="server" FieldLabel="User Name"
                            IsRemoteValidation="true" AllowBlank="false">
                            <RemoteValidation Url="/RemoteServices/ValidationService.asmx/IsUserExist" Json="true" />
                        </ext:TextField>
                        <ext:TextField ID="txtFirstName" Name="firstName" runat="server" FieldLabel="First Name" AllowBlank="false"
                            IsRemoteValidation="true">
                            <RemoteValidation OnValidation="ValidateControl" />
                        </ext:TextField>
                        <ext:TextField ID="txtLastName" Name="lastName" runat="server" FieldLabel="Last Name" />
                        <ext:TextField ID="txtEmail" Name="email" runat="server" FieldLabel="Email" />
                        <ext:TextField ID="txtPassword" Name="password" runat="server" FieldLabel="Password" AllowBlank="false" />
                        <ext:TextField ID="txtConfirmPassword" runat="server" FieldLabel="Confirm Password" AllowBlank="false"
                            IsRemoteValidation="true" ColumnsNumber="3" AutomaticGrouping="false">
                            <RemoteValidation OnValidation="MatchPassword" />
                        </ext:TextField>
                    </Items>
                </ext:FieldSet>
                <ext:Label Text="&nbsp;&nbsp;OR&nbsp;&nbsp;" runat="server" />
                <ext:HyperLink NavigateUrl="~/ExtForms/Login.aspx" runat="server" Text="Login" />
            </Items>
            <Buttons>
                <ext:Button ID="Button1" runat="server" Text="Save">
                    <Listeners>
                        <Click Handler="App.direct.RegisterUser({
                success:function(result){  
                Ext.Msg.alert('Message', result);
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
