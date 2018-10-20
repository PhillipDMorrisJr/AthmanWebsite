<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Antham.Master" CodeBehind="ClientFeedback.aspx.cs" Inherits="AthmanPhillipMorris.ClientFeedback" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headerPlaceHolder" runat="server">
    <link rel="stylesheet" type="text/css" href="Styles\\Feedback.css"/>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="formPlaceHolder">
        <section>
            <asp:TextBox ID="tbxClientID" runat="server"></asp:TextBox>
            <asp:Button ID="btnClientID" runat="server" OnClick="findIncident_Click" Text="Find Incidents" CssClass="btnClientID"/>
        </section>
        <asp:ListBox ID="lbxClosedIncidents" runat="server" CssClass="Listbox" Height="293px"></asp:ListBox>
        <asp:SqlDataSource ID="sdsIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:Incidents %>" ProviderName="<%$ ConnectionStrings:Incidents.ProviderName %>" SelectCommand="SELECT * FROM [Incidents] WHERE ([DateClosed] IS NOT NULL)"></asp:SqlDataSource>
        <asp:Table runat="server">
            <asp:TableRow>
                <asp:TableCell>Service Time:</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:RadioButtonList ID="rblService" runat="server">
                        <asp:ListItem Value="1">Satisfied</asp:ListItem>
                        <asp:ListItem Value="2">Neither</asp:ListItem>
                        <asp:ListItem Value="3">Dissatisfied</asp:ListItem>
                    </asp:RadioButtonList>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="rfvService" runat="server" ControlToValidate="rblService" Display="Dynamic" EnableClientScript="False" CssClass="validator">Please choose.</asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Technical Efficiency:</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:RadioButtonList ID="rblEfficiency" runat="server">
                        <asp:ListItem Value="1">Satisfied</asp:ListItem>
                        <asp:ListItem Value="2">Neither</asp:ListItem>
                        <asp:ListItem Value="3">Dissatisfied</asp:ListItem>
                    </asp:RadioButtonList>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="rfvEfficiency" runat="server" ControlToValidate="rblEfficiency" Display="Dynamic" EnableClientScript="False" CssClass="validator">Please choose.</asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Problem Resolution:</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:RadioButtonList ID="rblProblem" runat="server">
                        <asp:ListItem Value="1">Satisfied</asp:ListItem>
                        <asp:ListItem Value="2">Neither</asp:ListItem>
                        <asp:ListItem Value="3">Dissatisfied</asp:ListItem>
                    </asp:RadioButtonList>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="rfvProblem" runat="server" ControlToValidate="rblProblem" Display="Dynamic" EnableClientScript="False" CssClass="validator">Please choose.</asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:TextBox ID="tbxAdditionalComments" runat="server" CssClass="tbxAdditionalComments" ></asp:TextBox>
        <asp:Table runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblContactUser" runat="server" Text="Do you wish to be contacted"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:CheckBox ID="cbxContact" runat="server" Text="Yes" AutoPostBack="True" Enabled="False" OnCheckedChanged="cbxContact_CheckedChanged" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:RadioButtonList ID="rblContact" runat="server" Enabled="False">
                        <asp:ListItem>Email</asp:ListItem>
                        <asp:ListItem>Phone</asp:ListItem>
                    </asp:RadioButtonList>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:CustomValidator ID="cvdContact" runat="server" Display="Dynamic" EnableClientScript="False" OnServerValidate="cvdContact_ServerValidate" CssClass="validator">Please choose</asp:CustomValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
</asp:Content>

