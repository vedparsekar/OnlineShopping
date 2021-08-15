<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminOrderDetails.aspx.cs" Inherits="OnlineShopping.AdminOrderDetails" %>

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
                    <asp:LinkButton ID="lbtnOrderDetails" class="tab active" runat="server" OnClick="lbtnOrderDetails_Click">Order Details</asp:LinkButton>
                    <asp:LinkButton ID="lbtnProductDetails" class="tab" runat="server" OnClick="lbtnProductDetails_Click">Product Details</asp:LinkButton>
                    <asp:LinkButton ID="lbtnUserDetails" class="tab" runat="server" OnClick="lbtnUserDetails_Click">User Details</asp:LinkButton>
                    <asp:LinkButton ID="lbtnSupplierDetails" class="tab" runat="server" OnClick="lbtnSupplierDetails_Click">Supplier Details</asp:LinkButton>
                    <asp:LinkButton ID="lbtnCategoryDetails" class="tab" runat="server" OnClick="lbtnCategoryDetails_Click">Category Details</asp:LinkButton>

                </div>

                <div class="search-filter-block d-flex align-items-center">
                    <div class="search mr-5 w-50">
                        <div class="form-group mb-0 d-flex px-5">
                            <input type="email" placeholder="Enter text to Search" class="form-control" />
                            <asp:Button ID="btnSearch" class="btn-pro btn-primary" runat="server" Text="Search"/>
                        </div>
                    </div>
                </div>


                <div class="cart-product-detials-holder d-flex mx--15">
                    <div class="cart-product-holder w-70 px-15">
                        <asp:GridView ID="grdAdminProductDetails" runat="server"
                            CssClass="mydatagrid table table-striped table-bordered table-hover" PagerStyle-CssClass="pager"
                            HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="OrderId" Height="271px" Width="1074px" GridLines="None">
                            <Columns>
                                <asp:TemplateField HeaderText="ORDER ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblProductId" runat="server" Text='<%# Eval("OrderId") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="UserName" HeaderText="USERNAME" ReadOnly="true" />
                                <asp:BoundField DataField="FirstName" HeaderText="FIRST NAME" ReadOnly="true" />
                                <asp:BoundField DataField="LastName" HeaderText="LAST NAME" ReadOnly="true" />
                                <asp:BoundField DataField="EmailId" HeaderText="EMAILID" ReadOnly="true" />
                                <asp:BoundField DataField="OrderId" HeaderText="CONTACT NO" ReadOnly="true" />
                                <asp:BoundField DataField="State" HeaderText="ADDRESS" ReadOnly="true" />
                                <asp:BoundField DataField="City" HeaderText="CITY" ReadOnly="true" />
                                <asp:BoundField DataField="Total" HeaderText="TOTAL" ReadOnly="true" />
                                <asp:BoundField DataField="Payment" HeaderText="PAYMENT" ReadOnly="true" />
                                <asp:BoundField DataField="HasShifted" HeaderText="SHIFTED" ReadOnly="true" />

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
