using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DxExample {
    public partial class WebForm1 : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }
        protected void cbAll_Init(object sender, EventArgs e) {
            ASPxCheckBox chk = sender as ASPxCheckBox;
            chk.Checked = (ASPxCardView1.Selection.Count == ASPxCardView1.VisibleCardCount);
        }
        protected void ASPxCardView1_CustomJSProperties(object sender, ASPxCardViewClientJSPropertiesEventArgs e) {
            ASPxCardView cv = sender as ASPxCardView;
            e.Properties["cpVisibleCardCount"] = cv.VisibleCardCount;
        }
    }
}