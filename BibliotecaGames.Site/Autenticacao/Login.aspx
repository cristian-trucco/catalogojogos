<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BibliotecaGames.Site.Autenticacao.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        
            <div>Usuario:</div>
            <div>
                <asp:TextBox ID="TxtUsuario" runat="server"></asp:TextBox></div>
            <br />
            <div>Senha:</div>
          
                <asp:TextBox ID="TxtSenha" runat="server" TextMode="Password"></asp:TextBox><div>
                    <asp:Label runat="server" ID="LblStatus"></asp:Label>
                    <br />
                    <asp:Button ID="BtgLogin" Text="Entrar" runat="server" OnClick="BtgLogin_Click" /> 
        </div>
    </form>
</body>
</html>
