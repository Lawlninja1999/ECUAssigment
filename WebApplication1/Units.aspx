<%@ Page Title="Units" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Units.aspx.cs" Inherits="WebApplication1.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:LoginCon %>" DeleteCommand="DELETE FROM [Units] WHERE [UnitID] = @original_UnitID " InsertCommand="INSERT INTO [Units] ([UnitCode], [UnitTitle], [Coodinator], [A1], [A2], [A3], [Exam], [Number]) VALUES (@UnitCode, @UnitTitle, @Coodinator, @A1, @A2, @A3, @Exam, @Number)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [UnitCode], [UnitTitle], [Coodinator], [A1], [A2], [A3], [Exam], [Number],[File],[UnitID] FROM [Units]" UpdateCommand="UPDATE [Units] SET [UnitCode] = @UnitCode, [UnitTitle] = @UnitTitle, [Coodinator] = @Coodinator, [A1] = @A1, [A2] = @A2, [A3] = @A3, [Exam] = @Exam, [Number] = @Number WHERE [UnitID] = @original_UnitID AND [UnitCode] = @original_UnitCode AND [UnitTitle] = @original_UnitTitle AND [Coodinator] = @original_Coodinator AND [A1] = @original_A1 AND [A2] = @original_A2 AND (([A3] = @original_A3) OR ([A3] IS NULL AND @original_A3 IS NULL)) AND (([Exam] = @original_Exam) OR ([Exam] IS NULL AND @original_Exam IS NULL)) AND [Number] = @original_Number">
            <DeleteParameters>
                <asp:Parameter Name="original_UnitID" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UnitCode" Type="String" />
                <asp:Parameter Name="UnitTitle" Type="String" />
                <asp:Parameter Name="Coodinator" Type="String" />
                <asp:Parameter Name="A1" Type="String" />
                <asp:Parameter Name="A2" Type="String" />
                <asp:Parameter Name="A3" Type="String" />
                <asp:Parameter Name="Exam" Type="String" />
                <asp:Parameter Name="Number" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UnitCode" Type="String" />
                <asp:Parameter Name="UnitTitle" Type="String" />
                <asp:Parameter Name="Coodinator" Type="String" />
                <asp:Parameter Name="A1" Type="String" />
                <asp:Parameter Name="A2" Type="String" />
                <asp:Parameter Name="A3" Type="String" />
                <asp:Parameter Name="Exam" Type="String" />
                <asp:Parameter Name="Number" Type="String" />
                <asp:Parameter Name="original_UnitID" Type="Int32" />
                <asp:Parameter Name="original_UnitCode" Type="String" />
                <asp:Parameter Name="original_UnitTitle" Type="String" />
                <asp:Parameter Name="original_Coodinator" Type="String" />
                <asp:Parameter Name="original_A1" Type="String" />
                <asp:Parameter Name="original_A2" Type="String" />
                <asp:Parameter Name="original_A3" Type="String" />
                <asp:Parameter Name="original_Exam" Type="String" />
                <asp:Parameter Name="original_Number" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:Label ID="Label2" runat="server" Visible="False" ForeColor="Red"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label11" runat="server" Text="Assignment 1,2 or Exam is nill" ForeColor="Red"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label12" runat="server" Text="Assignment 3  is null" ForeColor="Red"></asp:Label>
    </p>
    <p>
        Add Unit details<br />
    </p>
    <p style="font-size: medium; font-family: Arial; font-style: italic; font-weight: normal; color: #000000; background-color: #FFFFFF">
        Unit Code:
        <asp:TextBox ID="UnitCode" runat="server" MaxLength="7"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="Not Valid" ForeColor="#CC0000"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="UnitCode" ErrorMessage="RegularExpressionValidator" ValidationExpression="^[A-Za-z]{3}[0-9]{4}$" Display="Dynamic" ForeColor="Red">Unit codes cannot be blank and must be 7 characters in length and be in the format aaa1111</asp:RegularExpressionValidator>
&nbsp;
    </p>
    <p>
        Unit Title:
        <asp:TextBox ID="UnitTitle" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server" Text="Not Valid" ForeColor="Red"></asp:Label>
&nbsp;&nbsp;&nbsp;
    </p>
    <p>
        coordinator:
        <asp:TextBox ID="Coordinator" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label6" runat="server" Text="Not Valid" ForeColor="Red"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        How many Assignments<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Selected="True" Value="2"></asp:ListItem>
            <asp:ListItem Value="3"></asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        <asp:Label ID="Label7" runat="server" Text="Assignment 1"></asp:Label>
        <asp:TextBox ID="A1" runat="server" Width="43px"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="A1" Display="Dynamic" ErrorMessage="Not in valid format" Operator="DataTypeCheck" Type="Integer" ForeColor="Red"></asp:CompareValidator>
    </p>
    <p>
        <asp:Label ID="Label8" runat="server" Text="Assignment 2"></asp:Label>
        <asp:TextBox ID="A2" runat="server" Width="40px"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToValidate="A2" Display="Dynamic" ErrorMessage="Not in valid format" Operator="DataTypeCheck" Type="Integer" ForeColor="Red"></asp:CompareValidator>
    </p>
    <p>
        <asp:Label ID="Label9" runat="server" Text="Assignment 3"></asp:Label>
        <asp:TextBox ID="A3" runat="server" Width="36px"></asp:TextBox>
