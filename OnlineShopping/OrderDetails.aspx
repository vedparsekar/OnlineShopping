<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="OnlineShopping.OrderDetails" %>

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
                <div class="search-holder">
                    <div class="form-group">
                        <asp:TextBox ID="txtProductSearch" runat="server" class="form-control" placeholder="Search for products"></asp:TextBox>
                        <div class="btn-discover">
                            <asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/Images/search_icon.png" Style="height: 30px; width: 60px; padding: 1px" BorderStyle="None" ImageAlign="Middle" BackColor="#d4e6ff" OnClick="btnSearch_Click1" />
                        </div>
                    </div>
                </div>
                <div class="header-menu d-flex highlight">
                    <div class="menu-item">
                        <asp:LinkButton ID="btnHome" runat="server" OnClick="btnHome_Click">Home</asp:LinkButton>
                    </div>
                    <div class="menu-item">
                        <asp:LinkButton ID="btnAbout" runat="server" OnClick="btnAbout_Click">About</asp:LinkButton>
                    </div>
                    <div class="menu-item">
                        <asp:LinkButton ID="btnContact" runat="server" OnClick="btnContact_Click">Contact</asp:LinkButton>
                    </div>
                    <div class="menu-item">
                        <div class="dropdown">
                            <asp:LinkButton ID="LinkButton1" CssClass="dropdown-toggle" runat="server">Products <i class="fa fa-caret-down" aria-hidden="true"></i><span class="caret"></span></asp:LinkButton>
                            <ul class="dropdown-menu">
                                <li class="drp-style drp">
                                    <asp:LinkButton ID="btnAllCategories" Style="color: #307fe2;" runat="server" OnClick="btnAllCategories_Click">All</asp:LinkButton></li>
                                <li class="drp-style drp">
                                    <asp:LinkButton ID="btnCasualShoes" Style="color: #307fe2;" runat="server" OnClick="btnCasualShoes_Click">Casual Shoes</asp:LinkButton></li>
                                <li class="drp-style drp">
                                    <asp:LinkButton ID="btnSportsShoes" Style="color: #307fe2;" runat="server" OnClick="btnSportsShoes_Click">Sports Shoes</asp:LinkButton></li>
                                <li class="drp-style drp">
                                    <asp:LinkButton ID="btnFormalShoes" Style="color: #307fe2;" runat="server" OnClick="btnFormalShoes_Click">Formal Shoes</asp:LinkButton></li>
                                <li class="drp-style drp">
                                    <asp:LinkButton ID="btnSandalsFloaters" Style="color: #307fe2;" runat="server" OnClick="btnSandalsFloaters_Click">Sandals and Floaters</asp:LinkButton></li>
                                <li class="drp-style drp">
                                    <asp:LinkButton ID="btnSlippersflipflops" Style="color: #307fe2;" runat="server" OnClick="btnSlippersflipflops_Click">Slippers and Flip Flop</asp:LinkButton></li>
                            </ul>
                        </div>
                    </div>

                    <div id="loginDiv" runat="server" class="menu-item">
                        <div class="dropdown">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            <asp:LinkButton ID="lbtnUsername" CssClass="dropdown-toggle" runat="server"> Vedparsekar</asp:LinkButton>
                            <ul class="dropdown-menu">
                                <li class="drp-style drp-user">
                                    <asp:LinkButton ID="btnProfile" Style="color: #307fe2;" runat="server" OnClick="btnLogin_Click"><i class="fa fa-user" aria-hidden="true"></i> Profile</asp:LinkButton></li>
                                <li class="drp-style drp-user">
                                    <asp:LinkButton ID="btnSetting" Style="color: #307fe2;" runat="server" OnClick="btnCasualShoes_Click"><i class="fa fa-cog" aria-hidden="true"></i> Setting</asp:LinkButton></li>
                                <li class="drp-style drp-user">
                                    <asp:LinkButton ID="btnLogout" Style="color: #307fe2;" runat="server" OnClick="btnLogout_Click"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</asp:LinkButton></li>
                            </ul>
                        </div>
                    </div>

                    <div class="menu-item">
                        <i class="fa-li fa fa-check-square"></i>
                        <asp:LinkButton ID="btnLogin" CssClass="dropdown-toggle" runat="server" OnClick="btnLogin_Click"><i class="fa fa-user" aria-hidden="true"></i> Login</asp:LinkButton>

                    </div>
                    <div class="menu-item">
                        <asp:Button ID="btnSignup" runat="server" class=" btn-sign btn btn-white-outline" Text="Signup" OnClick="btnSignup_Click" />
                    </div>


                    <div class="menu-item cart">
                        <asp:LinkButton ID="btnCart" runat="server" OnClick="btnCart_Click"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Cart</asp:LinkButton>
                        <asp:Label ID="lblCartCount" class="cart-count" runat="server" Text="3"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div class="main-container cart-holder">
            <div class="main-content container">
                <div class="page-header-text">Orders</div>
                <asp:LinkButton ID="btnContinueShopping" class="btn btn-primary" runat="server" OnClick="btnContinueShopping_Click"><i class="fa fa-chevron-circle-left" aria-hidden="true"></i> Continue shopping</asp:LinkButton>
                <div class="cart-product-detials-holder d-flex mx--15">
                    <div class="cart-product-holder w-70 px-15">
                        <asp:GridView ID="grdCartDetails" runat="server"
                            CssClass="mydatagrid table table-striped table-bordered table-hover" PagerStyle-CssClass="pager"
                            HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="OrderDetailId" OnSelectedIndexChanged="grdCartDetails_PageIndexChanging" PageSize="8" OnPageIndexChanging="grdCartDetails_PageIndexChanging" OnSelectedIndexChanging="grdCartDetails_SelectedIndexChanging" OnRowDeleted="grdCartDetails_RowDeleted" OnRowDeleting="grdCartDetails_RowDeleting" OnRowEditing="grdCartDetails_RowEditing" OnRowUpdating="grdCartDetails_RowUpdating" OnRowCancelingEdit="grdCartDetails_RowCancelingEdit" Height="218px" Width="1019px" GridLines="None">
                            <Columns>
                               <%-- <asp:TemplateField HeaderText="PRODUCT ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblProductId" runat="server" Text='<%# Eval("PRODUCTID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:BoundField DataField="ProductName" HeaderText="PRODUCT" ReadOnly="true" />
                                <asp:BoundField DataField="UnitPrice" HeaderText="PRICE" ReadOnly="true" />
                                <asp:BoundField DataField="Quantity" HeaderText="QUANTITY" ReadOnly="true" />
                                <asp:BoundField DataField="CategoryId" HeaderText="CATEGORY" ReadOnly="true" />

                            </Columns>
                            <HeaderStyle CssClass="header" />
                            <PagerStyle CssClass="pager" />
                            <RowStyle CssClass="rows" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
