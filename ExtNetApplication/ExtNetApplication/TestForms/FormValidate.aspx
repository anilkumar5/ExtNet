<%@ Page Language="C#" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<script runat="server">
    protected void CheckField(object sender, RemoteValidationEventArgs e)
    {
        TextField field = (TextField)sender;

        if (field.Text == "Valid")
        {
            e.Success = true;
        }
        else
        {
            e.Success = false;
            e.ErrorMessage = "'Valid' is valid value only";
        }

        System.Threading.Thread.Sleep(1000);
    }

    protected void CheckCombo(object sender, RemoteValidationEventArgs e)
    {
        ComboBox combo = (ComboBox)sender;

        if (combo.SelectedItem.Value == "2")
        {
            e.Success = true;
        }
        else
        {
            e.Success = false;
            e.ErrorMessage = "'Valid' is valid value only";
        }

        System.Threading.Thread.Sleep(1000);
    }

    [DirectMethod]
    public object DirectCheckField(string value)
    {
        if (value == "Valid")
        {
            return true;
        }
        else
        {
            return "'Valid' is valid value only";
        }
    }
</script>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Remote Validation - Ext.NET Examples</title>
</head>
<body>
    <form id="Form1" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" />
    <ext:FormPanel ID="FormPanel1" runat="server" Title="Remote Validation Form" BodyPadding="5"
        Frame="true" Width="500" DefaultAnchor="100%">
        <FieldDefaults>
            <CustomConfig>
                <ext:ConfigItem Name="LabelWidth" Value="250" Mode="Raw" />
                <ext:ConfigItem Name="PreserveIndicatorIcon" Value="true" Mode="Raw" />
            </CustomConfig>
        </FieldDefaults>
        <Items>
            <ext:TextField ID="TextField1" runat="server" FieldLabel="No validation" />
            <ext:TextField ID="TextField2" runat="server" FieldLabel="Client only validation"
                AllowBlank="false" />
            <ext:TextField ID="TextField3" runat="server" FieldLabel="Server only validation"
                IsRemoteValidation="true">
                <RemoteValidation OnValidation="CheckField" />
            </ext:TextField>
            <ext:TextField ID="TextField4" runat="server" FieldLabel="DirectFn validation" IsRemoteValidation="true">
                <RemoteValidation DirectFn="App.direct.DirectCheckField" />
            </ext:TextField>
            <ext:TextField ID="TextField5" runat="server" FieldLabel="Client and server validation"
                IsRemoteValidation="true" AllowBlank="false">
                <RemoteValidation OnValidation="CheckField" />
            </ext:TextField>
            <ext:TextField ID="TextField6" runat="server" FieldLabel="Client and server validation (web service)"
                IsRemoteValidation="true" AllowBlank="false">
                <RemoteValidation Url="/RemoteServices/ValidationService.asmx/IsUserExist" Json="true" />
            </ext:TextField>
            <ext:ComboBox ID="ComboBox1" runat="server" AllowBlank="false" Editable="false" FieldLabel="ComboBox"
                IsRemoteValidation="true">
                <RemoteValidation OnValidation="CheckCombo" />
                <Items>
                    <ext:ListItem Text="Invalid" Value="1" />
                    <ext:ListItem Text="Valid" Value="2" />
                </Items>
            </ext:ComboBox>
        </Items>
        <Buttons>
            <ext:Button ID="Button1" runat="server" Text="Submit" Disabled="true" />
        </Buttons>
        <Listeners>
            <ValidityChange Handler="#{Button1}.setDisabled(!valid);" />
        </Listeners>
    </ext:FormPanel>
    </form>
</body>
</html>
