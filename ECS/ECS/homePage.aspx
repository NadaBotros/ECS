<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homePage.aspx.cs" Inherits="ECS.homePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .container{
            width: 400px;
            padding: 12px 20px;
            margin-left:36%;
            /*background-color:aqua;*/
          
        }
        .styled-table {
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 0.9em;
            font-family: sans-serif;
            min-width: 400px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        }
        .styled-table thead tr {
            background-color: #009879;
            color: #ffffff;
            text-align: left;
        }
        .styled-table th,
        .styled-table td {
            padding: 12px 15px;
        }
        .styled-table tbody tr {
             border-bottom: 1px solid #dddddd;
        }

        .styled-table tbody tr:nth-of-type(even) {
            background-color: #f3f3f3;
        }

        .styled-table tbody tr:last-of-type {
            border-bottom: 2px solid #009879;
        }

        .bn {
          background-image: linear-gradient(135deg, #008aff, #86d472);
          border-radius: 6px;
          box-sizing: border-box;
          color: #ffffff;
          display: block;
          height: 50px;
          font-size: 1.4em;
          font-weight: 600;
          padding: 4px;
          position: relative;
          text-decoration: none;
          width: 7em;
          z-index: 2;
        }

        .bn:hover {
          color: #fff;
        }

        .bn .bnspan {
          align-items: center;
          background: #0e0e10;
          border-radius: 6px;
          display: flex;
          justify-content: center;
          height: 100%;
          transition: background 0.5s ease;
          width: 100%;
        }

        .bn:hover .bnspan {
          background: transparent;
        }
        /*.....*/
        .form-style-5{
	        max-width: 500px;
	        padding: 10px 20px;
	        background: #f4f7f8;
	        margin: 10px auto;
	        padding: 20px;
	        background: #f4f7f8;
	        border-radius: 8px;
	        font-family: Georgia, "Times New Roman", Times, serif;
        }
        .form-style-5 fieldset{
	        border: none;
        }
        .form-style-5 legend {
	        font-size: 1.4em;
	        margin-bottom: 10px;
        }
        .form-style-5 label {
	        display: block;
	        margin-bottom: 8px;
        }
        .form-style-5 input[type="text"],
        .form-style-5 input[type="number"],
        .form-style-5 textarea{
	        font-family: Georgia, "Times New Roman", Times, serif;
	        background: rgba(255,255,255,.1);
	        border: none;
	        border-radius: 4px;
	        font-size: 15px;
	        margin: 0;
	        outline: 0;
	        padding: 10px;
	        width: 100%;
	        box-sizing: border-box; 
	        -webkit-box-sizing: border-box;
	        -moz-box-sizing: border-box; 
	        background-color: #e8eeef;
	        color:#8a97a0;
	        -webkit-box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
	        box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
	        margin-bottom: 30px;
        }
        .form-style-5 input[type="text"]:focus,
        .form-style-5 input[type="number"]:focus,
        .form-style-5 textarea:focus{
	        background: #d2d9dd;
        }

        .form-style-5 .number {
	        background: #1abc9c;
	        color: #fff;
	        height: 30px;
	        width: 30px;
	        display: inline-block;
	        font-size: 0.8em;
	        margin-right: 4px;
	        line-height: 30px;
	        text-align: center;
	        text-shadow: 0 1px 0 rgba(255,255,255,0.2);
	        border-radius: 15px 15px 15px 0px;
        }

        .form-style-5 input[type="submit"],
        .form-style-5 input[type="button"]
        {
	        position: relative;
	        display: block;
	        padding: 19px 39px 18px 39px;
	        color: #FFF;
	        margin: 0 auto;
	        background: #1abc9c;
	        font-size: 18px;
	        text-align: center;
	        font-style: normal;
	        width: 100%;
	        border: 1px solid #16a085;
	        border-width: 1px 1px 3px;
	        margin-bottom: 10px;
        }
        .form-style-5 input[type="submit"]:hover,
        .form-style-5 input[type="button"]:hover
        {
	        background: #109177;
        }
    
    </style>
</head>
<body>
         <form id="form1" runat="server">
            <div class="container">
   
            <%if (Session["UserName"].ToString().Split('_')[1] == "admin"){%>

                   <label style="text-align:center;font-size:40px"> MEALS </label>
                   <div class="form-style-5">
                      <form>
                          <fieldset>
                                    <legend><span class="number">1</span> Add New Meal For today</legend>
                                    <input type="text" name="txtMeal" runat="server" id="txtMeal" placeholder="Add New Meal"/>
                          
                                </fieldset>
                                <asp:Button runat="server" type="submit" OnClick="Button2_Click" Text="Add Meal" />

                       </form>
                     </div>


            <%}else{ %>

                   <label style="text-align:center;font-size:40px"> MEALS OF TODAY </label>


              <%} %>


              <table class="styled-table">

                  <thead>
                       <th>Id</th>
                       <th>mealName</th>
                       <th>OrderButtons</th>
                  </thead>
                  <tbody>
                  
                      <%if (this.ds.Tables[0].Rows.Count != 0)
                          { %>
                            <%foreach (System.Data.DataRow dr in this.ds.Tables[0].Rows)
                                {%>
                                <tr id="<%=dr["mealId"] %>" class= "<%=dr["mealId"] %>">
                                   
                                    <td><%=dr["mealId"] %></td>
                                    <td><%=dr["mealName"] %></td>
                          
                                    <td> 
                                        <input type="button" value="Order" onclick="EditRecordForEditDemo(this)" />
                                        <asp:Button runat="server" ID="btnSample" ClientIDMode="Static" Text="" style="display:none;" OnClick="Order_Meal" />
                                    </td>
                                </tr>
                            <% } %>
                      <%} %>
                   </tbody>
               </table>
                <asp:Label ID="test" runat="server" Text="" ></asp:Label>
               <asp:HiddenField runat="server" ID="Hidden1" />


           

            </div>
        </form>

  

</body>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
      
        function EditRecordForEditDemo(element) {
            var rowJavascript = element.parentNode.parentNode;
            var trclass = $(element).closest('tr').attr('class'); // table row ID

           
            hidden = document.getElementById("Hidden1");
            hidden.value = trclass;
            document.getElementById("btnSample").click();


            //alert("JavaScript Row Index : " + (rowJavascript.rowIndex - 1) + "\njQuery Row Index : " + (rowjQuery[0].rowIndex - 1));

        }

      
    </script>
    
</html>
