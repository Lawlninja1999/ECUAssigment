<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="WebApplication1.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        Choose UnitCode:
    </p>
    <p>
        Enter Year, semester or studentID:
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Textbox can be studetID, Year or semster" ValidationExpression="^[0-9]{0,8}$" BackColor="White" CssClass="active" ForeColor="Red"></asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:TextBox ID="TextBox1" runat="server" Width="158px" BorderStyle="Groove" CssClass="active" MaxLength="8"></asp:TextBox>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="Dropdown" DataTextField="UnitCode" DataValueField="UnitCode" AppendDataBoundItems="True">
            <asp:ListItem Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="Dropdown" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" SelectCommand="SELECT [UnitCode] FROM [Units]"></asp:SqlDataSource>
        <asp:CheckBox ID="CheckBox1" runat="server" Text="View all" />
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Button" Width="157px" OnClick="Button1_Click" />
    </p>
    <p>
        <asp:Label ID="Label1" runat="server" Visible="False" ForeColor="Red"></asp:Label>
    &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Visible="False" ForeColor="Red"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Visible="False" ForeColor="Red"></asp:Label>
    </p>
    <p>
        *** When searched click select and switch the dropdown list to discover your grade for that unit***</p>
<p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="all" ForeColor="Black" GridLines="Vertical" Width="397px" AllowSorting="True" DataKeyNames="CaseID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="UnitCode" HeaderText="UnitCode" SortExpression="UnitCode" />
            <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
            <asp:BoundField DataField="Semester" HeaderText="Semester" SortExpression="Semester" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            <asp:BoundField DataField="Assignment_1_Score" HeaderText="Assignment_1_Score" SortExpression="Assignment_1_Score" />
            <asp:BoundField DataField="Assignment_2_Score" HeaderText="Assignment_2_Score" SortExpression="Assignment_2_Score" />
            <asp:BoundField DataField="A3" HeaderText="A3" SortExpression="A3" />
            <asp:BoundField DataField="Exam_Score" HeaderText="Exam_Score" SortExpression="Exam_Score" />
            <asp:TemplateField HeaderText="Student Photo" SortExpression="File">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("File") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="88px" ImageUrl='<%# "data:Image/png;base64,"+ Convert.ToBase64String((byte[])Eval("File")) %>' Width="124px" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Header">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="codeandyear" ForeColor="Black" GridLines="Vertical" AllowSorting="True" DataKeyNames="CaseID" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="UnitCode" HeaderText="UnitCode" SortExpression="UnitCode" />
                <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
                <asp:BoundField DataField="Semester" HeaderText="Semester" SortExpression="Semester" />
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                <asp:BoundField DataField="Assignment_1_Score" HeaderText="Assignment_1_Score" SortExpression="Assignment_1_Score" />
                <asp:BoundField DataField="Assignment_2_Score" HeaderText="Assignment_2_Score" SortExpression="Assignment_2_Score" />
                <asp:BoundField DataField="A3" HeaderText="A3" SortExpression="A3" />
                <asp:BoundField DataField="Exam_Score" HeaderText="Exam_Score" SortExpression="Exam_Score" />
                <asp:TemplateField HeaderText="Student Photo" SortExpression="File">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("File") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image2" runat="server" Height="76px" ImageUrl='<%# "data:Image/png;base64,"+ Convert.ToBase64String((byte[])Eval("File")) %>' Width="153px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
    </p>
    <p>
        <asp:GridView ID="GridView3" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="Semandcode" ForeColor="Black" GridLines="Vertical" DataKeyNames="CaseID" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="UnitCode" HeaderText="UnitCode" SortExpression="UnitCode" />
                <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
                <asp:BoundField DataField="Semester" HeaderText="Semester" SortExpression="Semester" />
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                <asp:BoundField DataField="Assignment_1_Score" HeaderText="Assignment_1_Score" SortExpression="Assignment_1_Score" />
                <asp:BoundField DataField="Assignment_2_Score" HeaderText="Assignment_2_Score" SortExpression="Assignment_2_Score" />
                <asp:BoundField DataField="A3" HeaderText="A3" SortExpression="A3" />
                <asp:BoundField DataField="Exam_Score" HeaderText="Exam_Score" SortExpression="Exam_Score" />
                <asp:TemplateField HeaderText="Student Photo" SortExpression="File">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("File") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image3" runat="server" Height="67px" ImageUrl='<%# "data:Image/png;base64,"+ Convert.ToBase64String((byte[])Eval("File")) %>' Width="135px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
    </p>
    <p>
        <asp:GridView ID="GridView4" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="Studentandcode" ForeColor="Black" GridLines="Vertical" DataKeyNames="CaseID" OnSelectedIndexChanged="GridView4_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="UnitCode" HeaderText="UnitCode" SortExpression="UnitCode" />
                <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
                <asp:BoundField DataField="Semester" HeaderText="Semester" SortExpression="Semester" />
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                <asp:BoundField DataField="Assignment_1_Score" HeaderText="Assignment_1_Score" SortExpression="Assignment_1_Score" />
                <asp:BoundField DataField="Assignment_2_Score" HeaderText="Assignment_2_Score" SortExpression="Assignment_2_Score" />
                <asp:BoundField DataField="A3" HeaderText="A3" SortExpression="A3" />
                <asp:BoundField DataField="Exam_Score" HeaderText="Exam_Score" SortExpression="Exam_Score" />
                <asp:TemplateField HeaderText="Student Photo" SortExpression="File">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("File") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image4" runat="server" Height="81px" ImageUrl='<%# "data:Image/png;base64,"+ Convert.ToBase64String((byte[])Eval("File")) %>' Width="131px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
