<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="WebForm1.aspx.vb" Inherits="DxExample.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<script type="text/javascript">
		function OnAllCheckedChanged(s, e) {
			if (s.GetChecked())
				cv.SelectCards();
			else
				cv.UnselectCards();
		}

		function OnCardSelectionChanged(s, e) {
			cbAll.SetChecked(s.GetSelectedCardCount() == s.cpVisibleCardCount);
		}
	</script>
	<style type="text/css">
		.InfoDiv {
			text-align: right !important;
		}
	</style>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<dx:ASPxCardView ID="ASPxCardView1" runat="server" DataSourceID="AccessDataSource1" OnCustomJSProperties="ASPxCardView1_CustomJSProperties" ClientInstanceName="cv" KeyFieldName="ProductID">
				<SettingsPager Visible="true"></SettingsPager>
				<Settings ShowTitlePanel="true" />
				<ClientSideEvents SelectionChanged="OnCardSelectionChanged" />
				<Columns>
					<dx:CardViewTextColumn FieldName="ProductID"></dx:CardViewTextColumn>
					<dx:CardViewTextColumn FieldName="SupplierID"></dx:CardViewTextColumn>
					<dx:CardViewTextColumn FieldName="QuantityPerUnit"></dx:CardViewTextColumn>
					<dx:CardViewTextColumn FieldName="UnitPrice"></dx:CardViewTextColumn>
				</Columns>
				<Templates>
					<TitlePanel>
						<div class="InfoDiv">
							<dx:ASPxLabel ID="lblInfo" ClientInstanceName="info" runat="server" Text="Select All" />
							<dx:ASPxCheckBox ID="cbAll" runat="server" ClientInstanceName="cbAll" ToolTip="Select all rows" BackColor="White" OnInit="cbAll_Init">
								<ClientSideEvents CheckedChanged="OnAllCheckedChanged" />
							</dx:ASPxCheckBox>
						</div>
					</TitlePanel>
				</Templates>
				<CardLayoutProperties>
					<Items>
						<dx:CardViewCommandLayoutItem ShowEditButton="true" ShowSelectCheckbox="true" ColSpan="1" HorizontalAlign="Right">
						</dx:CardViewCommandLayoutItem>
						<dx:CardViewColumnLayoutItem ColumnName="ProductID" />
						<dx:CardViewColumnLayoutItem ColumnName="SupplierID" />
						<dx:CardViewColumnLayoutItem ColumnName="QuantityPerUnit" />
						<dx:CardViewColumnLayoutItem ColumnName="UnitPrice" />
					</Items>
				</CardLayoutProperties>
				<Settings ShowFilterBar="Visible" ShowHeaderFilterButton="True" ShowHeaderPanel="true" />
				<SettingsBehavior AllowSelectByCardClick="true" />
				<SettingsSearchPanel Visible="true" />
				<SettingsPager AlwaysShowPager="True">
					<SettingsTableLayout RowsPerPage="2" />
				</SettingsPager>
			</dx:ASPxCardView>
			<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Northwind.mdb"
				SelectCommand="SELECT [ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock] FROM [Products]"></asp:AccessDataSource>
		</div>
	</form>
</body>
</html>