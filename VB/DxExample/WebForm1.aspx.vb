Imports DevExpress.Web
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Namespace DxExample
	Partial Public Class WebForm1
		Inherits System.Web.UI.Page

		Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

		End Sub
		Protected Sub cbAll_Init(ByVal sender As Object, ByVal e As EventArgs)
			Dim chk As ASPxCheckBox = TryCast(sender, ASPxCheckBox)
			chk.Checked = (ASPxCardView1.Selection.Count = ASPxCardView1.VisibleCardCount)
		End Sub
		Protected Sub ASPxCardView1_CustomJSProperties(ByVal sender As Object, ByVal e As ASPxCardViewClientJSPropertiesEventArgs)
			Dim cv As ASPxCardView = TryCast(sender, ASPxCardView)
			e.Properties("cpVisibleCardCount") = cv.VisibleCardCount
		End Sub
	End Class
End Namespace