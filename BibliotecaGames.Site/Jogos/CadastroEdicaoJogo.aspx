<%@ Page Title="" Language="C#" MasterPageFile="~/Jogos/SiteMasterPage.Master" AutoEventWireup="true" CodeBehind="CadastroEdicaoJogo.aspx.cs" Inherits="BibliotecaGames.Site.Jogos.CadastroEdicaoJogo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="form-group">
        <label for="exampleInputEmail">Título</label>
        <asp:TextBox runat="server" ID="TxtTitulo" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RfvTitulo" runat="server" ControlToValidate="TxtTitulo" ErrorMessage="É necessário preencher o campo Título" Text="*"></asp:RequiredFieldValidator>
    </div>

    <div class="form-group">
        <label for="exampleInputEmail">Valor Pago</label>
        <asp:TextBox runat="server" ID="TxtValorPago" CssClass="form-control" TextMode="Number"></asp:TextBox>

    </div>

    <div class="form-group">
        <label for="exampleInputEmail">Data Compra</label>
        <asp:TextBox runat="server" ID="TxtDataCompra" TextMode="Date" CssClass="form-control"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="exampleInputEmail">Imagem</label>
        <asp:FileUpload ID="FileUpLoadImage" runat="server" CssClass="form-control" />
    </div>

    <div class="form-group">
        <label for="exampleInputEmail">Gênero</label>
        <asp:DropDownList ID="DdlGenero" runat="server" DataValueField="Id" DataTextField="Descricao" CssClass="form-control"></asp:DropDownList>
        <asp:RequiredFieldValidator ID="RfvGenero" runat="server" ControlToValidate="DdlGenero" ErrorMessage="É necessário preencher o campo Gênero" Text="*"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <label for="exampleInputEmail">Editor</label>
        <asp:DropDownList ID="DdlEditor" runat="server" DataValueField="Id" DataTextField="Nome" CssClass="form-control"></asp:DropDownList>
        <asp:RequiredFieldValidator ID="RfvEditor" runat="server" ControlToValidate="DdlEditor" ErrorMessage="É necessário preencher o campo Editor" Text="*"></asp:RequiredFieldValidator>
    </div>

        <asp:ValidationSummary ID="valSum" DisplayMode="BulletList" EnableClientScript="true" ForeColor="Red" HeaderText="Deve preencher todos os campos"
            runat="server" /> 
    <br />
    
    <asp:Label runat="server" ID="LblMensagem"></asp:Label>
     <asp:Button ID="BtnGravar" Text="Gravar" CssClass="btn btn-primary" runat="server" OnClick="BtnGravar_Click1" />

    <a href="Catalago.aspx">Voltar ao catálogo de jogos</a>
</asp:Content>
