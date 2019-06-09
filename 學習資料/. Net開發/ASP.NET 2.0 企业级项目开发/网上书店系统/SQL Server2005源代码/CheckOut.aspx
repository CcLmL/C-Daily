<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CheckOut.aspx.cs" Inherits="CheckOut" Title="Untitled Page" %>

<%@ Register Src="controls/CartList.ascx" TagName="CartList" TagPrefix="uc4" %>

<%@ Register Src="controls/PayControl.ascx" TagName="PayControl" TagPrefix="uc2" %>
<%@ Register Src="controls/AddressConfirm.ascx" TagName="AddressConfirm" TagPrefix="uc3" %>

<%@ Register Src="controls/AddressForm.ascx" TagName="AddressForm" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" Height="247px" Width="575px" OnNextButtonClick="Wizard1_NextButtonClick" OnFinishButtonClick="Wizard1_FinishButtonClick">
        <WizardSteps>
            <asp:WizardStep runat="server" Title="帐户地址" ID="wzdStep1">
                <uc1:AddressForm ID="billingForm" runat="server">
                </uc1:AddressForm>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="送货地址" ID="wzdStep2">
                 <div class="checkOutLabel">
                     <asp:CheckBox ID="chkShipToBilling" runat="server" AutoPostBack="True" OnCheckedChanged="chkShipToBilling_CheckedChanged"
                        Text="与帐户地址相同" /></div>
                <uc1:AddressForm ID="shippingForm" runat="server" />
            </asp:WizardStep>
            <asp:WizardStep ID="wzdStep3" runat="server" Title="付款信息">
                <uc2:PayControl ID="PayControl1" runat="server" />
            </asp:WizardStep>
            <asp:WizardStep ID="wzdStep4" runat="server" Title="确认信息">
            <div>
            <strong>帐户地址:<br /></strong>
                <uc3:AddressConfirm ID="billingConfirm" runat="server">
                </uc3:AddressConfirm>
            <strong>送货地址:<br /></strong>
                <uc3:AddressConfirm ID="shippingConfirm" runat="server">
                </uc3:AddressConfirm>
             </div>
              <div class="checkOutLabel">
                                购物篮中金额总计： <span class="labelBold">
                                    <asp:Literal ID="ltlTotal" runat="server"></asp:Literal></span> <br />
              </div>
            </asp:WizardStep>
            <asp:WizardStep ID="wzdStep5" runat="server" Title="回执" AllowReturn="False" StepType="Complete">
                <uc4:CartList ID="CartListOrdered" runat="server">
                </uc4:CartList>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
</asp:Content>

