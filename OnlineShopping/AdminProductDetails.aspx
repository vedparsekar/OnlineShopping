<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminProductDetails.aspx.cs" Inherits="OnlineShopping.AdminProductDetails" %>

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
        <div class="main-container cart-holder">
            <div class="main-content container">

                <div class="tabs-holder">
                    <asp:LinkButton ID="lbtnOrderDetails" class="tab" runat="server" OnClick="lbtnOrderDetails_Click">Order Details</asp:LinkButton>
                    <asp:LinkButton ID="lbtnProductDetails" class="tab active" runat="server" OnClick="lbtnProductDetails_Click">Product Details</asp:LinkButton>
                    <asp:LinkButton ID="lbtnUserDetails" class="tab" runat="server" OnClick="lbtnUserDetails_Click">User Details</asp:LinkButton>
                    <asp:LinkButton ID="lbtnSupplierDetails" class="tab" runat="server" OnClick="lbtnSupplierDetails_Click">Supplier Details</asp:LinkButton>
                    <asp:LinkButton ID="lbtnCategoryDetails" class="tab" runat="server" OnClick="lbtnCategoryDetails_Click">Category Details</asp:LinkButton>

                </div>

                <div class="search-filter-block d-flex align-items-center">
                    <div class="search mr-5 w-50">
                        <div class="form-group mb-0 d-flex px-5">
                            <asp:TextBox ID="txtSearch" placeholder="Enter text to Search" class="form-control" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearch" class="btn-pro btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click" />
                        </div>
                    </div>

                    <div class="search mr-5 w-50">
                        <div class="form-group mb-0 d-flex px-5">
                            <button runat="server" id="Button1" onserverclick="btnSortName" class="btn-pro btn-primary">
                                <i class="fa fa-sort-alpha-asc" aria-hidden="true"></i>
                                Name
                            </button>
                            <button runat="server" id="Button2" onserverclick="btnSortPrice" class="btn-pro btn-primary">
                                <i class="fa fa-sort-numeric-asc" aria-hidden="true"></i>
                                Price
                            </button>
                            <button runat="server" id="Button4" onserverclick="btnSortQuality" class="btn-pro btn-primary">
                                <i class="fa fa-sort-numeric-asc" aria-hidden="true"></i>
                                Quantity
                            </button>
                        </div>
             
                    </div>

                    <div class="search mr-5 w-50">
                        <div class="form-group mb-0 d-flex px-5">
                            <button runat="server" id="btnRun" onserverclick="btnAddProduct" class="btn-pro btn-primary">
                                <i class="fa fa-plus" aria-hidden="true"></i> Add Products
                            </button>
                        </div>
                    </div>
                </div>

                <div class="cart-product-detials-holder d-flex mx--15">
                    <div class="cart-product-holder w-70 px-15">
                        <asp:GridView ID="grdAdminProductDetails" runat="server"
                            CssClass="mydatagrid table table-striped table-bordered table-hover" PagerStyle-CssClass="pager"
                            HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PRODUCTID" OnPageIndexChanging="grdCartDetails_PageIndexChanging" Height="271px" Width="1121px" GridLines="None">
                            <Columns>
                                <%--<asp:TemplateField HeaderText="PRODUCT ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblProductId" runat="server" Text='<%# Eval("PRODUCTID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:BoundField DataField="PRODUCTNAME" HeaderText="PRODUCT NAME" ReadOnly="true" />
                                <asp:BoundField DataField="UNITPRICE" HeaderText="UNIT PRICE" ReadOnly="true" />
                                <asp:BoundField DataField="QUANTITY" HeaderText="QUANTITY" ReadOnly="true" />
                                <asp:BoundField DataField="CategoryId" HeaderText="CATEGORY ID" ReadOnly="true" />
                                <asp:BoundField DataField="SupplierId" HeaderText="SUPPLIER ID" ReadOnly="true" />

                                <asp:CommandField CausesValidation="False" EditText='<i class="fa fa-pencil-square-o" aria-hidden="true"></i>' ShowEditButton="True">

                                    <ItemStyle ForeColor="#469EFF" Font-Size="Larger" />
                                </asp:CommandField>
                                <asp:CommandField CausesValidation="False" ShowDeleteButton="True" DeleteText='<i class="fa fa-trash" aria-hidden="true"></i>'>

                                    <ItemStyle ForeColor="#FF7171" Font-Size="Larger" />
                                </asp:CommandField>

                            </Columns>
                            <HeaderStyle CssClass="header" />
                            <PagerStyle CssClass="pager" />
                            <RowStyle CssClass="rows" />

                        </asp:GridView>
                        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                    </div>

                </div>
            </div>
        </div>
    </form>
</body>
</html>
