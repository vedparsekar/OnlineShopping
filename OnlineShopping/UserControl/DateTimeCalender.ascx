<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DateTimeCalender.ascx.cs" Inherits="OnlineShopping.UserControl.DateTimeCalender" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<ajax:ToolkitScriptManager ID="ToolkitScriptManager" runat="server"></ajax:ToolkitScriptManager>
<ajax:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtCalender"></ajax:CalendarExtender>
<asp:TextBox ID="txtCalender" runat="server"></asp:TextBox>