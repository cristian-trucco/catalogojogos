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
    public partial class Catalago : System.Web.UI.Page
    {
        private JogosBo _jogosBo;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CarregarJogosNoRepeater();
            }
        }

            private void CarregarJogosNoRepeater()
            {
                _jogosBo = new JogosBo();
                RepeaterJogos.DataSource = _jogosBo.ObterTodosOsJogos();
                RepeaterJogos.DataBind();
            }
        }
    }
