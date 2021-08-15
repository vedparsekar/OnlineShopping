<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProductDetail.aspx.cs" Inherits="OnlineShopping.AddProductDetail" %>

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
            <asp:LinkButton ID="btnAddProduct" class="tab active" runat="server" OnClick="btnAddProduct_Click">Add Products</asp:LinkButton>
            <asp:LinkButton ID="btnAddCategory" class="tab" runat="server" OnClick="btnAddCategory_Click">Add Category</asp:LinkButton>
            <asp:LinkButton ID="btnAddSupplier" class="tab" runat="server" OnClick="btnAddSupplier_Click">Add Supplier</asp:LinkButton>
        </div>
        <div class="main-container form-holder">
            <div class="main-content container">
                <div class="form-heder">
                    ADD PRODUCT
                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtProductName" type="text" placeholder="Enter Product Name" class="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtProductDecription" type="text" placeholder="Enter Decription" class="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" class="form-control" Text="Upload Image"></asp:Label>
                    <asp:FileUpload ID="fulImage" class="form-control" runat="server" />

                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtPrice" type="text" placeholder="Enter Price" class="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtCategoryId" type="text" placeholder="Enter Category Id" class="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtSupplierId" type="text" placeholder="Enter Supplier id" class="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:DropDownList ID="drpQuantity" runat="server" class="form-control">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblError" runat="server" class="form-control" ForeColor="Red"></asp:Label>
                </div>

                <div classname="btn-holder mb-4">
                    <asp:Button ID="btnSubmit" runat="server" Text="ADD PRODUCT" class="w-100 btn btn-primary" OnClick="btnSubmit_Click" />
                </div>

            </div>
        </div>
    </form>
</body>
</html>
