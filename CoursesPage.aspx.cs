using System;
using System.Web.UI;

namespace de1
{
    public partial class CoursesPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string category = Request.QueryString["category"];
                if (!string.IsNullOrEmpty(category))
                {
                    // Thiết lập tham số cho EntityDataSource
                    EntityDataSource1.WhereParameters["category"].DefaultValue = category;
                }
            }
        }
    }
}
