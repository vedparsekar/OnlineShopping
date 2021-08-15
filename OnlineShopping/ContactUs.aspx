<%@ Page Title="" Language="C#" MasterPageFile="~/NavigationMaster.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="OnlineShopping.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-container cart-holder">
            <div class="main-content container">
                <div class="page-header-text">Contact Us</div>
            </div>
        <div class="main-container form-holder">
            <div class="main-content container">
                <div class="form-heder">
                    CONTACT US
                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtName" type="text" placeholder="Enter Name" class="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtEmail" type="text" placeholder="Enter Email" class="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <textarea id="txtMessage" placeholder="Message" class="form-control" rows="1" cols="20"></textarea>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblError" runat="server" class="form-control" ForeColor="Red"></asp:Label>
                </div>

                <div classname="btn-holder mb-4">
                    <asp:Button ID="btnSubmit" runat="server" Text="SEND" class="w-100 btn btn-primary" />
                </div>

            </div>
        </div>
        </div>
    
</asp:Content>
