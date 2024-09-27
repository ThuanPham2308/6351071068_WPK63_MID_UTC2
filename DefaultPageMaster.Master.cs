using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using de1.App_Data;

namespace de1
{
    public partial class DefaultPageMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Kiểm tra nếu không phải là postback
            if (!IsPostBack)
            {
                // Sử dụng context để truy vấn dữ liệu từ cơ sở dữ liệu
                using (var context = new QLKhoaHocEntities())
                {
                    // Truy vấn danh mục cùng với số lượng đồ uống tương ứng
                    var categoriesWithCoursesCount = from c in context.Categories
                                                      join b in context.Courses on c.CatID equals b.CatID into courses
                                                      select new
                                                      {
                                                          c.CatID,
                                                          c.CatName,
                                                          CourseCount = courses.Count()
                                                      };

                    // Gán kết quả vào DataList
                    DataList1.DataSource = categoriesWithCoursesCount.ToList();
                    DataList1.DataBind();
                }
            }
        }
    }
}
