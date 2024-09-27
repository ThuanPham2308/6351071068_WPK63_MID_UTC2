<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultPageMaster.Master" AutoEventWireup="true" CodeBehind="CoursesPage.aspx.cs" Inherits="de1.CoursesPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:EntityDataSource ID="EntityDataSource1" runat="server"
        ConnectionString="name=QLKhoaHocEntities"
        DefaultContainerName="QLKhoaHocEntities"
        EnableFlattening="False"
        EntitySetName="Courses"
        Select="it.[Name], it.[ImageFilePath], it.[Duration]"
        OrderBy="it.[Name]">
    </asp:EntityDataSource>

    <asp:ListView ID="ListView1" runat="server" DataSourceID="EntityDataSource1">
      <AlternatingItemTemplate>
    <tr>
        <td>
            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
        </td>
        <td>
            <div class="course_image">
                <asp:Image ID="Image1" runat="server" 
                    ImageUrl='<%# ResolveUrl("~/images/Courses/" + Eval("ImageFilePath")) %>' 
                    Width="30px" 
                    Height="40px" />
            </div>
        </td>
        <td>
            <asp:Label ID="DurationLabel" runat="server" Text='<%# Eval("Duration") %>' />
        </td>
    </tr>
</AlternatingItemTemplate>

<ItemTemplate>
    <tr>
        <td>
            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
        </td>
        <td>
            <div class="course_image">
                <asp:Image ID="Image1" runat="server" 
                    ImageUrl='<%# ResolveUrl("~/images/Courses/" + Eval("ImageFilePath")) %>' 
                    Width="30px" 
                    Height="40px" />
            </div>
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


        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">Name</th>
                                <th runat="server">ImageFilePath</th>
                                <th runat="server">Duration</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" PageSize="3" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>

        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                </td>
                <td>
                    <div class="course_image">
                        <asp:Image ID="Image1" runat="server"
                            ImageUrl='<%# ResolveUrl("~/images/Courses/" + Eval("ImageFilePath")) %>'
                            Width="30px"
                            Height="40px" />
                    </div>
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
        </SelectedItemTemplate>
    </asp:ListView>
</asp:Content>