&nbsp;
        <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="A3" Display="Dynamic" ErrorMessage="Not in valid format" Operator="DataTypeCheck" Type="Integer" ForeColor="Red"></asp:CompareValidator>
    </p>
    <p>
        Exam<asp:TextBox ID="Exam" runat="server" Width="33px"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="Exam" Display="Dynamic" ErrorMessage="Not in valid format" Operator="DataTypeCheck" Type="Integer" ForeColor="Red"></asp:CompareValidator>
    </p>
    <p>
        <asp:FileUpload ID="FileUpload2" runat="server" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Submit" runat="server" OnClick="Submit_Click" Text="Submit" Width="222px" />
    </p>
    <p>
        <asp:Label ID="Label14" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" InsertCommand="INSERT INTO Units(UnitCode, UnitTitle, Coodinator, A1, A2, A3, Exam, Number,[File]) VALUES (@UnitCode, @UnitTitle, @Coodinator, @A1, @A2, @A3, @Exam, @Number,@File)" SelectCommand="SELECT [UnitCode], [UnitTitle], [Coodinator], [A1], [A2], [A3], [Exam], [Number], [UnitID] FROM [Units]" OldValuesParameterFormatString="original_{0}">
            <InsertParameters>
                <asp:ControlParameter ControlID="UnitCode" Name="UnitCode" PropertyName="Text" />
                <asp:ControlParameter ControlID="UnitTitle" Name="UnitTitle" PropertyName="Text" />
                <asp:ControlParameter ControlID="Coordinator" Name="Coodinator" PropertyName="Text" />
                <asp:ControlParameter ControlID="A1" Name="A1" PropertyName="Text" />
                <asp:ControlParameter ControlID="A2" Name="A2" PropertyName="Text" />
                <asp:ControlParameter ControlID="A3" Name="A3" PropertyName="Text" />
                <asp:ControlParameter ControlID="Exam" Name="Exam" PropertyName="Text" />
                <asp:ControlParameter ControlID="DropDownList1" Name="Number" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="FileUpload2" Name="File" PropertyName="FileBytes" />
            </InsertParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:Label ID="Label13" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="UnitID" DataSourceID="SqlDataSource1" Width="540px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Height="341px">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" OnClick="LinkButton1_Click"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this?');" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="UnitCode" SortExpression="UnitCode">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" MaxLength="7" Text='<%# Bind("UnitCode") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox1" ErrorMessage="Required" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="aaa1111 format" ValidationExpression="^[A-Za-z]{3}[0-9]{4}$" ForeColor="Red"></asp:RegularExpressionValidator>
                        <br />
                        <br />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("UnitCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="UnitTitle" SortExpression="UnitTitle">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("UnitTitle") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("UnitTitle") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Coodinator" SortExpression="Coodinator">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Coodinator") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Required" ForeColor="#FF6600"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Coodinator") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="A1" SortExpression="A1">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" MaxLength="2" Text='<%# Bind("A1") %>'></asp:TextBox>
                        <br />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Must be a number" Operator="DataTypeCheck" Type="Integer" ForeColor="Red"></asp:CompareValidator>
                        <br />
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("A1") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="A2" SortExpression="A2">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" MaxLength="3" Text='<%# Bind("A2") %>'></asp:TextBox>
                        <br />
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="Must be a number" Operator="DataTypeCheck" Type="Integer" ForeColor="Red"></asp:CompareValidator>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("A2") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="A3" SortExpression="A3">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" MaxLength="3" Text='<%# Bind("A3") %>'></asp:TextBox>
                        <br />
                        <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="Must be number" Operator="DataTypeCheck" Type="Integer" ForeColor="Red"></asp:CompareValidator>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("A3") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Exam" SortExpression="Exam">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Exam") %>' MaxLength="3"></asp:TextBox>
                        <br />
                        <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="TextBox7" Display="Dynamic" ErrorMessage="Must be number" Operator="DataTypeCheck" Type="Integer" ForeColor="Red"></asp:CompareValidator>
                        <br />
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox7" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Exam") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Number" SortExpression="Number">
                    <EditItemTemplate>
                        How many Assignments?<br />
                        <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("Number") %>' >
                            <asp:ListItem Value="2"></asp:ListItem>
                            <asp:ListItem Value="3"></asp:ListItem>
                        </asp:DropDownList>
                        <br />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Number") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="File" SortExpression="File">
                    <EditItemTemplate>
                        <asp:FileUpload ID="FileUpload3" runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="181px" Width="350px" 
                     ImageUrl='<%# "data:Image/png;base64,"+ Convert.ToBase64String((byte[])Eval("File")) %>'        />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="UnitID" InsertVisible="False" SortExpression="UnitID" Visible="False">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("UnitID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("UnitID") %>'></asp:Label>
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
        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="UnitCode" DataValueField="UnitCode">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" SelectCommand="SELECT [UnitCode] FROM [Units]"></asp:SqlDataSource>
    </p>
    <p>
        Add Files</p>
    <p>
        <asp:FileUpload ID="FileUpload1" runat="server" />
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" Width="216px" />
    </p>
    <p>
        click link to download unit outline<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView2_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="File">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("File") %>' CommandName="Download" Text='<%# Eval("File") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FIle name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FIle size">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Size") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </p>
    <p>
        &nbsp;</p>
        
</asp:Content>
