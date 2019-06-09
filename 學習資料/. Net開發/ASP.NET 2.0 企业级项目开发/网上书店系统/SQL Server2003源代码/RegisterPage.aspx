<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterPage.aspx.cs" Inherits="RegisterPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" BackColor="#F7F7DE" BorderColor="#CCCC99"
            BorderStyle="Solid" BorderWidth="1px" ContinueButtonText="完成" ContinueDestinationPageUrl="~/Login.aspx"
            DisplaySideBar="True" Font-Names="Verdana" Font-Size="10pt" Height="299px" OnContinueButtonClick="CreateUserWizard1_ContinueButtonClick"
            Width="386px">
            <WizardSteps>
                <asp:CreateUserWizardStep runat="server">
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep runat="server">
                </asp:CompleteWizardStep>
            </WizardSteps>
            <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top" />
            <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
            <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="#FFFFFF" />
            <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" HorizontalAlign="Center" />
            <CreateUserButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
            <ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid"
                BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
            <StepStyle BorderWidth="0px" />
        </asp:CreateUserWizard>
    
    </div>
    </form>
</body>
</html>
