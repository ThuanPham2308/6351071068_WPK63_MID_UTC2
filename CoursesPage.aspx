<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultPageMaster.Master" AutoEventWireup="true" CodeBehind="CoursesPage.aspx.cs" Inherits="de1.CoursesPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:EntityDataSource ID="EntityDataSource1" runat="server"
    ConnectionString="name=QLKhoaHocEntities"
    DefaultContainerName="QLKhoaHocEntities"
    EnableFlattening="False"
    EntitySetName="Courses"
    Where="it.Category.CatName == @category">
    <WhereParameters>
        <asp:Parameter Name="category" Type="String" DefaultValue="" />
    </WhereParameters>
</asp:EntityDataSource>


    <asp:ListView ID="ListView1" runat="server" DataSourceID="EntityDataSource1">
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0">
                            <tr runat="server">
                                <th runat="server">Name</th>
                                <th runat="server">Image</th>
                                <th runat="server">Duration</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server">
                        <asp:DataPager ID="DataPager1" PageSize="3" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>

        <ItemTemplate>
            <tr>
                <td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                </td>
                <td>
                    <asp:Image ID="Image1" runat="server"
                        ImageUrl='<%# ResolveUrl("~/images/Courses/" + Eval("ImageFilePath")) %>'
                        Width="30px"
                        Height="40px" />
                </td>
                <td>
                    <asp:Label ID="DurationLabel" runat="server" Text='<%# Eval("Duration") %>' />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:HyperLink ID="ViewDetailLink" runat="server"
                        NavigateUrl='<%# "CourseDetail.aspx?courseName=" + Eval("Name") %>'
                        Text="View Detail" />
                </td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
