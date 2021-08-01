<%@ Page Title="Student" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="WebApplication1.Student" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" SelectCommand="SELECT [UnitCode] FROM [Units]"></asp:SqlDataSource>
        <asp:Label ID="Label8" runat="server" Visible="False" BorderColor="Red" ForeColor="Red"></asp:Label>
        <br style="background-color: #000000" />
        <span style="background-color: #FFFFFF">Manage results&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
    </p>
    <p>
        Unit Code:
        <asp:DropDownList ID="UnitCode" runat="server" DataSourceID="SqlDataSource1" DataTextField="UnitCode" DataValueField="UnitCode" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="UnitCode_SelectedIndexChanged" >
            <asp:ListItem Selected="True"></asp:ListItem>
        </asp:DropDownList>
        &nbsp;<asp:Label ID="Label14" runat="server" Visible="False" ForeColor="Red"></asp:Label>
    </p>
    <p>
        Student ID:
        <asp:TextBox ID="StudentID" runat="server" MaxLength="8" ></asp:TextBox>
    &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="**" Visible="False"></asp:Label>
&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="StudentID" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ValidationExpression="[0-9]{8}$" ForeColor="Red">Student id must be numeric and 8 digits in length </asp:RegularExpressionValidator>
    </p>
    <p>
        Semester:
        <asp:TextBox ID="Semester" runat="server" MaxLength="1"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="**" Visible="False"></asp:Label>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="Semester" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ValidationExpression="[0-9]{1}$" ForeColor="Red">Semester must be a number and 1 digit</asp:RegularExpressionValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="Semester" Display="Dynamic" ErrorMessage="RangeValidator" MaximumValue="2" MinimumValue="1" ForeColor="Red">Semester must either 1 or 2</asp:RangeValidator>
    </p>
    <p>
        Year:
        <asp:TextBox ID="Year" runat="server" MaxLength="4"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Text="**" Visible="False"></asp:Label>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Year" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ValidationExpression="[0-9]{4}$" ForeColor="Red">Year must be a number and 4 digits</asp:RegularExpressionValidator>
    </p>
    <p>
        Assignment_1<asp:TextBox ID="Assignement_1_Score" runat="server" MaxLength="2"></asp:TextBox>
&nbsp;
        <asp:Label ID="Label5" runat="server" Text="**" Visible="False"></asp:Label>
&nbsp;&nbsp;
        &nbsp;
        <asp:Label ID="Label10" runat="server" Visible="False" ForeColor="Red"></asp:Label>
        &nbsp;
        &nbsp;&nbsp;&nbsp;
        <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="Assignement_1_Score" Display="Dynamic" ErrorMessage="Not in valid format" Operator="DataTypeCheck" Type="Integer" ForeColor="Red"></asp:CompareValidator>
    </p>
    <p>
        Assignment_2<asp:TextBox ID="Assignment_2_Score" runat="server" MaxLength="2"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label6" runat="server" Text="**" Visible="False"></asp:Label>
        &nbsp;&nbsp;
        &nbsp;&nbsp;<asp:Label ID="Label11" runat="server" Visible="False" ForeColor="Red"></asp:Label>
&nbsp;
        <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="Assignment_2_Score" Display="Dynamic" ErrorMessage="Not in valid format" Operator="DataTypeCheck" Type="Integer" ForeColor="Red"></asp:CompareValidator>
    </p>
    <p>
        &nbsp;<asp:Label ID="Label9" runat="server"></asp:Label>
&nbsp;<asp:TextBox ID="A3" runat="server" MaxLength="2">0</asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label12" runat="server" Visible="False" ForeColor="Red"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="A3" Display="Dynamic" ErrorMessage="Not in valid format" Operator="DataTypeCheck" Type="Integer" ForeColor="Red"></asp:CompareValidator>
    </p>
    <p>
        Exam Score:<asp:TextBox ID="Exam_Score" runat="server" MaxLength="2"></asp:TextBox>
        &nbsp;&nbsp;<asp:Label ID="Label7" runat="server" Text="**" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;
        <asp:Label ID="Label13" runat="server" Visible="False" ForeColor="Red"></asp:Label>
&nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="Exam_Score" Display="Dynamic" ErrorMessage="Not in valid format" Operator="DataTypeCheck" Type="Integer" ForeColor="Red"></asp:CompareValidator>
        </p>
    <p>
        <asp:FileUpload ID="FileUpload2" runat="server" />
        <asp:Label ID="Label15" runat="server" Text="File is in the wrong format, must be image" ForeColor="Red"></asp:Label>
        </p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Button" Width="208px" OnClick="Button1_Click" />
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" InsertCommand="INSERT INTO Unit_Results(UnitCode, StudentID, Semester, Year, Assignment_1_Score, Assignment_2_Score, A3, Exam_Score, [File]) VALUES (@UnitCode, @StudentID, @Semester, @Year, @Assignment_1_Score, @Assignment_2_Score, @A3, @Exam_Score, @File)" SelectCommand="SELECT [UnitCode], [StudentID], [Semester], [Year], [Assignment_1_Score], [File], [Assignment_2_Score], [A3], [Exam_Score], [CaseID] FROM [Unit_Results] WHERE (([A3] = @A3) AND ([Assignment_1_Score] = @Assignment_1_Score) AND ([Assignment_2_Score] = @Assignment_2_Score) AND ([Exam_Score] = @Exam_Score) AND ([Semester] = @Semester) AND ([StudentID] = @StudentID) AND ([UnitCode] = @UnitCode) AND ([Year] = @Year) AND ([File] = @File))">
            <InsertParameters>
                <asp:ControlParameter ControlID="UnitCode" Name="UnitCode" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="StudentID" Name="StudentID" PropertyName="Text" />
                <asp:ControlParameter ControlID="Semester" Name="Semester" PropertyName="Text" />
                <asp:ControlParameter ControlID="Year" Name="Year" PropertyName="Text" />
                <asp:ControlParameter ControlID="Assignement_1_Score" Name="Assignment_1_Score" PropertyName="Text" />
                <asp:ControlParameter ControlID="Assignment_2_Score" Name="Assignment_2_Score" PropertyName="Text" />
                <asp:ControlParameter ControlID="A3" Name="A3" PropertyName="Text" DefaultValue="0" />
                <asp:ControlParameter ControlID="Exam_Score" Name="Exam_Score" PropertyName="Text" />
                <asp:ControlParameter ControlID="FileUpload2" Name="File" PropertyName="FileBytes" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="A3" Name="A3" PropertyName="Text" Type="Int32" DefaultValue="0" />
                <asp:ControlParameter ControlID="Assignement_1_Score" Name="Assignment_1_Score" PropertyName="Text" Type="Int32" DefaultValue="" />
                <asp:ControlParameter ControlID="Assignment_2_Score" Name="Assignment_2_Score" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="Exam_Score" Name="Exam_Score" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="Semester" Name="Semester" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="StudentID" Name="StudentID" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="UnitCode" Name="UnitCode" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="Year" Name="Year" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="FileUpload2" Name="File" PropertyName="FileBytes" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:LoginCon %>" DeleteCommand="DELETE FROM [Unit_Results] WHERE [CaseID] = @original_CaseID" InsertCommand="INSERT INTO [Unit_Results] ([UnitCode], [StudentID], [Semester], [Year], [Assignment_1_Score], [Assignment_2_Score], [A3], [Exam_Score],[File]) VALUES (@UnitCode, @StudentID, @Semester, @Year, @Assignment_1_Score, @Assignment_2_Score, @A3, @Exam_Score,@File)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [UnitCode], [StudentID], [Semester], [Year], [Assignment_1_Score], [Assignment_2_Score], [A3], [Exam_Score],[File], [CaseID] FROM [Unit_Results]" UpdateCommand="UPDATE [Unit_Results] SET [UnitCode] = @UnitCode, [StudentID] = @StudentID, [Semester] = @Semester, [Year] = @Year, [Assignment_1_Score] = @Assignment_1_Score, [Assignment_2_Score] = @Assignment_2_Score, [A3] = @A3, [Exam_Score] = @Exam_Score WHERE [CaseID] = @original_CaseID AND [UnitCode] = @original_UnitCode AND [StudentID] = @original_StudentID AND [Semester] = @original_Semester AND [Year] = @original_Year AND [Assignment_1_Score] = @original_Assignment_1_Score AND [Assignment_2_Score] = @original_Assignment_2_Score AND (([A3] = @original_A3) OR ([A3] IS NULL AND @original_A3 IS NULL)) AND [Exam_Score] = @original_Exam_Score">
            <DeleteParameters>
                <asp:Parameter Name="original_CaseID" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UnitCode" Type="String" />
                <asp:Parameter Name="StudentID" Type="Int32" />
                <asp:Parameter Name="Semester" Type="Int32" />
                <asp:Parameter Name="Year" Type="Int32" />
                <asp:Parameter Name="Assignment_1_Score" Type="Int32" />
                <asp:Parameter Name="Assignment_2_Score" Type="Int32" />
                <asp:Parameter Name="A3" Type="String" />
                <asp:Parameter Name="Exam_Score" Type="Int32" />
                <asp:Parameter Name="File" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UnitCode" />
                <asp:Parameter Name="StudentID" />
                <asp:Parameter Name="Semester" />
                <asp:Parameter Name="Year" />
                <asp:Parameter Name="Assignment_1_Score" />
                <asp:Parameter Name="Assignment_2_Score" />
                <asp:Parameter Name="A3" />
                <asp:Parameter Name="Exam_Score" />
                <asp:Parameter Name="original_CaseID" />
                <asp:Parameter Name="original_UnitCode" />
                <asp:Parameter Name="original_StudentID" />
                <asp:Parameter Name="original_Semester" />
                <asp:Parameter Name="original_Year" />
                <asp:Parameter Name="original_Assignment_1_Score" />
                <asp:Parameter Name="original_Assignment_2_Score" />
                <asp:Parameter Name="original_A3" />
                <asp:Parameter Name="original_Exam_Score" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="CaseID" DataSourceID="SqlDataSource8" ForeColor="Black" GridLines="Vertical" Height="281px" Width="703px">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" OnClick="LinkButton1_Click" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this?');" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="UnitCode" SortExpression="UnitCode">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource9" DataTextField="UnitCode" DataValueField="UnitCode" SelectedValue='<%# Bind("UnitCode") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" SelectCommand="SELECT [UnitCode] FROM [Units]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("UnitCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="StudentID" SortExpression="StudentID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("StudentID") %>' MaxLength="8"></asp:TextBox>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Range is not in valid format" ValidationExpression="[0-9]{8}$" ForeColor="Red"></asp:RegularExpressionValidator>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("StudentID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Semester" SortExpression="Semester">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Semester") %>' MaxLength="2"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Not in Valid format" ValidationExpression="[0-9]{1}$" ForeColor="Red"></asp:RegularExpressionValidator>
                        <br />
                        <asp:RangeValidator ID="RangeValidator5" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Range is not in a valid format" MaximumValue="2" MinimumValue="1" ForeColor="Red"></asp:RangeValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Semester") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Year" SortExpression="Year">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Year") %>' MaxLength="4"></asp:TextBox>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="Not in valid format" ValidationExpression="[0-9]{4}$" ForeColor="Red"></asp:RegularExpressionValidator>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Year") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Assignment_1_Score" SortExpression="Assignment_1_Score">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" MaxLength="2" Text='<%# Bind("Assignment_1_Score") %>'></asp:TextBox>
                        <br />
                        <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Datatype is wrong" Operator="DataTypeCheck" Type="Integer" ForeColor="Red"></asp:CompareValidator>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Required Field " ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Assignment_1_Score") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Assignment_2_Score" SortExpression="Assignment_2_Score">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" MaxLength="2" Text='<%# Bind("Assignment_2_Score") %>'></asp:TextBox>
                        <br />
                        <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="Data type is wrong" Operator="DataTypeCheck" Type="Integer" ForeColor="Red"></asp:CompareValidator>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Assignment_2_Score") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="A3" SortExpression="A3">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" MaxLength="2" Text='<%# Bind("A3") %>'></asp:TextBox>
                        <br />
                        <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="TextBox7" Display="Dynamic" ErrorMessage="Data type is wrong" Operator="DataTypeCheck" Type="Integer" ForeColor="Red"></asp:CompareValidator>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox7" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("A3") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Exam_Score" SortExpression="Exam_Score">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" MaxLength="2" Text='<%# Bind("Exam_Score") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="Required" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="Data type is wrong" Operator="DataTypeCheck" Type="Integer" ForeColor="#FF3300"></asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Exam_Score") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Image">
                    <EditItemTemplate>
                        <asp:FileUpload ID="FileUpload3" runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image2" runat="server" Height="150px" Width="229px"
                        ImageUrl='<%# "data:Image/png;base64,"+ Convert.ToBase64String((byte[])Eval("File")) %>'     />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CaseID" HeaderText="CaseID" InsertVisible="False" ReadOnly="True" SortExpression="CaseID" Visible="False" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="Gray" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
    </p>
    
</asp:Content>
