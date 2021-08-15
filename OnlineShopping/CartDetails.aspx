<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CartDetails.aspx.cs" Inherits="OnlineShopping.CartDetails" %>

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
                <div class="page-header-text">Shopping Cart</div>
                <asp:LinkButton ID="btnContinueShopping" class="btn btn-primary" runat="server" OnClick="btnContinueShopping_Click"><i class="fa fa-chevron-circle-left" aria-hidden="true"></i> Continue shopping</asp:LinkButton>
                <div class="cart-product-detials-holder d-flex mx--15">
                    <div class="cart-product-holder w-70 px-15">
                        <asp:GridView ID="grdCartDetails" runat="server"
                            CssClass="mydatagrid table table-striped table-bordered table-hover" PagerStyle-CssClass="pager"
                            HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PRODUCTID" OnSelectedIndexChanged="grdCartDetails_PageIndexChanging" PageSize="5" OnPageIndexChanging="grdCartDetails_PageIndexChanging" OnSelectedIndexChanging="grdCartDetails_SelectedIndexChanging" OnRowDeleted="grdCartDetails_RowDeleted" OnRowDeleting="grdCartDetails_RowDeleting" OnRowEditing="grdCartDetails_RowEditing" OnRowUpdating="grdCartDetails_RowUpdating" OnRowCancelingEdit="grdCartDetails_RowCancelingEdit" Height="271px" OnPageIndexChanged="grdCartDetails_PageIndexChanged" Width="804px" GridLines="None">
                            <Columns>
                                <asp:TemplateField HeaderText="PRODUCT ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblProductId" runat="server" Text='<%# Eval("PRODUCTID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="PRODUCTNAME" HeaderText="PRODUCT NAME" ReadOnly="true" />
                                <asp:BoundField DataField="UNITPRICE" HeaderText="UNIT PRICE" ReadOnly="true" />
                                <asp:TemplateField HeaderText="QUANTITY">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtQuantity" min="1" Max="10" Type="number" runat="server" Text='<%# Eval("QUANTITY") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="PRODUCTTOTAL" HeaderText="TOTAL" ReadOnly="true" />

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
                    <div class="car-detials-holder w-30 px-15">
                        <asp:LinkButton ID="lbtnHistory" class="btn btn-primary" runat="server" OnClick="lbtnHistory_Click"><i class="fa fa-history" aria-hidden="true"></i> Order Histroy</asp:LinkButton>

                        <div class="px-15 car-detials box-shadow">
                            <div class="sub-header-text p-10">
                                Price Details
                            </div>
                            <div class="d-flex align-items-center justify-content-between f-15 p-10">
                                <div class="primary-color">Price (
                                    <asp:Label ID="lblcount" runat="server" Text="0"></asp:Label>
                                    item)</div>
                                <div class="d-flex align-items-center">
                                    <span class="icon icon-rupee">
                                        <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                                            xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="401.998px"
                                            height="401.998px" viewBox="0 0 401.998 401.998"
                                            style="enable-background: new 0 0 401.998 401.998;" xml:space="preserve">
                                            <g>
                                                <path
                                                    d="M326.62,91.076c-1.711-1.713-3.901-2.568-6.563-2.568h-48.82c-3.238-15.793-9.329-29.502-18.274-41.112h66.52
c2.669,0,4.853-0.856,6.57-2.565c1.704-1.712,2.56-3.903,2.56-6.567V9.136c0-2.666-0.855-4.853-2.56-6.567
C324.334,0.859,322.15,0,319.481,0H81.941c-2.666,0-4.853,0.859-6.567,2.568c-1.709,1.714-2.568,3.901-2.568,6.567v37.972
c0,2.474,0.904,4.615,2.712,6.423s3.949,2.712,6.423,2.712h41.399c40.159,0,65.665,10.751,76.513,32.261H81.941
c-2.666,0-4.856,0.855-6.567,2.568c-1.709,1.715-2.568,3.901-2.568,6.567v29.124c0,2.664,0.855,4.854,2.568,6.563
c1.714,1.715,3.905,2.568,6.567,2.568h121.915c-4.188,15.612-13.944,27.506-29.268,35.691
c-15.325,8.186-35.544,12.279-60.67,12.279H81.941c-2.474,0-4.615,0.905-6.423,2.712c-1.809,1.809-2.712,3.951-2.712,6.423v36.263
c0,2.478,0.855,4.571,2.568,6.282c36.543,38.828,83.939,93.165,142.182,163.025c1.715,2.286,4.093,3.426,7.139,3.426h55.672
c4.001,0,6.763-1.708,8.281-5.141c1.903-3.426,1.53-6.662-1.143-9.708c-55.572-68.143-99.258-119.153-131.045-153.032
c32.358-3.806,58.625-14.277,78.802-31.404c20.174-17.129,32.449-39.403,36.83-66.811h47.965c2.662,0,4.853-0.854,6.563-2.568
c1.715-1.709,2.573-3.899,2.573-6.563V97.646C329.193,94.977,328.335,92.79,326.62,91.076z" />
                                            </g>
                                        </svg>
                                    </span>
                                    <asp:Label ID="lblTotalPrice" runat="server" Text=""></asp:Label>
                                </div>
                            </div>

                            <div class="d-flex align-items-center justify-content-between f-15 p-10">
                                <div class="primary-color">Delivery Charges</div>
                                <div class="d-flex align-items-center">
                                    <span>free</span>
                                </div>
                            </div>
                            <div class="btn-holder p-10">
                                <asp:Button ID="btnCheckOut" class="btn btn-primary w-100" runat="server" Text="Proceed to Checkout" OnClick="btnCheckOut_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
