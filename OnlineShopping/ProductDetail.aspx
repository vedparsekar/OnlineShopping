<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="OnlineShopping.ProductDetail" %>

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
                        <%--<asp:LinkButton ID="btnProduct" runat="server" OnClick="btnProduct_Click">Products</asp:LinkButton>--%>
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
                            <asp:LinkButton ID="lbtnUsername" CssClass="dropdown-toggle" runat="server"><i class="fa fa-user" aria-hidden="true"></i> Vedparsekar</asp:LinkButton>
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
        <div class="main-container product-details-holder">
            <div class="main-content container">
                <div class="product-details-content d-flex">

                    <div class="product-details w-60 px-15">
                        <div class="h-50">

                            <asp:FormView ID="fvProdDescription" runat="server" BackColor="White" BorderStyle="None" CellPadding="4" OnItemCommand="fvProdDescription_ItemCommand" OnPageIndexChanging="fvProdDescription_PageIndexChanging" Height="383px" Width="980px">
                                <EditRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#363535" />
                                <FooterStyle BackColor="#99CCCC" ForeColor="#363535" />
                                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#363535" />
                                <ItemTemplate>
                                    <table class="auto-style6">
                                        <tr>
                                            <td colspan="2">
                                                <asp:Label ID="lblProdName" Text='<%#Eval("ProductName") %>' runat="server" Style="text-align: center" Font-Bold="True" Font-Size="X-Large" ForeColor="#333333"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td rowspan="4">
                                                <asp:Image ID="imgProdImg" runat="server" ImageUrl='<%#("Images/")+Eval("ImagePath") %>' Width="400px" />
                                            </td>
                                            <td style="font-weight: bold;">Product Description:
                                            <asp:Label ID="lblProdDescription" Text='<%#Eval("ProductDescription") %>' runat="server" Style="font-weight: normal;" ForeColor="#333333" Font-Size="Medium"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="font-weight: bold;">Price:
                                            <asp:Label ID="lblPrice" Text='<%#Eval("UnitPrice") %>' runat="server" Style="font-weight: normal;" Font-Size="Medium" ForeColor="#333333"></asp:Label>
                                            </td>
                                        </tr>

                                    </table>
                                </ItemTemplate>
                                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                <RowStyle BackColor="White" ForeColor="#003399" />

                            </asp:FormView>
                        </div>

                        <div class="product-quantity form-group mt-10" style="margin-left: 410px; margin-top: 30px;">
                            <label style="font-weight: bold;">Quantity:</label>
                            <asp:DropDownList ID="drpQuantity" runat="server" Style="width: 80px; height: 30px; margin-top: 16px;">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList>

                        </div>
                        <br />
                        <br />
                        <br />
                        <div>
                            <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" class="btn btn-primary" CommandName="AddProduct" CommandArgument='<%#Eval("ProductId")%>' Font-Bold="True" BackColor="#307fe2" OnClick="btnAddtoCart_Click" />

                            <asp:Button ID="btnBuyNow" runat="server" Text="Buy Now" class="btn btn-outline-primary" CommandName="BuyNow" CommandArgument='<%#Eval("ProductId")%>' Font-Bold="True" BackColor="#307fe2" OnClick="btnBuyNow_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </form>
</body>
</html>
