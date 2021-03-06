<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Appointment.aspx.cs" Inherits="Appointment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Make An Appointment</title>
    <!--<link href="Style/StyleSheet.css" type="text/css" rel="stylesheet" />
    <!--<script type="text/javascript" src="Script/script.js"></script>-->
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 30px;
        }
        .half {
            margin-left: 4px;
        }
/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 26%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td>Your Name</td>
                <td>:</td>
                <td>
                    <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txt_name" ForeColor="#CC0000" ValidationGroup="A"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Your Mail ID</td>
                <td>:</td>
                <td>
                    <asp:TextBox ID="txt_mail" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txt_mail" ForeColor="#CC0000" ValidationGroup="A"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Appointment Date</td>
                <td>:</td>
                <td>
                    <asp:TextBox ID="txt_date" ReadOnly="true" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txt_date" ForeColor="#CC0000" ValidationGroup="A"></asp:RequiredFieldValidator>
                    
                    <!-- Trigger/Open The Modal -->
                    <asp:Button ID="myBtn" runat="server" ValidationGroup="B" Text="Pick Date" OnClick="myBtn_Click" />
                    <asp:Panel ID="Panel1" runat="server" Visible="false">
                    <!-- The Modal -->
                    <div id="myModal" runat="server" class="modal">

                        <!-- Modal content -->
                        <div class="modal-content">
                            <div class="modal-header">
                                <span >                                
                                     <asp:Button ID="Button2" CssClass="close" runat="server" ValidationGroup="B" Text="&times;" OnClick="Button2_Click" />
</span>
                                <h2>Select Date</h2>
                            </div>
                            <div class="modal-body">
                                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="100%" Width="100%" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged">
                                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                    <NextPrevStyle VerticalAlign="Bottom" />
                                    <OtherMonthDayStyle ForeColor="#808080" />
                                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="Red" />
                                    <SelectorStyle BackColor="#CCCCCC" />
                                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                </asp:Calendar>
                            </div>
                        </div>

                    </div>
                        </asp:Panel>

                    <br />
                </td>
            </tr>
            <tr>
                <td>Appointment Time</td>
                <td>:</td>
                <td>
                    <asp:DropDownList ID="drp_time" runat="server" Width="46px">
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>&nbsp;hr<asp:TextBox ID="sec" runat="server" style="margin-left: 8px" TextMode="Number" Width="41px" Columns="1">00</asp:TextBox>
                    min<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="sec" ForeColor="#CC0000" ValidationGroup="A"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Time Between 9AM to 6PM" ForeColor="#CC0000" MaximumValue="60" MinimumValue="0" ControlToValidate="sec"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td>Doctor</td>
                <td>:</td>
                <td>
                    <asp:DropDownList ID="drp_doctor" runat="server" AppendDataBoundItems="True" CausesValidation="True" Height="16px" Width="124px">
                        <asp:ListItem>Select Doctor</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="drp_doctor" ForeColor="#CC0000" InitialValue="Select Doctor" ValidationGroup="A"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Message</td>
                <td class="auto-style2">:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txt_msg" runat="server" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txt_msg" ForeColor="#CC0000" ValidationGroup="A"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align:center">
                    <asp:Button ID="Button1" runat="server" Text="SAVE" ValidationGroup="A" OnClick="Button1_Click" />
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
   
</body>
</html>
