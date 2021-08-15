<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="OnlineShopping.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home page</title>
    <script src="Scripts/jquery-3.5.1.js"></script>
    <script src="Scripts/jquery-ui.js"></script>
    <link href="Content/jquery-ui.css" rel="stylesheet" />
    <link href="Style/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <%--<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>--%>
    <link rel="Stylesheet" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.10/themes/redmond/jquery-ui.css" />
    <link href="Style/style.css" rel="stylesheet" />

    <script type="text/javascript">
        $(function () {
            ProdAutoComplete();
        });

        function ProdAutoComplete() {
            $(<%=txtProductSearch.ClientID%>).autocomplete({
                autoFocus: true,
                source: function (request, response) {
                    $.ajax({
                        url: '/Index.aspx/FetchProductNames',
                        data: "{'stext': '" + request.term + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            response($.map(data.d.ProductNames, function (item) {
                                return {
                                    label: item
                                }
                            }))
                        },

                    });
                },
                //minLength to specify after how many characters input call for suggestions to be made.
                minLength: 1,
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header-holder">
            <div class="header-content container">
                <div class="header-logo">
                    <img src="Images/logo1.png" style="width: 110px" />
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
                            <asp:LinkButton ID="lbtnUsername" CssClass="dropdown-toggle" runat="server">Vedparsekar</asp:LinkButton>
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
        <div class="main-container homepage-holder">
            <div class="main-content container">
                <div class="product-card-holder">
                    <asp:DataList ID="dtlProducts" runat="server" CellPadding="3" CellSpacing="2" RepeatColumns="3" RepeatDirection="Horizontal" Width="100%" OnItemCommand="dtlGetProductView_ItemCommand" OnSelectedIndexChanged="dtlGetProductView_SelectedIndexChanged" Style="left: 71px; top: 154px; position: absolute; height: 593px; width: 1203px" BorderStyle="None">
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <ItemTemplate>
                            <table style="width: 100%; text-align: center; font-size: medium">
                                <tr>
                                    <td>
                                        <asp:Image ID="imgProdView" runat="server" Width="250" ImageUrl='<%#("Images/")+Eval("ImagePath")%>' />
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblName" runat="server" Text="ProductName: "></asp:Label>
                                        <asp:Label ID="lblProdName" runat="server" Text='<%#Eval("ProductName")%>'></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPrice" runat="server" Text="Price: ₹"></asp:Label>
                                        <asp:Label ID="lblProdPrice" runat="server" Text='<%#Eval("UnitPrice")%>'></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="Available Stock: "></asp:Label>
                                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("Quantity")%>'></asp:Label>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="lbtnProdView" runat="server" CommandName="ViewProduct" CommandArgument='<%#Eval("ProductId")%>'>View</asp:LinkButton>

                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="lbtnAddToCart" runat="server" CommandName="AddToCart" CommandArgument='<%#Eval("ProductId")%>'><i class="fa fa-shopping-cart" aria-hidden="true"></i> Add To Cart</asp:LinkButton>

                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>

                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
