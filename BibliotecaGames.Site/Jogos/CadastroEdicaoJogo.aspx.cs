using BibliotecaGames.BLL;
using BibliotecaGames.BLL.Autenticacao;
using BibliotecaGames.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BibliotecaGames.Site.Jogos
{
    public partial class CadastroEdicaoJogo : System.Web.UI.Page
    {
        private GeneroBo _generoBo;
        private EditorBo _editorBo;
        private JogosBo _jogosBo;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CarregarEditoresNaCombo();
                CarregarGenerosNaCombo();
            }
        }

        private void CarregarEditoresNaCombo()
        {
            _editorBo = new EditorBo();
            var editores = _editorBo.ObterTodosOsEditores();

            DdlEditor.DataSource = editores;
            DdlEditor.DataBind();
        }
        private void CarregarGenerosNaCombo()
        {
            _generoBo = new GeneroBo();
            var generos = _generoBo.ObterTodosOsGeneros();

            DdlGenero.DataSource = generos;
            DdlGenero.DataBind();
        }

        protected void BtnGravar_Click1(object sender, EventArgs e)
        {
            _jogosBo = new JogosBo();

            var jogo = new Jogo();

            jogo.Titulo = TxtTitulo.Text;
            jogo.ValorPago = string.IsNullOrWhiteSpace(TxtValorPago.Text) ? (double?)null : Convert.ToDouble(TxtValorPago.Text);
            jogo.DataCompra = string.IsNullOrWhiteSpace(TxtDataCompra.Text) ? (DateTime?)null : Convert.ToDateTime(TxtDataCompra.Text);

            try
            {
                jogo.Imagem = GravarImagemNoDisco();
            }
            catch 
            {

                LblMensagem.Text = "Ocorreu um erro ao carregar a imagem do jogo!";
            }
            

            jogo.IdEditor = Convert.ToInt32(DdlEditor.SelectedValue);
            jogo.IdGenero = Convert.ToInt32(DdlEditor.SelectedValue);

            try
            {

                _jogosBo.InserirNovoJogo(jogo);
                LblMensagem.Text = "Jogo cadastrado com sucesso!";
                BtnGravar.Enabled = false;

            }
            catch
            {
                LblMensagem.Text = "Ocorreu um erro ao gravar o jogo!";

            }
        }

        private string GravarImagemNoDisco()
        {
            if (FileUpLoadImage.HasFile)
            {
                try
                {
                    var caminho = $"{AppDomain.CurrentDomain.BaseDirectory}Content\\ImagensJogos\\";
                    var fileName = $"{DateTime.Now.ToString("yyyyMMddhhmmss")}_{FileUpLoadImage.FileName}";
                    FileUpLoadImage.SaveAs($"{caminho}{fileName}");
                    return fileName;
                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
            else
            {
                return null;
            }
        }
    }
}