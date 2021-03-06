using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using BAL;

public partial class Appointment : System.Web.UI.Page
{
    BLL obj = new BLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            binddoctor();
            txt_date.Text = DateTime.Now.ToString("dd/MM/yyyy");
        }
    }
    public void binddoctor()
    {
        DataSet ds = obj.BindDDPDoctor();
        drp_doctor.DataTextField = "Name";
        drp_doctor.DataValueField = "id";
        drp_doctor.DataSource = ds;
        drp_doctor.DataBind();
    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date < DateTime.Today)
        {
            e.Cell.Font.Italic = true;
            e.Cell.Font.Size = FontUnit.Small;
            e.Day.IsSelectable = false;
            e.Cell.BackColor = System.Drawing.Color.Gray;
            e.Cell.BorderColor = System.Drawing.Color.Gray;
            e.Cell.ForeColor = System.Drawing.Color.Wheat;
            e.Cell.Font.Name = "Courier New";
        }
        if (e.Day.Date.DayOfWeek != DayOfWeek.Sunday) return;
        {
            e.Cell.ApplyStyle(new Style { BackColor = System.Drawing.Color.IndianRed });
            e.Day.IsSelectable = false;
        }
    }
    protected void myBtn_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        myModal.Attributes.Add("style", "display:block");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        myModal.Attributes.Add("style", "display:none");
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        txt_date.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy"); 
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string nam = txt_name.Text;
        string email = txt_mail.Text;
        string dat = txt_date.Text;
        string tim = drp_time.SelectedItem.Text + sec.Text;
        string di = drp_doctor.SelectedValue.ToString();
        string dna = drp_doctor.SelectedItem.Text;
        string msg = txt_msg.Text;

        int i = obj.appointment(nam, email, dat, tim, di, dna, msg);
        if (i > 0)
        {
            Label1.Text = "Items saved Sucessfully";
            clear();
        }
        else
        {
            Label1.Text = "Error";
            clear();
        }
    }
    public void clear()
    {
        txt_date.Text = "";
        txt_mail.Text = "";
        txt_msg.Text = "";
        txt_name.Text = "";
        sec.Text = "00";
        drp_time.ClearSelection();
        drp_doctor.ClearSelection();
    }
}