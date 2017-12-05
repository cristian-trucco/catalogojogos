﻿using BibliotecaGames.BLL.Expetions;
using BibliotecaGames.DAL;
using BibliotecaGames.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BibliotecaGames.BLL.Autenticacao
{
    public class LoginBo
    {
        private UsuarioDao _usuarioDao;
       
        public Usuario ObterUsuarioParaLogar(string nomeUsuario,string senha)
        {
            _usuarioDao = new UsuarioDao();

            var usuario = _usuarioDao.ObterUsuarioESenha(nomeUsuario, senha);

            if (usuario == null)
            {
                throw new UsuarioNaoCadastradoException();

            }
            else
                return usuario;
        }
    }
}
