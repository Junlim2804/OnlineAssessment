using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class lecturerHeader : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Menu1_MenuItemDataBound(object sender, MenuEventArgs e)
        {
            if (e.Item.DataItem != null && ((SiteMapNode)e.Item.DataItem).Roles.Count > 0 && HttpContext.Current.User.Identity.IsAuthenticated)
            {
                string role = "lecturer";
                if (role.Length > 0)
                {
                    if (!((SiteMapNode)e.Item.DataItem).Roles.Contains(role) && !((SiteMapNode)e.Item.DataItem).Roles.Contains("*"))
                    {
                        if (e.Item.Parent != null)
                            e.Item.Parent.ChildItems.Remove(e.Item);
                        else
                            Menu1.Items.Remove(e.Item);
                    }
                }
            }
        }
    }
}