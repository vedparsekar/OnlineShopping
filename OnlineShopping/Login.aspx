<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineShopping.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
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
        <div class="main-container form-holder">
            <div class="main-content container">
                <div class="form-heder">
                    LOGIN TO YOUR ACCOUNT
                </div>

                <form>
                    <div class="form-group">
                        <asp:TextBox ID="txtUserName" placeholder="Enter Username" class="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" class="form-control" ErrorMessage="Enter Username" ControlToValidate="txtUserName" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:DropDownList ID="ddlUserRole" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" class="form-control" ErrorMessage="Select Role" ControlToValidate="ddlUserRole" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:TextBox ID="txtPassword" placeholder="Enter Password" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" class="form-control" ErrorMessage="Enter Password" ControlToValidate="txtPassword" ForeColor="Red" Font-Size="Small"></asp:RequiredFieldValidator>
                    </div>

                    <div classname="btn-holder mb-4">
                        <asp:Button ID="btnLoginbtn" class="w-100 btn btn-primary" runat="server" Text="Login" OnClick="btnLoginbtn_Click" />
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
                    </div>

                </form>
            </div>
        </div>
    </form>
</body>
</html>
