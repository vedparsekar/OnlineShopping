<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="OnlineShopping.Signup" %>

<%@ Register Src="~/UserControl/DateTimeCalender.ascx" TagPrefix="Odl" TagName="DateTimeCalender" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Style/style.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.5.1.js"></script>
    <script src="Scripts/jquery.validate.js"></script>
    <script src="Scripts/SignupPage.js"></script>
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
                    <div class="menu-item">
                        <i class="fa-li fa fa-check-square"></i>
                        <asp:LinkButton ID="btnLogin" CssClass="dropdown-toggle" runat="server" OnClick="btnLogin_Click"><i class="fa fa-user" aria-hidden="true"></i> Login</asp:LinkButton>
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
                    CREATE ACCOUNT
                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtUserName" type="text" placeholder="Enter User Name" class="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtFirstName" type="text" placeholder="Enter First Name" class="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtLastName" type="text" placeholder="Enter Last Name" class="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-control">
                    <asp:Label ID="lblGender" runat="server" Text="SelectGender"></asp:Label>
                    <asp:RadioButton ID="rdbMale" runat="server" Text="Male" GroupName="Gender" />
                    <asp:RadioButton ID="rdbFemale" runat="server" Text="Female" GroupName="Gender" />
                    <asp:RadioButton ID="rdbOther" runat="server" Text="Other" GroupName="Gender" />
                </div>
                <br />
                <div class="form-group">
                    <asp:TextBox ID="txtPhonenumber" type="text" placeholder="Enter Phone Number" class="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtAddress" type="text" placeholder="Enter Address" class="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtCity" type="text" placeholder="Enter city" class="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtState" type="text" placeholder="Enter State" class="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtZip" type="text" placeholder="Enter Zip" class="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtCountry" type="text" placeholder="Enter Country" class="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtEmail" type="email" placeholder="Enter Email" class="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <%--<asp:TextBox ID="txtDateOfBirth" type="date" placeholder="Enter dob"  class="form-control" runat="server"></asp:TextBox>--%>
                    <Odl:DateTimeCalender style="z-index:1;" ID="txtDateOfBirth" type="date" placeholder="Enter dob" class="form-control" runat="server"></Odl:DateTimeCalender>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtPassword" type="password" placeholder="Enter Password" class="form-control" runat="server"></asp:TextBox>

                </div>

                <div class="form-group">
                    <asp:TextBox ID="txtConfirmPassword" type="password" placeholder="Enter Password" class="form-control" runat="server"></asp:TextBox>

                </div>

                <div class="form-group">
                    <asp:DropDownList ID="ddlUserRole" runat="server" class="form-control">
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblError" runat="server" class="form-control" ForeColor="Red"></asp:Label>
                </div>

                <div classname="btn-holder mb-4">
                    <asp:Button ID="btnSubmit" runat="server" Text="Signup" class="w-100 btn btn-primary" OnClick="btnSubmit_Click" />
                </div>

            </div>
        </div>
    </form>
</body>
</html>