</p>
    <p>
        <asp:GridView ID="GridView5" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="textbox" ForeColor="Black" GridLines="Vertical" DataKeyNames="CaseID" OnSelectedIndexChanged="GridView5_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="UnitCode" HeaderText="UnitCode" SortExpression="UnitCode" />
                <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
                <asp:BoundField DataField="Semester" HeaderText="Semester" SortExpression="Semester" />
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                <asp:BoundField DataField="Assignment_1_Score" HeaderText="Assignment_1_Score" SortExpression="Assignment_1_Score" />
                <asp:BoundField DataField="Assignment_2_Score" HeaderText="Assignment_2_Score" SortExpression="Assignment_2_Score" />
                <asp:BoundField DataField="A3" HeaderText="A3" SortExpression="A3" />
                <asp:BoundField DataField="Exam_Score" HeaderText="Exam_Score" SortExpression="Exam_Score" />
                <asp:TemplateField HeaderText="Student Photo" SortExpression="File">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("File") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image5" runat="server" Height="65px" ImageUrl='<%# "data:Image/png;base64,"+ Convert.ToBase64String((byte[])Eval("File")) %>' Width="134px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
</p>
    <p>
        <asp:GridView ID="GridView6" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="unitcode" ForeColor="Black" GridLines="Vertical" DataKeyNames="CaseID" OnSelectedIndexChanging="GridView6_SelectedIndexChanging">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="UnitCode" HeaderText="UnitCode" SortExpression="UnitCode" />
                <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
                <asp:BoundField DataField="Semester" HeaderText="Semester" SortExpression="Semester" />
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                <asp:BoundField DataField="Assignment_1_Score" HeaderText="Assignment_1_Score" SortExpression="Assignment_1_Score" />
                <asp:BoundField DataField="Assignment_2_Score" HeaderText="Assignment_2_Score" SortExpression="Assignment_2_Score" />
                <asp:BoundField DataField="A3" HeaderText="A3" SortExpression="A3" />
                <asp:BoundField DataField="Exam_Score" HeaderText="Exam_Score" SortExpression="Exam_Score" />
                <asp:TemplateField HeaderText="Student Photo" SortExpression="File">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("File") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image6" runat="server" Height="64px" ImageUrl='<%# "data:Image/png;base64,"+ Convert.ToBase64String((byte[])Eval("File")) %>' Width="132px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
</p>
    <p>
        <asp:SqlDataSource ID="all" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" SelectCommand="SELECT [UnitCode], [StudentID], [Semester], [Year], [Assignment_1_Score], [Assignment_2_Score], [A3], [Exam_Score], [File], [CaseID] FROM [Unit_Results]"></asp:SqlDataSource>
