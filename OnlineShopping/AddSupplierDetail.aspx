<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSupplierDetail.aspx.cs" Inherits="OnlineShopping.AddSupplierDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Style/style.css" rel="stylesheet" />
    <link href="Style/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="header-holder">
            <div class="header-content container">
                <div class="header-logo">
                    <a href="Index.aspx">
                        <img src="Images/logo1.png" style="width: 110px" /></a>
                </div>

                <div class="header-menu d-flex highlight">
                    <div class="menu-item">
                        <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click"> <i class="fa fa-power-off" aria-hidden="true"></i> Logout</asp:LinkButton>
                    </div>

                </div>
            </div>
        </div>
         <div class="tabs-holder">
            <asp:LinkButton ID="btnHome" class="tab" runat="server" OnClick="btnHome_Click">Home</asp:LinkButton>
            <asp:LinkButton ID="btnAddProduct" class="tab" runat="server" OnClick="btnAddProduct_Click">Add Products</asp:LinkButton>
            <asp:LinkButton ID="btnAddCategory" class="tab" runat="server" OnClick="btnAddCategory_Click">Add Category</asp:LinkButton>
            <asp:LinkButton ID="btnAddSupplier" class="tab active" runat="server" OnClick="btnAddSupplier_Click">Add Supplier</asp:LinkButton>
        </div>
        <div class="main-container form-holder">
            <div class="main-content container">
                <div class="form-heder">
                    ADD SUPPLIER
                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtSupplierId" type="text" placeholder="Enter Supplier ID" class="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtSupplierName" type="text" placeholder="Enter Supplier Name" class="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtSupplierGroup" type="text" placeholder="Enter Supplier Group" class="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtSupplierPassword" type="text" placeholder="Enter Password" class="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblError" runat="server" class="form-control" ForeColor="Red"></asp:Label>
                </div>

                <div classname="btn-holder mb-4">
                    <asp:Button ID="btnSubmit" runat="server" Text="ADD SUPPLIER" class="w-100 btn btn-primary" OnClick="btnSubmit_Click" />
                </div>

            </div>
        </div>
    </form>
</body>
</html>