</p>
    <p>
        <asp:SqlDataSource ID="Semandcode" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Unit_Results]">
        </asp:SqlDataSource>
</p>
    <p>
        <asp:SqlDataSource ID="unitcode" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [UnitCode], [StudentID], [Semester], [Year], [Assignment_1_Score], [Assignment_2_Score], [Exam_Score],[A3],[File],[CaseID] FROM [Unit_Results] WHERE ([UnitCode] = @UnitCode)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="UnitCode" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
    <asp:SqlDataSource ID="textbox" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [UnitCode], [StudentID],  [Semester], [Year], [Assignment_1_Score], [Assignment_2_Score],[Exam_Score],[A3], [File],[CaseID] FROM [Unit_Results] WHERE (([StudentID] = @StudentID) or ([Year] = @Year) or ([Semester] = @Semester))">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="StudentID" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="TextBox1" Name="Year" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="TextBox1" Name="Semester" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <p>
        <asp:SqlDataSource ID="codeandyear" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Unit_Results]">
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:SqlDataSource ID="Studentandcode" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [UnitCode], [StudentID], [Semester], [Year], [Assignment_1_Score], [Assignment_2_Score], [Exam_Score],[A3],[File], [CaseID] FROM [Unit_Results] WHERE (([StudentID] = @StudentID) AND ([UnitCode] = @UnitCode))">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="StudentID" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownList1" Name="UnitCode" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
            </Columns>
            <EmptyDataTemplate>
                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Column1") %>'></asp:Label>
            </EmptyDataTemplate>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" SelectCommand="Select Avg (Assignment_1_Score+Exam_Score+Assignment_2_Score+A3) From Unit_Results Where CaseID =@CaseID Group By CaseID">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="CaseID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:DropDownList ID="DropDownList7" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Column1" DataValueField="Column1" OnSelectedIndexChanged="DropDownList7_SelectedIndexChanged">
            <asp:ListItem Selected="True"></asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        <asp:GridView ID="GridView8" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" SelectCommand="Select Avg (Assignment_1_Score+Exam_Score+Assignment_2_Score+A3) From Unit_Results Where CaseID =@CaseID Group By CaseID">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView2" Name="CaseID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:DropDownList ID="DropDownList6" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Column1" DataValueField="Column1" OnSelectedIndexChanged="DropDownList6_SelectedIndexChanged">
            <asp:ListItem Selected="True"></asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        <asp:GridView ID="GridView9" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
            <Columns>
                <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" SelectCommand="Select Avg (Assignment_1_Score+Exam_Score+Assignment_2_Score+A3) From Unit_Results Where CaseID =@CaseID Group By CaseID">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView3" Name="CaseID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:DropDownList ID="DropDownList5" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Column1" DataValueField="Column1" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged">
            <asp:ListItem Selected="True"></asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        <asp:GridView ID="GridView10" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
            <Columns>
                <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" SelectCommand="Select Avg (Assignment_1_Score+Exam_Score+Assignment_2_Score+A3) From Unit_Results Where CaseID =@CaseID Group By CaseID">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView4" Name="CaseID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:DropDownList ID="DropDownList4" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="Column1" DataValueField="Column1" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged">
            <asp:ListItem Selected="True"></asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        <asp:GridView ID="GridView11" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource5">
            <Columns>
                <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" SelectCommand="Select Avg (Assignment_1_Score+Exam_Score+Assignment_2_Score+A3) From Unit_Results Where CaseID =@CaseID Group By CaseID">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView5" Name="CaseID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="Column1" DataValueField="Column1" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
            <asp:ListItem Selected="True"></asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        <asp:GridView ID="GridView12" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource6">
            <Columns>
                <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" SelectCommand="Select Avg (Assignment_1_Score+Exam_Score+Assignment_2_Score+A3) From Unit_Results Where CaseID =@CaseID Group By CaseID">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView6" Name="CaseID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource6" DataTextField="Column1" DataValueField="Column1" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
            <asp:ListItem Selected="True"></asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        <asp:Label ID="Label5" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Refresh page</asp:LinkButton>
    </p>
    </asp:Content>
